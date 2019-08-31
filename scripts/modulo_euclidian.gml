///modulo_euclidian(number, divisor)
var Q;
var nummy=argument[0];
var divvy;

divvy=argument[1];    

if(divvy < 0) Q = ceil(nummy/divvy);
else Q = floor(nummy/divvy);
return nummy - (Q * divvy);
