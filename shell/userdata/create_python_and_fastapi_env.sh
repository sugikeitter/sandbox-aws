#!/bin/bash

# 環境設定+ptythonインストール+FastAPI,boto3インストール
yum update -y
# PostgreSQLを利用する場合は'postgresql gcc python3-devel postgresql-devel'も必要
yum install python3 -y

echo 'python3 -m venv /home/ec2-user/my_app/env'
python3 -m venv /home/ec2-user/my_app/env
source /home/ec2-user/my_app/env/bin/activate
pip install pip --upgrade
# sqlを利用する場合は'sqlalchemy psycopg2 pydantic'も必要
pip install fastapi uvicorn boto3

# FastAPIの最小構成作成のコードを取得
cd /home/ec2-user/my_app/
wget https://raw.githubusercontent.com/sugikeitter/sandbox-aws/main/python/fastapi_restapp.py

# ログローテートの設定
cat <<EOL >> /home/ec2-user/loglotate.conf
/home/ec2-user/rest_app.log
{
  missingok
  rotate 7
  dateext
  dateformat _%Y%m%d
  0644 root root
  daily
}
EOL

mv /home/ec2-user/loglotate.conf /etc/logrotate.d/app

# fastapiの起動
nohup uvicorn fastapi_restapp:app --host 0.0.0.0 > /home/ec2-user/my_app/rest_app.log &
