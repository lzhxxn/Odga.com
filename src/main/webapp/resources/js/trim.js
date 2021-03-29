function trim(str){
	while(str && str.indexOf(" ") == 0)
		str = str.substring(1); 
	while(str && str.lastIndexOf(" ") == str.length-1)
		str = str.substring(0, str.length-1); 
	return str;
}