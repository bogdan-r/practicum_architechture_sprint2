#!/bin/bash

###
# Инициализируем конфигурационный сервер
###

docker compose exec -T configSrv mongosh <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
EOF

