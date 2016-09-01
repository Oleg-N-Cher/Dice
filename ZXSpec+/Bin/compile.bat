@IF NOT "%XDev%"=="" GOTO XDev
@ECHO Please set system variable XDev=X:\Path\To\XDev
@PAUSE
@EXIT

:XDev

@SET Options=--reserve-regs-iy
%XDev%\ZXDev\Bin\Compile.bat %1
