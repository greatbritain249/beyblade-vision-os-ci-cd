#!/usr/bin/env bash
mongo <<EOF
    use ${MONGO_INITDB_DATABASE}

    db.createUser({
      user: "${BEYBLADE_DB_USERNAME}",
      pwd: "${BEYBLADE_DB_PASSWORD}",
      roles: [
        { role: 'readWrite', db: "${MONGO_INITDB_DATABASE}" }
      ]
    })

    db.createCollection("${BEYBLADE_COMPONENT_COLLECTION}");
    db.createCollection("${BEYBLADE_METRICS_COLLECTION}");
    db.createCollection("${BEYBLADE_BATTLE_MECHANICS_COLLECTION}");

    # db.${BEYBLADE_COMPONENT_COLLECTION}.insert([
    #   {'_id': '4LS-Temp_Bakuten', 'value': "Temp_Bakuten"}
    # ]);

EOF