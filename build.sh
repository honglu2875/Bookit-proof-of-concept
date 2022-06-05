#!/bin/bash
help()
{
	echo "Please first supply the following environment variables:"
	echo
	echo "CLIENT_ID: Google API client id."
	echo "CLIENT_SECRET: Google API client secret."
	echo "API_KEY: Google API key."
	echo "EMAIL: the main host's email address."
	echo "REDIRECT_URI: the uri for redirection from google OAuth2"
	echo "POSTGRES_ADDR: (optional, default 'db') the address or name of the postgres server"
	echo "POSTGRES_USER: (optional, default 'postgres') the username for postgres database."
	echo "POSTGRES_PASSWORD: (optional, default 'password') the password for postgres database."
}

if [[ -z "${CLIENT_ID}" ]] || [[ -z "${CLIENT_SECRET}" ]] || [[ -z "${API_KEY}" ]] || [[ -z "${EMAIL}" ]] || [[ -z "${REDIRECT_URI}" ]]; then
	help
	exit 0
fi	

if [[ -z "${POSTGRES_ADDR}" ]]; then
	POSTGRES_ADDR="db"
fi

if [[ -z "${POSTGRES_USER}" ]]; then
	POSTGRES_USER="postgres"
fi

if [[ -z "${POSTGRES_PASSWORD}" ]]; then
	POSTGRES_PASSWORD="password"
fi

DBMANAGER_RESOURCES_PATH="Bookit-dbManager/src/main/resources"

cp $DBMANAGER_RESOURCES_PATH/application.yml.example $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your client id>/$CLIENT_ID/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your client secret>/$CLIENT_SECRET/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<your google api key>/$API_KEY/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<Postgres username>/$POSTGRES_USER/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<Postgres password>/$POSTGRES_PASSWORD/g" $DBMANAGER_RESOURCES_PATH/application.yml
sed -i "s/<Postgres addr>/$POSTGRES_ADDR/g" $DBMANAGER_RESOURCES_PATH/application.yml

[ ! -e .env ] || rm .env
echo "CLIENT_ID=$CLIENT_ID" >> .env
echo "CLIENT_SECRET=$CLIENT_SECRET" >> .env
echo "POSTGRES_USER=$POSTGRES_USER" >> .env
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> .env
echo "API_KEY=$API_KEY" >> .env
echo "EMAIL=$EMAIL" >> .env

cd Bookit-dbManager
./build.sh

