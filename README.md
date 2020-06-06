# code-server
自分用のcode-serverを構築するdocker-compose

## 使い方
### 初期設定
code-serverにログインするときのパスワードとvscodeで開きたいプロジェクトのパスを.envに記述
`cp .env.example .env`

### code-serverの立ち上げ
`docker-compose up -d`

### グローバルインターネットからアクセスする
curl -s $(docker port code-server_ngrok 4040)/api/tunnels
