@IF NOT "%XDev%"=="" GOTO XDev
@ECHO Please set system variable XDev=X:\Path\To\XDev
@PAUSE
@EXIT

:XDev

@SET CodeAdr=45056
@SET DataAdr=63488
@SET Options=--reserve-regs-iy
@SET Target=TAP
%XDev%\ZXDev\Bin\Build.bat %1
