#!/usr/local/bin/awk -f

BEGIN{
	FS = ":";
	dom = 0;
}

{
	if(match($1,/^%dom/, d)){
		dominio[dom] = $2;
		print ("<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>") >  dominio[dom]".html";
		print ("<b>Dominio -> </b>"$2) > dominio[dom]".html";
		print ("<p>  </p>") > dominio[dom]".html";
		dom++;
	}

	if(match($0,/^%THE/)){
		if(match($1,/<(.*)/, n)){
			mat = $1;
			$1 = n[1];
			print ("<b>Relação -> </b>"$0) > dominio[dom-1]".html";
			print ("<p>  </p>") > dominio[dom-1]".html";
			$1 = "";
			relacao = $0;
			$1 = mat;
		}

		else{
			$1 = "";
			print ("<b>Relação -> </b>"$0) > dominio[dom-1]".html";
			print ("<p>  </p>") > dominio[dom-1]".html";
			relacao = $0;
		}


	}

	if(match($1,/^%inv/)){
		p = $1;
		$1 = "";
		print ("<b>Relação inversa -> </b>"$0) > dominio[dom-1]".html";
		print ("<p>  </p>") > dominio[dom-1]".html";
		$1 = p;
	}

	if(match($1,/^[aA-zZ]/)){

	split(relacao, ok, " ");
	
	for(r=1; r<=NF; r++){
		sub(/<[A-Za-z].+/, " ", ok[r]);
	}	
		for(i=2; i <= NF; i++){
			q = split($i, a, "|");
			novo = $i;
			
			if(q == 1){	print ("<b>(</b>" $1 " , " ok[i-1] " , " novo "<b>)</b>") > dominio[dom-1]".html";
						print ("<p>  </p>") > dominio[dom-1]".html";}
			if(q > 1){

					for(j = 1; j <= q; j++){
						nova = a[j];
						print ("<b>(</b>"$1 "," ok[i-1] "," nova"<b>)</b>") > dominio[dom-1]".html";
						print ("<p>  </p>") > dominio[dom-1]".html";
					}
			}

		}
	}
}
END {}
