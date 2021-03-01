PROGRAM HelloName(INPUT, OUTPUT);
USES
  DOS;
VAR
  Parameters, Name: STRING;
BEGIN {HelloName}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Parameters := GetEnv('QUERY_STRING');
  IF POS('name=', Parameters) = 1
  THEN
    BEGIN
      Name := COPY(Parameters, 6, 255);
      WRITELN('Hello dear', ',', Name, '!')
    END
  ELSE
    WRITELN('Hello Anonymous !')
END. {HelloName}
