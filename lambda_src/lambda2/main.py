import json
import os
import boto3

s3 = boto3.client("s3")
BUCKET = os.environ["BUCKET_NAME"]

def handler(event, context):
    """
    Triggered by SQS (event source mapping).
    Writes each SQS record body to S3 as <messageId>.txt.
    """
    results = []
    for record in event.get("Records", []):
        message_id = record["messageId"]
        body = record["body"]
        key = f"{message_id}.txt"
        s3.put_object(Bucket=BUCKET, Key=key, Body=body.encode("utf-8"))
        results.append({"messageId": message_id, "key": key})

    return {"statusCode": 200, "written": results}
