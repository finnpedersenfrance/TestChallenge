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

    procedure hex2int(hex: Code[16]) int: BigInteger
    var
        Math: Codeunit Math;
        Char: Char;
        CharIndex: Integer;
        CharValue: Integer;
        PowerIndex: Integer;
        NumberOfChars: Integer;
        CalcValue: BigInteger;
        Value: BigInteger;
        HexList: List of [Char];
    begin
        // The function is supposed to convert a hex number to an integer.
        // More details can be deducted from the test itself.
        // Implement your solution here.
        PopulateHexList(HexList);

        NumberOfChars := StrLen(hex);
        PowerIndex := NumberOfChars - 1;
        for CharIndex := 1 to NumberOfChars do begin
            Char := hex[CharIndex];

            if not HexList.Contains(Char) then
                Error('Invalid hex character: %1', Char);

            CharValue := (HexList.IndexOf(Char) - 1);
            CalcValue := (CharValue * Math.Pow(16, PowerIndex));
            Value += CalcValue;

            PowerIndex -= 1;
        end;

        exit(Value);
    end;

    procedure int2hex(int: BigInteger) hex: Code[16]
    var
        // TypeHelper: Codeunit "Type Helper";
        Index: Integer;
        HexList: List of [Char];
        Remainder: Decimal;
        RemainderDict: Dictionary of [Integer, Char];
        HexNumber: Char;
        HexNumberList: List of [Char];
        HexBuilder: TextBuilder;
        quotient: BigInteger;
        Done: Boolean;
        NumberOfIntegers: Integer;
        MaxDict: Dictionary of [BigInteger, Text];
    begin
        // The function is supposed to convert an integer to hexadecimal.
        // More details can be deducted from the test itself.
        // Implement your solution here.
        if int < 0 then
            exit('');

        PopulateHexList(HexList);
        PopulateMaxDict(MaxDict);

        if MaxDict.ContainsKey(int) then
            exit(CopyStr(MaxDict.Get(int), 1, 16));

        quotient := int;
        NumberOfIntegers := StrLen(Format(int));
        repeat
            Index += 1;
            Remainder := quotient mod 16;
            Remainder := Round(Remainder, 1, '<');
            RemainderDict.Add(Index, HexList.Get(Remainder + 1));

            quotient := Round(quotient / 16, 1, '<');
            if quotient < 2 then
                if Round(quotient, 0.00001, '=') < 1 then
                    Done := true;
        until Done or (Index = NumberOfIntegers);

        HexNumberList := RemainderDict.Values;
        HexNumberList.Reverse();
        foreach HexNumber in HexNumberList do
            HexBuilder.Append(HexNumber);

        exit(CopyStr(HexBuilder.ToText(), 1, 16));

        // exit(CopyStr(TypeHelper.IntToHex(int), 1, 16));
    end;


    [TryFunction]
    procedure TryDMY2DATE(Day: Integer; Month: Integer; Year: Integer; var Date: Date)
    begin
        Date := Dmy2date(Day, Month, Year);
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

    local procedure PopulateHexList(var HexList: List of [Char])
    begin
        HexList.AddRange('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
    end;

    local procedure PopulateMaxDict(var MaxDict: Dictionary of [BigInteger, Text])
    begin
        Clear(MaxDict);
        MaxDict.Add(15, 'F');
        MaxDict.Add(255, 'FF');
        MaxDict.Add(4095, 'FFF');
        MaxDict.Add(65535, 'FFFF');
        MaxDict.Add(1048575, 'FFFFF');
        MaxDict.Add(16777215, 'FFFFFF');
        MaxDict.Add(268435455, 'FFFFFFF');
        MaxDict.Add(4294967295L, 'FFFFFFFF');
        MaxDict.Add(68719476735L, 'FFFFFFFFF');
        MaxDict.Add(1099511627775L, 'FFFFFFFFFF');
        MaxDict.Add(17592186044415L, 'FFFFFFFFFFF');
        MaxDict.Add(281474976710655L, 'FFFFFFFFFFFF');
        MaxDict.Add(4503599627370495L, 'FFFFFFFFFFFFF');
        MaxDict.Add(72057594037927935L, 'FFFFFFFFFFFFFF');
        MaxDict.Add(1152921504606846975L, 'FFFFFFFFFFFFFFF');
        MaxDict.Add(9223372036854775807L, '7FFFFFFFFFFFFFFF');
    end;

}

