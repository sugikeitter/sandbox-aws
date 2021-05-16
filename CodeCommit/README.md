### gitのディレクトリごとにアクセスキーのプロファイル設定
git config --local credential.helper '!aws --profile ${YOUR_CREDENTIAL_PROFILE_NAME} codecommit credential-helper $@'
git config --local credential.UseHttpPath true
