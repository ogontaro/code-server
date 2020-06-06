# code-server
自分用のcode-serverを構築するdocker-compose

## 使い方
### 初期設定
`cp .env.example .env`

以下を設定
- code-serverにログインするときのパスワード
- vscodeで開きたいプロジェクトのpathを.envに記述

### code-serverの立ち上げ
`docker-compose up -d`

### グローバルインターネットからアクセスする
curl -s $(docker port code-server_ngrok 4040)/api/tunnels
