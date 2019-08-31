///irandom_gauss(minimum_int,maximum_int)
var min_int=argument[0];
var max_int=argument[1];

var result=0;
var rolls=max_int-min_int;

repeat(rolls)
    {
    result+=choose(0,1);
    }
    
return min_int+result;
