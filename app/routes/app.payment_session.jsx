import axios from "axios";
import { createPaymentSession } from "../payments.repository";
import prisma from "../db.server";
import CryptoJS from "crypto-js";

/**
 * Saves and starts a payment session.
 * Redirects back to shop if payment session was created.
 */
export const action = async ({ request }) => {
  const requestBody = await request.json();

  const shopDomain = request.headers.get("shopify-shop-domain");

  const paymentSession = await createPaymentSession(
    createParams(requestBody, shopDomain),
  );

  if (!paymentSession)
    throw new Response("A PaymentSession couldn't be created.", {
      status: 500,
    });

  return { redirect_url: await buildRedirectUrl(request, paymentSession) };
};

const createParams = (
  {
    id,
    gid,
    group,
    amount,
    currency,
    test,
    kind,
    customer,
    payment_method,
    proposed_at,
    cancel_url,
  },
  shopDomain,
) => ({
  id,
  gid,
  group,
  amount,
  currency,
  test,
  kind,
  customer,
  paymentMethod: payment_method,
  proposedAt: proposed_at,
  cancelUrl: cancel_url,
  shop: shopDomain,
});

function stringToFloat(str, currency) {
  const floatValue = parseFloat(str);
  if (currency === "USD") {
    return floatValue.toFixed(2);
  }
  if (currency === "JOD") {
    return floatValue.toFixed(3);
  }
}

const buildRedirectUrl = async (request, paymentSession) => {
  const merchantInfo = await prisma.configuration.findUnique({
    where: {
      shop: paymentSession.shop,
    },
  });
  if (merchantInfo) {
    const customer = JSON.parse(paymentSession.customer);
    const shopDomain = request.headers.get("shopify-shop-domain");
    const to_md5 =
      paymentSession.id +
      stringToFloat(paymentSession.amount, paymentSession.currency) +
      paymentSession.currency +
      paymentSession.kind +
      merchantInfo.merchantPass;

    var hash = CryptoJS.SHA1(CryptoJS.MD5(to_md5.toUpperCase()).toString());
    var result = CryptoJS.enc.Hex.stringify(hash);
    const todoObject = {
      merchant_key: merchantInfo.merchantKey,
      operation: "purchase",
      cancel_url: `https://${shopDomain}`,
      success_url: `https://${shopDomain}/app`,
      hash: result,
      order: {
        description: paymentSession.kind,
        number: paymentSession.id,
        amount: stringToFloat(paymentSession.amount, paymentSession.currency),
        currency: paymentSession.currency,
      },
      customer: {
        name: `${customer.billing_address.given_name} ${customer.billing_address.family_name}`,
        email: paymentSession.customer.email,
      },
    };
    try {
      const response = await fetch(
        "https://checkout.montypay.com/api/v1/session",
        {
          method: "POST",
          body: JSON.stringify(todoObject),
          headers: { "Content-Type": "application/json" },
        },
      );
      const jsonResponse = await response.json();
      return jsonResponse.redirect_url;
    } catch (err) {
      console.log("ERROR", err);
      return err;
    }
  } else {
    return "Error";
  }

  // return `${request.url.slice(0, request.url.lastIndexOf("/"))}/payment_simulator/${id}`;
};
