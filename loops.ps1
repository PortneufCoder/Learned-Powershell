# How to loop in PowerShell

# While

Clear-Host
$i = 10

while ($i -le 15)
{

    "`$i = $i" # We specify that the variable $i is $i in the loop
    $i = $i + 1

}

# while loops won't execute if the condition is already true

$a = 7

while ($a -le 6)
{

    "`$a = $a"
    $a++

} # --> nothing happens here based on line 17


# Do - always executes at least once

$b = 1

do
{

    "`$b = $b"
    $b++

} while ($b -le 5) # while executed at end of script, so if $b is greater than 5, it will only execute once

$c = 3
do
{

    "`$c = $c"
    $c++

} until ($c -gt 8)

# PowerShell "for" loops!

for ($f = 0; $f -le 5; $f++) # The initializer can also be set outside the loop

{

"`$f = $f"

}

$array = 5, 10
$array.Add(25,30,35,40,45)
$array