#!/usr/local/bin/awk -f

BEGIN{
	FS = ":";
	dom = 0;
}

{
	if(match($1,/^%dom/, d)){
		dominio[dom] = $2;
		print ("<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>") >  dominio[dom]".html";
		print ("Dominio -> "$2) > dominio[dom]".html";
		print ("<p>  </p>") > dominio[dom]".html";
		dom++;
	}

	if(match($0,/^%THE/,b)){
		if(match($1,/<(.*):/, n)){
			m = $1;
			$1 = n[1];
			
			print ("Relação -> "$0) > dominio[dom-1]".html";
			print ("<p>  </p>") > dominio[dom-1]".html";
			relacao = $0;
			$1 = m;
		} 
		else{
			$1 = "";
			print ("Relação -> "$0) > dominio[dom-1]".html";
			print ("<p>  </p>") > dominio[dom-1]".html";
			relacao = $0;
		}


	}

	if(match($1,/^%inv/, ni)){
		n = $1;
		$1 = "";
		print ("Relação inversa -> "$0) > dominio[dom-1]".html";
		print ("<p>  </p>") > dominio[dom-1]".html";
		$1 = n;
	}

	if(match($1,/^[aA-zZ]/,t)){
		print ("Relacionamento -> " $0) > dominio[dom-1]".html";


		for(i=2; i <= NF; i++){
			q = split($i, a, "|");

			for(j = 1; j <= q && q != 1; j++){
				print ($1, a[j]);
			}

		}
		print ("<p>  </p>") > dominio[dom-1]".html";
	}

}


END {

}




