#!/usr/bin/env bash
mongo <<EOF

    use admin
    db.createUser(
      {
        user: 'admin',
        pwd: 'password',
        roles: [ { readWrite: 'root', db: 'admin' } ]
      }
    );

    use ${MONGO_INITDB_DATABASE}    
    db.createUser({
      user: 'beyblader01',
      pwd: 'LetItRip',
      roles: [
        { role: "readWrite", db: "${MONGO_INITDB_DATABASE}" }
      ]
    })

    db.createUser({
      user: 'beyblader02',
      pwd: 'test',
      roles: [
        { role: "readWrite", db: "${MONGO_INITDB_DATABASE}" }
      ]
    })

    db.createCollection("${BEYBLADE_COMPONENT_COLLECTION}");
    db.createCollection("${BEYBLADE_ORIGIN_COLLECTION}");
    db.createCollection("${BEYBLADE_HMS_COLLECTION}");
    db.createCollection("${BEYBLADE_BURST_COLLECTION}");
    db.createCollection("${BEYBLADE_METRICS_COLLECTION}");
    db.createCollection("${BEYBLADE_BATTLE_MECHANICS_COLLECTION}");
    db.createCollection("${BEYBLADE_STADIUM_COLLECTION}");
 

EOF