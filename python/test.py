import requests
import json

webhook_url = 'https://127.0.0.1:443/webhook'

data = {
  "id": "8PT597110X687430LKGECATA",
  "create_time": "2013-06-25T21:41:28Z",
  "resource_type": "authorization",
  "event_type": "PAYMENT.AUTHORIZATION.CREATED",
  "summary": "A payment authorization was created",
  "resource": {
    "id": "2DC87612EK520411B",
    "create_time": "2013-06-25T21:39:15Z",
    "update_time": "2013-06-25T21:39:17Z",
    "state": "authorized",
    "amount": {
      "total": "7.47",
      "currency": "USD",
      "details": {
        "subtotal": "7.47"
      }
    },
    "parent_payment": "PAY-36246664YD343335CKHFA4AY",
    "valid_until": "2013-07-24T21:39:15Z",
    "links": [
      {
        "href": "https://api-m.sandbox.paypal.com/v1/payments/authorization/2DC87612EK520411B",
        "rel": "self",
        "method": "GET"
      },
      {
        "href": "https://api-m.sandbox.paypal.com/v1/payments/authorization/2DC87612EK520411B/capture",
        "rel": "capture",
        "method": "POST"
      },
      {
        "href": "https://api-m.sandbox.paypal.com/v1/payments/authorization/2DC87612EK520411B/void",
        "rel": "void",
        "method": "POST"
      },
      {
        "href": "https://api-m.sandbox.paypal.com/v1/payments/payment/PAY-36246664YD343335CKHFA4AY",
        "rel": "parent_payment",
        "method": "GET"
      }
    ]
  },
  "links": [
    {
      "href": "https://api-m.sandbox.paypal.com/v1/notifications/webhooks-events/8PT597110X687430LKGECATA",
      "rel": "self",
      "method": "GET"
    },
    {
      "href": "https://api-m.sandbox.paypal.com/v1/notifications/webhooks-events/8PT597110X687430LKGECATA/resend",
      "rel": "resend",
      "method": "POST"
    }
  ]
}
         

r = requests.post(webhook_url, data=json.dumps(data), headers={'Content-Type': 'application/json'}, verify=False)

