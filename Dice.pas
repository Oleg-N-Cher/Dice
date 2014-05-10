uses crt;
var
money,st,a,b:real;
ch:char;
procedure bye;
begin
writeln('/-------\');
writeln('|       |');
writeln('|       |');
write('|  ');
textcolor(yellow);
write('BYE');
textcolor(white);
writeln('  |');
writeln('|       |');
writeln('|       |');
writeln('\-------/');
end;
procedure win;
begin
writeln('/-------\');
writeln('|       |');
writeln('|       |');
write('|');
textcolor(yellow);
write('WINER:)');
textcolor(white);
writeln('|');
writeln('|       |');
writeln('|       |');
writeln('\-------/');
end;
procedure loose;
begin
writeln('/-------\');
writeln('|       |');
writeln('|       |');
write('|');
textcolor(yellow);
write('LOOSE:(');
textcolor(white);
writeln('|');
writeln('|       |');
writeln('|       |');
writeln('\-------/');
end;
procedure p1;
begin
writeln('/-------\');
writeln('|       |');
writeln('|       |');
writeln('|   0   |');
writeln('|       |');
writeln('|       |');
writeln('\-------/');
end;
procedure p2;
begin
writeln('/-------\');
writeln('| 0     |');
writeln('|       |');
writeln('|       |');
writeln('|       |');
writeln('|     0 |');
writeln('\-------/');
end;
procedure p3;
begin
writeln('/-------\');
writeln('| 0     |');
writeln('|       |');
writeln('|   0   |');
writeln('|       |');
writeln('|     0 |');
writeln('\-------/');
end;
procedure p4;
begin
writeln('/-------\');
writeln('| 0   0 |');
writeln('|       |');
writeln('|       |');
writeln('|       |');
writeln('| 0   0 |');
writeln('\-------/');
end;
procedure p5;
begin
writeln('/-------\');
writeln('| 0   0 |');
writeln('|       |');
writeln('|   0   |');
writeln('|       |');
writeln('| 0   0 |');
writeln('\-------/');
end;
procedure p6;
begin
writeln('/-------\');
writeln('| 0   0 |');
writeln('|       |');
writeln('| 0   0 |');
writeln('|       |');
writeln('| 0   0 |');
writeln('\-------/');
end;
procedure logo;
begin
clrscr;
textcolor(green);
writeln('---------');
writeln('- Dice -');
writeln('---------');
textcolor(white);
repeat until keypressed;
end;
procedure game;
begin
clrscr;
write('You have:');
textcolor(yellow);
write(money:3:0);
textcolor(white);
writeln('$');
write('Your stake:');
readln(st);
if st=0 then money:=-1;
if (money<st) and (st>0) then writeln('You haven''t so much money!');
if money>=st then
begin
a:=random(6)+1;
writeln('Your rezult is ');
textcolor(yellow);
if a=1 then p1;
if a=2 then p2;
if a=3 then p3;
if a=4 then p4;
if a=5 then p5;
if a=6 then p6;
textcolor(white);
b:=random(6)+1;
writeln('Your oponent''s rezult is ');
textcolor(yellow);
if b=1 then p1;
if b=2 then p2;
if b=3 then p3;
if b=4 then p4;
if b=5 then p5;
if b=6 then p6;
textcolor(white);
if a>b then money:=money+st;
if a<b then money:=money-st;
if a=b then writeln('Your rezults are same');
repeat until keypressed;
end;
end;
procedure endd;
begin
clrscr;
if money>199 then win;
if money<=0 then loose;
delay(5000);
end;
begin
logo;
money:=50;
writeln('Write in stake ''0'' to exit game');
delay(3000);
while (money>0) and (money<150) do game;
if (money=0) or (money>149) then endd;
if money<0 then bye;
end.