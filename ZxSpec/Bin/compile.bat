@SET Bin=..\..\..\..\ZXDev\Bin
@SET Lib=..\..\..\..\ZXDev\Lib

%Bin%\sdcc -c %1.c -mz80 --reserve-regs-iy --opt-code-size --disable-warning 59 --disable-warning 85 -I "." -I %Lib% -I %Lib%\C -I %Lib%\Obj
@IF errorlevel 1 PAUSE