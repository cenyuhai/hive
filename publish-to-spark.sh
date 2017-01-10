#!/bin/bash

PUBLISH_PROFILES="-Phadoop-2 -DskipTests -Psources -Pjavadoc"

echo "Replacing groupID with com.didichuxing.hive"
find . -name pom.xml | \
  xargs -I {} sed -i -e "s/org.apache.hive/com.didichuxing.hive/g" {}

find . -name pom.xml | \
  xargs -I {} sed -i -e "s/org.spark-project.hive/com.didichuxing.hive/g" {}

echo "Publishing Spark to OSS Sonatype"
mvn clean deploy -Dgpg.passphrase=-Dgpg.skip $PUBLISH_PROFILES
