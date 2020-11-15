### 環境セットアップ

pythonの仮想環境にAWSのSDKとして使える`boto3`と簡単なHTTPサーバが作れる`fastapi`,`uvicorn`をインストール
（Docker使うなら`venv`なしで良い）

```shell
python3 -m venv my_app/env
source ~/my_app/env/bin/activate
pip install pip --upgrade
pip install fastapi uvicorn boto3
```
