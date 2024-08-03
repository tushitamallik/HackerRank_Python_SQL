/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
DECLARE @var int             -- Declare
SELECT @var = 1             -- Initialization
WHILE @var <= 20                 -- condition
BEGIN                         -- Begin
PRINT replicate('* ', @var) -- Print
SET @var = @var + 1         -- decrement
END                         -- END
