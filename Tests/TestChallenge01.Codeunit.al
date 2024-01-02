Codeunit 50131 "Test Challenge 01"
{
    Subtype = Test;

    var
        Solutions: Codeunit "Solutions";

    trigger OnRun()
    begin
    end;

    procedure AddComment(var Comment: Text[1024]; NewComment: Text[1024])
    begin
        AddCommentSeparator(Comment, NewComment, ';');
    end;

    procedure AddCommentSeparator(var AllComments: Text[1024]; NewComment: Text[1024]; Separator: Text[10])
    begin
        // The function is supposed to append the NewComment to the AllComments variable and thus return it.
        // The comments are separated by the Separator text.
        // More details can be deducted from the test itself.
        // Implement your solution here.

        Solutions.AddCommentSeparator(AllComments, NewComment, Separator);
    end;

    procedure EvaluateDateFromXMLDateTime(var Date: Date; ISO8601DateTime: Text[100]): Boolean
    var
        Year: Integer;
        Month: Integer;
        Day: Integer;
    begin
        // The function is supposed to extract the date from an ISO 8601 DateTime and return it through the Date variable
        // If a valid date was found, the function returns TRUE otherwise FALSE.
        // More details can be deducted from the test itself.
        // Implement your solution here. You can use the TryDMY2DATE function. You can use the TryDMY2DATE function below.

        exit(Solutions.EvaluateDateFromXMLDateTime(Date, ISO8601DateTime));
    end;

    [TryFunction]
    procedure TryDMY2DATE(Day: Integer; Month: Integer; Year: Integer; var Date: Date)
    begin
        Date := Dmy2date(Day, Month, Year);
    end;

    [Test]
    procedure TestAddComment1()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := '';
        AddComment(Text, '');
        if not (Text = '') then
            Error('Expected: Adding an empty string to an empty string should result in an empty string. "%1"', Text);
    end;

    [Test]
    procedure TestAddComment2()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := 'OK';
        OriginalText := Text;
        AddComment(Text, '');
        if not (Text = OriginalText) then
            Error('Expected: Adding an empty string to a non empty string should result in the original string. "%1"', Text);
    end;

    [Test]
    procedure TestAddComment3()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := '';
        AddComment(Text, 'OK');
        if not (Text = 'OK') then
            Error('Expected: Adding a non empty string to an empty string should result in the added string. "%1"', Text);
    end;

    [Test]
    procedure TestAddComment4()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := 'OK';
        OriginalText := Text;
        AddComment(Text, 'OK');
        if not (Text = OriginalText) then
            Error('Expected: Adding the identical comment again should not change the string. "%1"', Text);
    end;

    [Test]
    procedure TestAddComment5()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := 'OK1;OK2;OK3;OK4';
        OriginalText := Text;
        AddComment(Text, 'OK3');
        if not (Text = OriginalText) then
            Error('Expected: Adding the same comment again should not change the string. "%1"', Text);
    end;

    [Test]
    procedure TestAddComment6()
    var
        Text: Text[1024];
        OriginalText: Text[1024];
    begin
        Text := PadStr('', MaxStrLen(Text), 'X');
        OriginalText := Text;
        AddComment(Text, 'Y');
        if not (Text = OriginalText) then
            Error('Expected: Adding more text to a string that is already full should not change the string. "%1"', Text);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime1()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := '2019-05-07T00:00:00';
        if not EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to extracte a date from "%1"', DateTimeText);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime2()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := '2019-05-07';
        if not EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to extracte a date from "%1"', DateTimeText);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime3()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := '2019-02-28T12:34:56';
        if not EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to extracte a date from "%1"', DateTimeText);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime4()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := '2019-02-29T12:34:56';
        if EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to fail extracting a date from "%1"', DateTimeText);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime5()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := 'YYYY-MM-DDT12:34:56';
        if EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to fail extracting a date from "%1"', DateTimeText);
    end;

    [Test]
    procedure TestEvaluateDateFromXMLDateTime6()
    var
        Date: Date;
        DateTimeText: Text;
    begin
        DateTimeText := '';
        if EvaluateDateFromXMLDateTime(Date, DateTimeText) then
            Error('Expected to fail extracting a date from an empty string');
    end;

    [Test]
    procedure TestTryDMY2DATE()
    var
        Date: Date;
    begin
        if not Solutions.TryDMY2DATE(29, 2, 2020, Date) then
            Error('Expected to evaluate 29/2/2020 to a date.');

        if Solutions.TryDMY2DATE(29, 2, 2019, Date) then
            Error('Expected to fail evaluating 29/2/2019 to a date.');
    end;
}

