1st
BEGIN{ 
a=0 
b=0 
} 
{ 
if($1=="r"&&$3=="2"&&$4=="3"&&$5=="tcp"&&$6=="1540") 
{ 
a++; 
} 
if($1=="d"&&$3=="2"&&$4=="3"&&$5=="tcp"&&$6=="1540") 
{ 
b++; 
} 
} 
END{ 
printf("\n total number of data packets received at Node 3: %d\n", a++); 
printf("\n total number of packets dropped between Node 2 and Node 3: %d\n", b++); 
}

2nd 

BEGIN{
a=0
b=0
}
{
if($1=="r"&&$4=="2"&&$5=="tcp"&&$6=="1040")
{
a++;
}
if($1=="r"&&$4=="2"&&$5=="cbr"&&$6=="1000")
{
b++;
}

}
END{
printf("\n total number of TCP data packets sent between Node 0 and Node 2: %d\n", a++); 
printf("\n total number of UDP data packets sent between Node 1 and Node 2: %d\n", b++);
}

3rd
BEGIN{
a=0
}
{
if($1=="r"&&$4=="7"&&$5=="cbr"&&$6=="1000")
{
a++;
}
}
END{
printf("\n total number of  data packets at Node 7: %d\n", a++); 
}

4th


5th
BEGIN{
a=0
}
{
if($1=="r"&&$3=="3"&&$4=="4"&&$5=="cbr"&&$6=="1500")
{
a++;
}
}
END{
printf("\n total number of data packets received at Node 4: %d\n", a++); 
}











