#!/bin/bash

echo "Deploying build resources...";
mvn -B -e -T 1C -Pdeploy -DskipTests=true deploy --settings ~/settings.xml -f build-resources/pom.xml

error=$?
if [[ $error -eq 0 ]]; then 
    mvn -B -e -T 1C -Pdeploy -DskipTests=true deploy --settings ~/settings.xml -f parent-pom/pom.xml; 
    error=$?;
else
    echo "Aborted parent pom deploy because build resources deploy failed";
fi

exit $error