

```
oc adm policy add-scc-to-user anyuid -z default


oc new-app https://github.com/agbaroni/openldap

oc logs -f buildconfig/openldap
```
