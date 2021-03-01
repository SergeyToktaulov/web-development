PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;  
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Parameters: STRING;
BEGIN {GetQueryStringParameter}
  Parameters := GetEnv('QUERY_STRING');
  IF (POS(Key + '=', Parameters) = 1) OR (POS('&' + Key + '=', Parameters) <> 0)
  THEN
    BEGIN
      Parameters := COPY(Parameters, POS(Key + '=', Parameters) + LENGTH(Key + '='), 255);
      IF POS('&', Parameters) <> 0 
      THEN
        Parameters := COPY(Parameters, 1, POS('&', Parameters) - 1)
      ELSE
        Parameters := COPY(Parameters, 1, 255);
      GetQueryStringParameter := Parameters
    END
  ELSE      
    GetQueryStringParameter := '';    
END; {GetQueryStringParameter}
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;     
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}
