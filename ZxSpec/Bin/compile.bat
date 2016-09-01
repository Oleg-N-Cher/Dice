@IF NOT "%XDev%"=="" GOTO XDev
@ECHO Please set system variable XDev=X:\Path\To\XDev
@PAUSE
@EXIT

:XDev

@SET MainMod=Dice
@SET Options=--reserve-regs-iy
@SET Include=-I .

%XDev%\ZXDev\Bin\Compile.bat %1
