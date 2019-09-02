///circularShiftByte(byte,n)
//positve n means we're rotating LEFT
//negative n means we're rotating RIGHT
//Thanks so much for your help, meseτa!
//
//example uses:

/*
bbb=circularShiftByte(1,1); //3
bbb=circularShiftByte(1,-1); //128
bbb=circularShiftByte(1,2); //4
bbb=circularShiftByte(1,-2); //64
*/

//limit to the first 8 bits in case we feed a value which is more than a byte
var byte=argument[0] & 255;

//limit n to -8, 8
var n=argument[1] & 7; //cool new binary way of doing modulo! also works fine for negative n!

return (byte << n) | (byte >> (byte - n)) & 7;
