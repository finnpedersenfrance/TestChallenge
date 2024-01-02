Codeunit 50132 "Test Challenge 02"
{
    Subtype = Test;

    var
        Solutions: Codeunit "Solutions";

    trigger OnRun()
    begin
    end;

    procedure hex2int(hex: Code[16]) int: BigInteger
    begin
        // The function is supposed to convert a hex number to an integer.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        exit(Solutions.hex2int(hex));
    end;

    procedure int2hex(int: BigInteger) hex: Code[16]
    begin
        // The function is supposed to convert an integer to hexadecimal.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        exit(Solutions.int2hex(int));
    end;

    [TryFunction]
    procedure hex2intTry(hex: Code[16]; var int: BigInteger)
    begin
        int := hex2int(hex);
    end;

    [Test]
    procedure TestSimpleInt2Hex01()
    var
        int: Integer;
        hex: Code[20];
    begin
        int := 15;
        hex := 'F';
        if not (int2hex(int) = hex) then
            Error('Expected: int2hex("%1") = %2', int, hex);
    end;

    [Test]
    procedure TestSimpleInt2Hex02()
    var
        int: Integer;
        hex: Code[20];
    begin
        int := 255;
        hex := 'FF';
        if not (int2hex(int) = hex) then
            Error('Expected: int2hex("%1") = %2', int, hex);
    end;

    [Test]
    procedure TestSimpleHex2Int03()
    var
        int: Integer;
        hex: Code[20];
    begin
        int := 15;
        hex := 'F';
        if not (int = hex2int(hex)) then
            Error('Expected: hex2int("%1") = %2', hex, int);
    end;

    [Test]
    procedure TestSimpleHex2Int04()
    var
        int: Integer;
        hex: Code[20];
    begin
        int := 255;
        hex := 'FF';
        if not (int = hex2int(hex)) then
            Error('Expected: hex2int("%1") = %2', hex, int);
    end;

    [Test]
    procedure TestRandomDouble05()
    var
        int: Integer;
        expectedInt: Integer;
        i: Integer;
    begin
        for i := 1 to 100000 do begin
            int := Random(999999999);
            expectedInt := hex2int(int2hex(int));
            if not (expectedInt = int) then
                Error('Expected: converting "%1" to hex and back should result in the original value. Got %2', int, expectedInt);
        end;
    end;

    [Test]
    procedure TestRandomTrible06()
    var
        int: Integer;
        hex: Code[20];
        expectedHex: Code[10];
        i: Integer;
    begin
        for i := 1 to 100000 do begin
            int := Random(999999999);
            hex := int2hex(int);
            expectedHex := int2hex(hex2int(hex));
            if not (expectedHex = hex) then
                Error('Expected: converting "%1" to int and back should result in the original value. Got %2', hex, expectedHex);
        end;
    end;

    [Test]
    procedure Test15hexdigits07()
    var
        int: BigInteger;
        hex: Code[20];
        expectedHex: Code[20];
        i: Integer;
        j: Integer;
    begin
        for i := 1 to 15 do begin
            int := 1;
            for j := 1 to i do
                int := int * 16;
            int := int - 1;
            hex := int2hex(int);
            expectedHex := PadStr('', i, 'F');
            if not (expectedHex = hex) then
                Error('Expected: (16^%1)-1 should result in F %1 times. Got "%2" <> "%3"', i, hex, expectedHex);
        end;
    end;

    [Test]
    procedure TestMaxBigInteger08()
    var
        int: BigInteger;
        hex: Code[20];
        expectedHex: Code[20];
    begin
        int := 9223372036854775807L;
        hex := int2hex(int);
        expectedHex := PadStr('7', 16, 'F');
        if not (expectedHex = hex) then
            Error('Expected: int2hex %1 should result in %3 (%5). Got %2 (%4)', int, hex, expectedHex, StrLen(hex), StrLen(expectedHex));
    end;

    [Test]
    procedure TestNegativeNumber2Hex09()
    var
        int: BigInteger;
        hex: Code[20];
        expectedHex: Code[20];
    begin
        int := -1;
        hex := int2hex(int);
        expectedHex := '';
        if not (expectedHex = hex) then
            Error('Expected: int2hex %1 should result in the empty string. Got "%2"', int, hex);
    end;

    [Test]
    procedure TestHex2IntIncorrectString10()
    var
        int: BigInteger;
        hex: Code[20];
    begin
        hex := 'ABCDEFG';
        if hex2intTry(hex, int) then
            Error('I expected the hex2int("%1") to fail, but it returned %2', hex, int);
    end;

    [Test]
    procedure TestHex2IntIncorrectString11()
    var
        int: BigInteger;
        hex: Code[20];
    begin
        hex := 'ABZDE';
        if hex2intTry(hex, int) then
            Error('I expected the hex2int("%1") to fail, but it returned %2', hex, int);
    end;

    [Test]
    procedure TestSTXkey2Property()
    var
        int: BigInteger;
        expectedInt: BigInteger;
        hex: Code[20];
    begin
        // This is a line from the fin.stx file.
        // 00033-00181-030-0: CaptionML

        // You notice the first part: 00033-00181
        // Let us convert each of the two numbers to HEX put it together and reconvert it to INTEGER
        // It should become 8629. That is a Property Number.

        // This is a line from the Translation file
        // T3-P8629-A1033-L999:Payment Terms
        // So now we know that "Payment Terms" is the CaptionML (ENU) of Table 3.

        int := hex2int(int2hex(33) + int2hex(181));
        expectedInt := 8629;
        if not (int = expectedInt) then
            Error('I expeced to get %1 when converting 00033-00181. I got %2', expectedInt, int);
    end;
}

