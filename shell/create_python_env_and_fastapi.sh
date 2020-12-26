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

cat <<EOL >> rest_app.py
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def health_check():
    return {
            "status": "OK"
           }

@app.get('/{path}')
async def hello(
        path: str,
        q: str):
    return {
            "message": "hello, world!",
            "path": path,
            "q": q
           }
EOL

# fastapiの起動
nohup uvicorn rest_app:app --host 0.0.0.0 > rest_app.log &
