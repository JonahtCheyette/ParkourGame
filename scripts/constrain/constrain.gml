/// @func constrain(value, lowerBound, upperBound);
/// @description returns the value constrained between upper and lower bounds
/// @param value
/// @param lowerBound
/// @param upperBound

if(argument1 > argument2){
	show_error("The lower bound is higher than the higher bound in the constrain function",true);
}

if(argument0 < argument1) {
	return argument1;
}
if(argument0 > argument2){
	return argument2;
}
return argument0;