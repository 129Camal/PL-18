BEGIN{
	FS = " ";
}

{
	if(match($5,/^NP/)){
		nomes[$2]++;
	}
}

END{
	for(i in nomes){
		print("Nome: " i "\tNúmero de ocorrências: " nomes[i]);
		}	
}
