FROM jboss/wildfly:latest
 
USER jboss
ADD *.war /opt/jboss/wildfly/domain/deployments/$MYAPP.war
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent
CMD /opt/jboss/wildfly/domain/configuration/startscript.sh

USER root
ADD  wmq.jmsra.rar            /opt/jboss/wildfly/domain/data/content/
ADD  host.xml                 /opt/jboss/wildfly/domain/configuration/
ADD  domain.xml               /opt/jboss/wildfly/domain/configuration/
ADD  ifxjdbc.jar              /opt/jboss/wildfly/modules/system/layers/base/com/ibm/informix/main/
ADD  module.xml               /opt/jboss/wildfly/modules/system/layers/base/com/ibm/informix/main/
ADD  startscript.sh           /opt/jboss/wildfly/domain/configuration/startscript.sh
 
RUN  mkdir /opt/jboss/wildfly/domain/log/
 
RUN  chown jboss:root -R /opt/jboss/wildfly/domain && chown jboss:root -R /opt/jboss/wildfly/modules && chmod +x /opt/jboss/wildfly/domain/configuration/startscript.sh

#http://$YOURSERVERIP:8080/login/
