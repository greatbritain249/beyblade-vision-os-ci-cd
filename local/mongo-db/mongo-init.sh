#!/usr/bin/env bash
mongo <<EOF

    use admin
    db.createUser(
      {
        user: 'admin',
        pwd: 'password',
        roles: [ { role: 'root', db: 'admin' } ]
      }
    );

    use ${MONGO_INITDB_DATABASE}

    db.createUser({
      user: "${MONGO_INITDB_ROOT_USERNAME}",
      pwd: "${MONGO_INITDB_ROOT_PASSWORD}",
      roles: [
        { role: "readWrite", db: "${MONGO_INITDB_DATABASE}" }
      ]
    })

    db.createCollection("${BEYBLADE_COMPONENT_COLLECTION}");
    db.createCollection("${BEYBLADE_METRICS_COLLECTION}");
    db.createCollection("${BEYBLADE_BATTLE_MECHANICS_COLLECTION}");
    db.createCollection("${BEYBLADE_STADIUM_COLLECTION}");
 

EOF