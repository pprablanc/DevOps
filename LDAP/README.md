# Run playbook

First, edit [inventory](inventory).
Then, run:
```
ansible-playbook -i inventory playbook.yml
```

To verify on host if dictionary got populated: (Replace dc by yours)
```
ldapsearch -LLL -x -H ldap:/// -b "dc=atos,dc=fr" -D cn=admin,dc=atos,dc=fr -W
```
