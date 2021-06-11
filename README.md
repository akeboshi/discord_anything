# DiscordBotWebServer

Discord で以下の機能のweb側の機能を提供する

- おみくじ
- カスタム返信

discord のメッセージを取得してレスポンスをかえすのは[bots](https://github.com/akeboshi/discord_bots)が行う。
bots はこのweb serverのapiを叩いて登録されているデータを取得する

## 環境変数

Discord OAuth2に利用する

- DISCORD_CLIENT_ID=<discord client application id>
- DISCORD_CLIENT_SECRET=<discord client application secret>

Production (Use oracle db)

- TNS_ADMIN=/tmp/oracle/oracle # TNS_ADMIN is directory with wallet files
- NLS_LANG=Japanese_Japan.UTF8
- ORACLE_DB='(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-tokyo-1.oraclecloud.com))(connect_data=(service_name=servername_high.adb.oraclecloud.com))(security=(ssl_server_cert_dn="CN=adb.ap-tokyo-1.oraclecloud.com,OU=Oracle ADB TOKYO,O=Oracle Corporation,L=Redwood City,ST=California,C=US")))'
- ORACLE_DB_USER=user
- ORACLE_DB_PASSWORD=password
