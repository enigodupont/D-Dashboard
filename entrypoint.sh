#!/bin/sh

echo "--------------------------------------------------------------------------------"
if [ "${RAILS_ENVIRONMENT}" != "production" ] 
then
  echo "Migrating for non production environment"
  /opt/D-Dashboard/bin/rails db:migrate RAILS_ENV=${RAILS_ENVIRONMENT}
else
  echo "No migrate necessary"
fi
echo "--------------------------------------------------------------------------------"

/opt/D-Dashboard/bin/rails s -e ${RAILS_ENVIRONMENT} -b 0.0.0.0
