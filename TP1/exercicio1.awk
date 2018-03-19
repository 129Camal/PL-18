#!/usr/local/bin/awk -f

BEGIN{
	FS = ":";
	dom = 0;
	rel = "";
	path  = "html/";
	termo1 = "";
}

{
	if(match($1,/^%dom/, d)){
		dominio[dom] = $2;
		print ("<html>\n\t<head>\n\t\t<meta charset='UTF-8'/>\n\t</head>\n\t<body>") >  path dominio[dom]".html";
		print("\t\t<p> <b> Dominio -> </b> " $2 "</p>\n") > path dominio[dom]".html";
		dom++;
	}

	if(match($0,/^%THE/)){
		if(match($1,/<(.*)/, n)){
			mat = $1;
			$1 = n[1];
			print ("<p><b>Relação -> </b>" "<a href='" $0 ".html>" $0 "</a></p>") > path dominio[dom-1]".html";
			if(rel != "")
				print("</body> \n </html>") > path dominio[dom-1]rel".html" 
			rel = $0
			print ("<html>\n\t<head>\n\t\t<meta charset='UTF-8'/>\n\t</head>\n\t<body>") >  path dominio[dom-1]rel".html";
			print ("<a href='" dominio[dom-1]".html'> Back </a>") > path dominio[dom-1]rel".html";
			$1 = "";
			relacao = $0;
			$1 = mat;
		}

		else{
			$1 = "";
			print ("<b>Relação -> </b>" "<a href='" dominio[dom-1] $0 ".html'>" $0 "</a>") > path dominio[dom-1]".html";
			if(rel != "")
				print("</body> \n </html>") > path dominio[dom-1]rel".html" 	
			rel = $0
			print ("<html>\n\t<head>\n\t\t<meta charset='UTF-8'/>\n\t</head>\n\t<body>") >  path dominio[dom-1]rel".html";
			print ("<a href='" dominio[dom-1]".html'> Back </a>") > path dominio[dom-1]rel".html";
			print("\t<h2>" rel "</h2>\n") > path dominio[dom-1]rel".html";
			print ("<p>  </p>") > path dominio[dom-1]".html";
			relacao = $0;
		}


	}

	if(match($1,/^%inv/)){
		p = $1;
		$1 = "";
		print ("<b>Relação inversa -> </b>"$0) > path dominio[dom-1]".html";
		print ("<p>  </p>") > path dominio[dom-1]".html";
		$1 = p;
	}

	if(match($1,/^[aA-zZ]/)){


	split(relacao, ok, " ");

	#restantes termos
	if ($1 != termo1){
		print ("</body></html>") > path dominio[dom-1] termo1 rel ".html";
		termo1 = $1;
		print ("<html>\n\t<head>\n\t\t<meta charset='UTF-8'/>\n\t</head>\n\t<body>") >  path dominio[dom-1]$1rel".html";
		print ("<a href='" dominio[dom-1]rel ".html'>Back</a>") > path dominio[dom-1]$1rel".html";
		print ("<p> <a href='" dominio[dom-1]$1rel ".html'>" $1 "</a></p>") > path dominio[dom-1] rel".html";
	}
	#primeiro termo a aparecer
	else if ($1 == ""){
		print ("<html>\n\t<head>\n\t\t<meta charset='UTF-8'/>\n\t</head>\n\t<body>") >  path dominio[dom-1]$1rel".html";
		print ("<a href='" dominio[dom-1]rel ".html'>Back</a>") > path dominio[dom-1] $1 rel".html";
		termo1 = $1;
	}

	for(r=1; r<=NF; r++){
		sub(/<[A-Za-z].+/, " ", ok[r]);
	}	
		for(i=2; i <= NF; i++){
			q = split($i, a, "|");
			novo = $i;
			sub(/^\s/, "", novo);
			if(q == 1){
				print ("<p><b>(</b>" $1 " , " ok[i-1] " ," "<a href='"dominio[dom-1] novo rel ".html'>" novo "</a><b>)</b></p>") > path dominio[dom-1] $1 rel".html";
			}
			if(q > 1){

					for(j = 1; j <= q; j++){
						nova = a[j];
						sub(/^\s/,"", nova);
						print ("<p><b>(</b>" $1 ", " ok[i-1] "," " <a href='"dominio[dom-1] nova rel".html'>" nova "</a>" "<b>)</b></p>") > path dominio[dom-1]$1rel".html";
					}
			}

		}
	}
}
END {
	print("</body> \n </html>") > path dominio[dom-1]".html"
}