#!/usr/local/bin/awk -f

BEGIN{FS = ":"}
/(\%[THE])/ {$1=""; print "Relação: ", $0}
/(\%[dom])/ {print "Dominio: " $2 , $3}
/(\%[inv])/ {$1=""; print "Relação Inversa: " $0}