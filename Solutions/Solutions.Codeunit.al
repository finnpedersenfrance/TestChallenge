codeunit 50125 "Solutions"
{
    trigger OnRun()
    begin
    end;

    procedure AddCommentSeparator(var AllComments: Text[1024]; NewComment: Text[1024]; Separator: Text[10])
    var
        CommentBuilder: TextBuilder;
        CommentList: List of [Text];
    begin
        // The function is supposed to append the NewComment to the AllComments variable and thus return it.
        // The comments are separated by the Separator text.
        // More details can be deducted from the test itself.
        // Implement your solution here.
        if NewComment = '' then
            exit;

        if AllComments.Contains(Separator) then
            CommentList := AllComments.Split(Separator)
        else
            CommentList.Add(AllComments);

        if CommentList.Contains(NewComment) then
            exit;

        CommentBuilder.Append(AllComments);

        if CommentBuilder.Length() > 0 then
            CommentBuilder.Append(Separator);

        CommentBuilder.Append(NewComment);
        AllComments := CopyStr(CommentBuilder.ToText(), 1, 1024);
    end;


    procedure EvaluateDateFromXMLDateTime(var Date: Date; ISO8601DateTime: Text): Boolean
    var
        // TypeHelper: Codeunit "Type Helper";
        DateTxt: Text;
        DateList: List of [Text];
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        // The function is supposed to extract the date from an ISO 8601 DateTime and return it through the Date variable
        // If a valid date was found, the function returns TRUE otherwise FALSE.
        // More details can be deducted from the test itself.
        // Implement your solution here. You can use the TryDMY2DATE function below.

        Date := 0D;

        if ISO8601DateTime = '' then
            exit(false);

        if ISO8601DateTime.Contains('T') then
            DateTxt := CopyStr(ISO8601DateTime, 1, ISO8601DateTime.IndexOf('T') - 1)
        else
            DateTxt := ISO8601DateTime;

        if DateTxt.Contains('-') then
            DateList := DateTxt.Split('-')
        else
            DateList := DateTxt.Split('/');

        if DateList.Count <> 3 then
            exit(false);

        if not EvaluateDayMonthYearFromList(DateList, Day, Month, Year) then
            exit(false);

        if not TryDMY2DATE(Day, Month, Year, Date) then
            exit(false);

        exit(true);
    end;

    local procedure EvaluateDayMonthYearFromList(DateList: List of [Text]; var Day: Integer; var Month: Integer; var Year: Integer): Boolean
    begin
        if not Evaluate(Year, DateList.Get(1)) then
            exit(false);

        if not Evaluate(Month, DateList.Get(2)) then
            exit(false);

        if not Evaluate(Day, DateList.Get(3)) then
            exit(false);

        exit(true);
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

