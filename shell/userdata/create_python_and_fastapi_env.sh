#!/bin/bash

# 環境設定+ptythonインストール+FastAPI,boto3インストール
yum update -y
yum install python3 -y

echo 'python3 -m venv /home/ec2-user/my_app/env'
python3 -m venv /home/ec2-user/my_app/env
source /home/ec2-user/my_app/env/bin/activate
pip install pip --upgrade
pip install fastapi uvicorn boto3

# FastAPIの最小構成作成のコードを作成して起動
cd /home/ec2-user/my_app/

https://raw.githubusercontent.com/sugikeitter/sandbox-aws/main/python/fastapi_restapp.py

# fastapiの起動
nohup uvicorn fastapi_restapp:app --host 0.0.0.0 > rest_app.log &
