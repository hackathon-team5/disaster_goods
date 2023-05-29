#!/bin/sh
set -e

bin/rails db:migrate
# ダミーデータの投入として最初だけ実行
bin/rails db:seed

rm -f tmp/pids/server.pid && bin/rails s