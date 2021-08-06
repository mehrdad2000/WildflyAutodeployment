# Docker
in case you need to deploy your [ear,war] file on wildfly [domain or standalone] docker container without headache.


```
docker build --tag=$VERSION . && docker run -p 8080:8080 -p 9990:9990 -dit $YOURAPPNAME
```

wildfly web intrface:
```http://$YOURSERVERIP:9990```

Your app web login interface:
```http://$YOURSERVERIP:8080/login```



| file          | Description   |
| ------------- | ------------- |
| $MYAPP.war    | Your app name [ear.war]  |
| startscript.sh | Autodeploy script on docker container |
| wmq.jmsra.rar | MQ driver (optional)|
| ifxjdbc.jar   | Database driver (optional)  |
| domain.xml, module.xml, host.xml    | Wildfly stuff  |






