# branching - if/else

$let = 35

if ($let -eq 60)  # --> else condition
{

"If condition"
}

else
{
"else condition"
}


if ($let -eq 35) # --> if condition
{

"If condition"
}

else
{
"else condition"
}

# powershell switch statements
# switch checks all the options even after it finds a first match

$guess = 1875
switch ($guess)
{

48 {"Forty eight"}
1350 {"Thirteen fifty"}
1875 {"Eighteen seventy-five"}
79 {"Seventy-nine"}
default {"default"}

} # --> Eighteen seventy-five

