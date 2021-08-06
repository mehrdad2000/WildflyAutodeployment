#!/bin/bash
export WAR=`echo /opt/jboss/wildfly/domain/deployments/*.war` 
nohup /opt/jboss/wildfly/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0 > /dev/null 2>&1 &
sleep 20
/opt/jboss/wildfly/bin/jboss-cli.sh --user="admin" --password="admin" --controller=remote+http://127.0.0.1:9990 --connect --command="deploy $WAR --all-server-groups"
 
/bin/bash
