import json
import os
import boto3

QUEUE_URL = os.environ["QUEUE_URL"]
sqs = boto3.client("sqs")

def handler(event, context):
    """
    Manually invoke with an optional payload:
      { "message": "hello world" }
    Falls back to 'hello world' if no payload value is provided.
    """
    body = "hello world"
    if isinstance(event, dict):
      body = event.get("message", body)

    resp = sqs.send_message(QueueUrl=QUEUE_URL, MessageBody=str(body))
    return {
        "statusCode": 200,
        "body": json.dumps({"enqueued": body, "messageId": resp.get("MessageId")})
    }
