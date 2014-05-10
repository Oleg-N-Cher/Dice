@SET CodeAddr=45056
@SET DataAddr=63488
@SET Bin=..\..\..\..\ZXDev\Bin
@SET Lib=..\..\..\..\ZXDev\Lib

::%Bin%\sdcc -c %1.c -mz80 --reserve-regs-iy --opt-code-size -I "." -I %Lib%
::@IF errorlevel 1 PAUSE
%Bin%\sdcc Dice.c -mz80 --reserve-regs-iy --code-loc %CodeAddr% --data-loc %DataAddr% --opt-code-size -I "." -I %Lib% XDev.lib Basic.lib
@IF errorlevel 1 PAUSE

%Bin%\hex2bin Dice.ihx
%Bin%\bin2data.exe -rem -org %CodeAddr% Dice.bin ..\Dice.tap Dice
::%Bin%\bin2data.exe -data -org %CodeAddr% Dice.bin ..\Dice.tap Dice
@START ..\Dice.tap