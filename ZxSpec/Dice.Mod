MODULE Dice; (*$MAIN*)

IMPORT
  C := Console, Input, Math, Timer;

VAR
  money, st, a, b: INTEGER; ch: CHAR;

PROCEDURE Bye;
BEGIN
  C.WriteStrLn("/-------\");
  C.WriteStrLn("|       |");
  C.WriteStrLn("|       |");
  C.WriteStr("|  ");
  C.SetColors(C.YellowOnBlack);
  C.WriteStr(   "BYE");
  C.SetColors(C.LWhiteOnBlack);
  C.WriteStrLn(      "  |");
  C.WriteStrLn("|       |");
  C.WriteStrLn("|       |");
  C.WriteStrLn("\-------/");
END Bye;

PROCEDURE Win;
BEGIN
  C.WriteStrLn("/-------\");
  C.WriteStrLn("|       |");
  C.WriteStrLn("|       |");
  C.WriteStr("|");
  C.SetColors(C.YellowOnBlack);
  C.WriteStr( "WINNER!");
  C.SetColors(C.LWhiteOnBlack);
  C.WriteStrLn(        "|");
  C.WriteStrLn("|       |");
  C.WriteStrLn("|       |");
  C.WriteStrLn("\-------/");
END Win;

PROCEDURE Loose;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|");
  C.SetColors(C.YellowOnBlack);
  C.WriteStr( "LOOSE:(");
  C.SetColors(C.LWhiteOnBlack);
  C.WriteStr(        "|"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END Loose;

PROCEDURE P1;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|   0   |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P1;

PROCEDURE P2;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("| 0     |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|     0 |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P2;

PROCEDURE P3;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("| 0     |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|   0   |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|     0 |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P3;

PROCEDURE P4;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P4;

PROCEDURE P5;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("|   0   |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P5;

PROCEDURE P6;
BEGIN
  C.WriteStr("/-------\"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("|       |"); C.WriteLn;
  C.WriteStr("| 0   0 |"); C.WriteLn;
  C.WriteStr("\-------/"); C.WriteLn;
END P6;

PROCEDURE Logo;
BEGIN
  C.Clear(C.Black);
  C.SetColors(C.GreenOnBlack);
  C.WriteStrLn("----------");
  C.WriteStrLn("-  Dice  -");
  C.WriteStrLn("----------");
  C.SetColors(C.LWhiteOnBlack);
  ch := Input.Read();
END Logo;

PROCEDURE Game;
BEGIN
  C.Clear(C.Black);
  C.WriteStr("You have: ");
  C.SetColors(C.YellowOnBlack);
  C.WriteInt(money);
  C.SetColors(C.LWhiteOnBlack);
  C.WriteStrLn("$");
  C.WriteStrLn("Your stake:");
  st := C.ReadIntRange(0, money); C.WriteLn; Math.Randomize;
  IF st = 0 THEN money := -1 END;
  (*IF (money < st) & (st > 0) THEN
    C.WriteStrLn("You haven't so much money!"); C.WriteLn;
  END;*)
  IF st <= money THEN
    a := Math.RndRange(1, 6);
    C.WriteStrLn("Your result is");
    C.SetColors(C.YellowOnBlack);
    CASE a OF 1: P1 | 2: P2 | 3: P3 | 4: P4 | 5: P5 | 6: P6 ELSE END;
    C.SetColors(C.LWhiteOnBlack);
    b := Math.RndRange(1, 6);
    C.WriteStrLn("Your opponent's result is ");
    C.SetColors(C.YellowOnBlack);
    CASE b OF 1: P1 | 2: P2 | 3: P3 | 4: P4 | 5: P5 | 6: P6 ELSE END;
    C.SetColors(C.LWhiteOnBlack);
    IF a > b THEN INC(money, st) END;
    IF a < b THEN DEC(money, st) END;
    IF a = b THEN C.WriteStrLn("The results are the same") END;
    WHILE Input.Available() > 0 DO END;
    ch := Input.Read();
  END;
END Game;

PROCEDURE End;
BEGIN
  C.Clear(C.Black);
  IF money > 149 THEN Win END;
  IF money <= 0 THEN Loose END;
  Timer.Delay(5000);
END End;

BEGIN
  Logo;
  money := 50;
  C.WriteStrLn("Write in stake '0' to exit game");
  Timer.Delay(3000);
  WHILE (money > 0) & (money < 150) DO Game END;
  IF (money = 0) OR (money > 149) THEN End END;
  IF money < 0 THEN Bye END;
END Dice.