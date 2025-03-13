#!/bin/bash
docker compose exec -T configSrv mongosh --port 27017 --quiet <<EOF
rs.initiate({
  _id: "config_server",
  configsvr: true,
  members: [
    { _id: 0, host: "configSrv:27017" }
  ]
})
EOF

docker compose exec -T shard1_1 mongosh --port 27030 --quiet <<EOF
rs.initiate({
  _id: "shard1",
  members: [
    { _id: 0, host: "shard1_1:27030" },
    { _id: 1, host: "shard1_2:27031" },
    { _id: 2, host: "shard1_3:27032" }
  ]
})
EOF

docker compose exec -T shard2_1 mongosh --port 27040 --quiet <<EOF
rs.initiate({
  _id: "shard2",
  members: [
    { _id: 0, host: "shard2_1:27040" },
    { _id: 1, host: "shard2_2:27041" },
    { _id: 2, host: "shard2_3:27042" }
  ]
})
EOF

