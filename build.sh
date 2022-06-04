#!/bin/bash
help()
{
	echo "Please first supply the following environment variables:"
	echo
	echo "CLIENT_ID: Google API client id."
	echo "CLIENT_SECRET: Google API client secret."
	echo "API_KEY: Google API key."
	echo "POSTGRES_USERNAME: (optional, default 'postgres') the username for postgres database."
	echo "POSTGRES_PASSWORD: (optional, default 'password') the password for postgres database."
	echo 
}

if [[ -z "${CLIENT_ID}" ]] || [[ -z "${CLIENT_SECRET}" ]] || [[ -z "${API_KEY}" ]]; then
	help
	exit 0
fi	

if [[ -z "${POSTGRES_USERNAME}" ]]; then
	POSTGRES_USERNAME="postgres"
fi

if [[ -z "${POSTGRES_PASSWORD}" ]]; then
	POSTGRES_PASSWORD="password"
fi

DBMANAGER_RESOURCES_PATH="Bookit-dbManager/src/main/resources"

cp $DBMANAGER_RESOURCES_PATH/application.yml.example $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your client id>/$CLIENT_ID/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your client secret>/$CLIENT_SECRET/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<Postgres username>/$POSTGRES_USERNAME/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<Postgres password>/$POSTGRES_PASSWORD/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your google api key>/$API_KEY/g" $DBMANAGER_RESOURCES_PATH/application.yml

cd Bookit-dbManager
./build.sh
cd ..
