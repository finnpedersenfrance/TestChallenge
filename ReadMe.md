# Test Challenge

The idea behind the Test Challenge is to learn about how to write better tests and functions in Microsoft Dynamics NAV and Microsoft Dynamics 365 Business Central. 

This project is inspired by the book Automated Testing in Microsoft Dynamics 365 Business Central written by Luc van Vugt.

I hope that more NAV and BC developers will start writing Automated Tests for their solutions. 

Finn Pedersen

## C/AL or AL
The C/AL code is located in the Source folder. The AL code is in the root. 

I have used the https://www.fornav.com/ converter to automatically generate the AL code from the C/AL code. 

## The first challenge
You have two functions to implement. 

### Add Comment with Separator
The function is supposed to append the NewComment to the AllComments variable and thus return it.
The comments are separated by the Separator text.
More details can be deducted from the test itself.

```` 
    procedure AddCommentSeparator(var AllComments: Text[1024];NewComment: Text[1024];Separator: Text[10])
    begin
        // Implement your solution here.
        AllComments := '';
    end;
```` 

### Evaluate Date From ISO 8601 DateTime String
The function is supposed to extract the date from an ISO 8601 DateTime and return it through the Date variable. 
If a valid date was found, the function returns TRUE otherwise FALSE.
More details can be deducted from the test itself.

```` 
    procedure EvaluateDateFromXMLDateTime(var Date: Date;ISO8601DateTime: Text[100]): Boolean
    begin
        // Implement your solution here. You can use the TryDMY2DATE function below.
        Date := 0D;
        exit(false);
    end;
```` 

## The second challenge
You have two functions to implement. 

### Convert an integer to hexadecimal
The function is supposed to convert a hex number to an integer.
More details can be deducted from the test itself.

```` 
    procedure hex2int(hex: Code[16]) int: BigInteger
    begin
        // Implement your solution here.
        exit(0);
    end;
```` 

### Convert a hexadecimal to integer
The function is supposed to convert an integer to hexadecimal.
More details can be deducted from the test itself.

```` 
    procedure int2hex(int: BigInteger) hex: Code[16]
    begin
        // Implement your solution here.
        exit('');
    end;
```` 

## The third challenge
The third challenge is not really a challenge, but rather an illustration of what tests can do. 

If you take a look at the code, you will see that I apparently found a bug in the POWER function in NAV.
The POWER function fails to calculate a really big number: 16^15. 
