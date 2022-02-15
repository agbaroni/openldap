#!/bin/bash

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

ldapadd -Y EXTERNAL -H ldapi:/// -f /tmp/setup.ldif
ldapadd -H ldap:/// -x -D 'cn=Manager,dc=example,dc=com' -w password -f /tmp/init.ldif

# ldapsearch -x -D 'cn=Manager,dc=example,dc=com' -H ldap:/// -w password -b 'dc=example,dc=com'
