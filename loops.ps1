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

# iterating over a collection 1 by 1
$array = @()
$array += 25,30,35,40,45 # push stuff into the existing array
$array

for ($i = 0; $i -lt $array.Length; $i++)
{

    "$array[$i]=" + $array[$i] # log each value of $array as the for loop iterates



}

$newarray = "Dublin", "Carlow", "Kerry", "Donegal";

foreach ($iteration in $newarray) # $iteration holds the value of each item in the array as the iteration works

{

"$iteration = $iteration"


}

# practice

$newarray = "Dublin", "Carlow", "Kerry", "Donegal";

for ($d = 0; $d -lt $newarray.Length; $d++) {

    if ($newarray[$d] -like "Monaghan") {
    
    "$newarray[$d]=" + $newarray[$d]


} else {

    New-Item -Path . -Name "else.txt" -ItemType "file" -Value "Tested the loop"
}

} # --> file created


# How to use foreach on tht output of a cmdlet
# My example

Set-Location D:/

foreach ($file in dir) {

    if($file.Extension -like "*.ps1") {

    Move-Item -Path . -Destination D:\Test
    $file.Name
} 

} 

# use 'break' to exit the above loop


Set-Location D:\tfs_new # --> This sets starting point of my code

foreach ($key in Get-ChildItem) {

    if($key.CreationTime -contains "November-07-07") {

        $key.Name
        continue


    }

    "This file does not match: $key"

} # --> 'continue' performs the action and exits on first hit

