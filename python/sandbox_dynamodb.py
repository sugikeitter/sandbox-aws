import boto3
import pprint

if __name__ == '__main__':
    print("Start.")
    print("=====")
    pp = pprint.PrettyPrinter(indent=1)

    ddb_client = boto3.client('dynamodb')
    pp.pprint(ddb_client.list_tables())

    print("=====")
    print("End.")
