import boto3
import os

s3_client = boto3.client('s3')
config_client = boto3.client('config')

tag_key = os.environ['TAG_KEY']
tag_value = os.environ['TAG_VALUE']

def lambda_handler(event, context):


    evaluation_results = []

    for resource in event['invokingEvent']['configurationItemSummary']:
        bucket_name = resource['resourceName']
        response = s3_client.get_bucket_tagging(Bucket=bucket_name)
        tags = response.get('TagSet', [])

        compliant = any(tag['Key'] == tag_key and tag['Value'] == tag_value for tag in tags)

        evaluation = {
            'ComplianceResourceType': 'AWS::S3::Bucket',
            'ComplianceResourceId': bucket_name,
            'ComplianceType': 'COMPLIANT' if compliant else 'NON_COMPLIANT',
            'OrderingTimestamp': resource['configurationItemCaptureTime']
        }

        evaluation_results.append(evaluation)

    result = config_client.put_evaluations(
        Evaluations=evaluation_results,
        ResultToken=event['resultToken']
    )

    return result
