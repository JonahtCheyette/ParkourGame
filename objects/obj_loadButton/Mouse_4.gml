/// @description Load from file
//load
ini_open("save.ini");
room = ini_read_real("Location","Room",0);
ini_close();