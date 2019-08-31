///zerofill_before(string,desired_length)

var str = argument[0];
var desired_length=argument[1];
//ASSUMING IT'S A REAL NUMBER PASSED TO ARGUMENT[0]!;

var current_length=string_length(floor(str));

repeat (desired_length-current_length)
    {
    str = "0"+str;
    }
    
return str;

