#!/bin/bash -e

BASE_DIR=$(cd $(dirname $0); pwd)
if [ -d ${BASE_DIR}/data ]; then
	cd ${BASE_DIR}/data
  else
    mkdir ${BASE_DIR}/data
	cd ${BASE_DIR}/data
	wget http://download.geofabrik.de/europe/france-latest.osm.pbf
	docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/france-latest.osm.pbf
	docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/france-latest.osrm
	docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/france-latest.osrm
fi

docker run -d -t -i -p 5000:5000 -v "${PWD}:/data" osrm/osrm-backend osrm-routed --algorithm mld /data/france-latest.osrm

