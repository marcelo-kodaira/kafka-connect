#!/bin/bash

sleep 20

echo "Waiting for MongoDB to be ready..."
until mongosh --host mongodb --eval 'db.runCommand({ serverStatus: 1 })' &> /dev/null; do
  echo "MongoDB not ready yet..."
  sleep 2
done

echo "Initializing replica set..."
mongosh --host mongodb --eval '
  rs.initiate(
    {
      _id: "rs0",
      members: [
        { _id: 0, host: "mongodb:27017" }
      ]
    }
  )
' || { echo "Failed to initiate replica set." ; exit 1; }

echo "Replica set initialization complete."

tail -f /dev/null
