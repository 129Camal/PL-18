BEGIN{
	FS = " ";
	ext = 0;
	i = 0;
	adverbios = "adverbios.txt";
	adjetivos = "adjetivos.txt";
	substantivos = "substantivos.txt";
	verbos = "verbos.txt";
	dic = "dicionário.txt";

}

{
if(!NF)
	ext++;

if(match($5,/^R/))
	adv[$2]++;


if(match($5,/^A/))
	adj[$2]++;
	
if(match($5,/^N/))
	subs[$2]++;

if(match($5,/^V/))
	verb[$2]++;

lemas[$3][$2];
pos[$3] = $5;
}

END{
	print("O número de extratos é: " ext);

	for(a in adv){
		print a > adverbios ;
	}

	for(ad in adj){
		print ad > adjetivos ;
	}

	for(s in subs){
		print s > substantivos ;
	}

	for(v in verb){
		print v > verbos;
	}

	for(l in lemas){
		print "Lema: " l " -> Pos: " pos[l] > dic ;
		print "Palavras:\n" > dic  
		for(w in lemas[l])
		print w > dic
		print "\n" > dic 
	}

}