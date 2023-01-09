Codeunit 50130 "Solutions"
{
    trigger OnRun()
    begin
    end;

    procedure AddCommentSeparator(var AllComments: Text[1024]; NewComment: Text[1024]; Separator: Text[10])
    begin
        // The function is supposed to append the NewComment to the AllComments variable and thus return it.
        // The comments are separated by the Separator text.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        AllComments := '';
    end;


    procedure EvaluateDateFromXMLDateTime(var Date: Date; ISO8601DateTime: Text[100]): Boolean
    var
        Year: Integer;
        Month: Integer;
        Day: Integer;
        DT: DateTime;
    begin
        // The function is supposed to extract the date from an ISO 8601 DateTime and return it through the Date variable
        // If a valid date was found, the function returns TRUE otherwise FALSE.
        // More details can be deducted from the test itself.
        // Implement your solution here. You can use the TryDMY2DATE function below.

        Date := 0D;
        exit(false);
    end;


    [TryFunction]
    procedure TryDMY2DATE(Day: Integer; Month: Integer; Year: Integer; var Date: Date)
    begin
        Date := Dmy2date(Day, Month, Year);
    end;

    procedure hex2int(hex: Code[16]) int: BigInteger
    begin
        // The function is supposed to convert a hex number to an integer.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        exit(0);
    end;

    procedure int2hex(int: BigInteger) hex: Code[16]
    begin
        // The function is supposed to convert an integer to hexadecimal.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        exit('');
    end;

}

