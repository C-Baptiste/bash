## use curly braces for var
- var="var"
- echo ${var}
### parameter extension features
- ${var,} lowercase the first letter
- ${var,,} lowercase all letters
- ${var^} capitalize the first letter
- ${var^^} capitalize all letters
- ${#var} length
- ${parameter:offset:lenght} => ${var:0:7} ${var:3} ${var: -3:2} ${var: -3} slicing

## shell variables 
- UPPERCASE
- bourne shell = 10
- bash shell = 95
- common: PATH HOME USER HOSTNAME HOSTTYPE PS1
 
## command substition
- time=$(date)

## tild expansion
- $PWD 
- ~
- $OLDPWD ~+ ~-
- cd ~-; cd ~-; cd ~-  switch between 2 directories

## brace expansion
- echo {a,19,z,qsd,42,jan,feb,mar}
- a 19 z qsd 42 jan feb mar
- echo {1..10}
- 1 2 3 4 5 6 7 8 9 10
- echo {10..1..3}
- echo {a..z}
- mkdir month{01..12}


## ssh + sudo
- #!/bin/bash
- ssh ...@... <<EOF1
- hostname
- ssh ...@... <<EOF2 
- sudo -S <<<"..." ls /etc
- EOF2
- EOF1

- ssh -t ...@... "sudo -S ls /etc"
- shc -f test.sh -o test.sh.x
