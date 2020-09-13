# 取り込み対象

logstash/pipeline/main.conf にはとりあえず4つのテーブルを定義している
適宜読み込みたいテーブルにすること

# 初期設定
- 環境変数設定
- 読み込むデータの dump, sql ファイルを mysql/init_data 内に配置
- $ make start で Kibana を起動
- $ make import でデータ取り込み
- Kibana の setting > Index Paterns から テーブル名となるような Index Patern を作成（テーブル構造が変わらない限り変わらない限り最初だけでok）

# データ更新手順

- サーバーから最新のdumpファイルを mysql/init_data の中に入れておく
- $ make start #=> Elasticsearch と Kibana の起動。すでに起動していたら不要。
- $ make import #=> mysql のデータを logstash を使って Elasticsearch に import

logでこれが出たら完了
```
logstash    | [2020-09-13T10:28:30,007][INFO ][logstash.runner          ] Logstash shut down.
logstash exited with code 0
```

# 環境変数

```.envrc
export DATABASE="hogehoge_database"
```

# なんか困ったら
`$ make prune`

起動していないリソースたちが削除される（他projectにも影響するよ）

# mysqlを見たいとき
```
$ docker exec -it mysql bash
$ mysql -h mysql -P 3306 -u root -proot
```

# 参考
docker-compose.yml の内容はこちらはから
http://nakawatch.hatenablog.com/entry/2018/03/24/231043
