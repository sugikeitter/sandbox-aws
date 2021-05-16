### gitのディレクトリごとにアクセスキーのプロファイル設定
参考: https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-https-unixes.html#setting-up-https-unixes-credential-helper
```shell
git config --local credential.helper '!aws --profile ${YOUR_CREDENTIAL_PROFILE_NAME} codecommit credential-helper $@'
git config --local credential.UseHttpPath true

# Macのkeychainが使われてしまうため
# 参考: https://dev.classmethod.jp/articles/codecommit-trouble-with-osx/
git config --local --unset credential.helper
```
