import boto3
import json
import pymysql
import os

def lambda_handler(event, context):

    secret_name = os.environ["SECRET_NAME"]

    client = boto3.client("secretsmanager")

    secret = client.get_secret_value(
        SecretId=secret_name
    )

    creds = json.loads(secret["SecretString"])

    conn = pymysql.connect(
        host="RDS-ENDPOINT",
        user=creds["username"],
        password=creds["password"]
    )

    return {
        "statusCode": 200
    }