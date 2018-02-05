#!/bin/bash

set -e

main () {
  templater /opt/templates/pg.template > /root/.pgpass
  chmod 600 /root/.pgpass

  while ! psql -h $BIFROST_DB_HOST -U $POSTGRES_USER -c 'select 1' $BIFROST_DB_NAME &> /dev/null
  do
    echo "Waiting for bifrostdb to be available..."
    sleep 1
  done

  echo "Initializing Bifrost DB..."
#  init_bifrost_db
  start_bifrost
}

init_bifrost_db () {

  if [ -f ~/.bifrostdb-initialized ]
  then
    echo "FILE IS FOUND HERE"
  fi
  
  if [ -f /go/src/github.com/stellar/go/services/bifrost/database/migrations/.bifrostdb-initialized ]
  then
    echo "Bifrost DB: already initialized"
    return 0
  fi
  
  if [ -f ~/.bifrostdb-initialized ]
  then
    echo "FILE IS FOUND HERE"
  fi

  echo "Bifrost DB: Initializing"
  DB_URL=$BIFROST_DB_DSN DB_DUMP_FILE=/go/src/github.com/stellar/go/services/bifrost/database/migrations/01_init.sql /go/bin/initbifrost

  touch /go/src/github.com/stellar/go/services/bifrost/database/migrations/.bifrostdb-initialized
  # this one is a test
  touch ~/.bifrostdb-initialized
}

function start_bifrost() {
  echo "Little sleep before starting server.. "
  sleep 20
  echo "Starting bifrost..."
  bifrost server -c /opt/bifrost/config/bifrost.cfg
}

main
