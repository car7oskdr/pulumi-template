from pulumi_aws import s3


def create_bucket(name: str):
    bucket_name = f"pulumi-iac-test-{name}"
    bucket = s3.Bucket(bucket_name)
    return bucket
