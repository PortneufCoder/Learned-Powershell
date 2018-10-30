Clear-Host

"This is a string"
'This is a string too!'

# Like in js, both single and double quotes can be mixed, e.g

"I can't believe how cool Powershell is"

# You can use double quotes to get qoutes in strings like below:
"I just wanted to say ""Hello World"", ok?"

# new line char is `n
"Plural`nsight"

# We use 'heretext to write longer sentences on seperate lines'

$heretext = @"
Some text
Some more text
            a bit more

a blank line above
"@

$heretext #call your var

# Powershell also supports string interpolation

Set-Location D:\PowerShell_Course

$items = (Get-ChildItem).Count
$loc = Get-Location

"There are $items items in the folder $loc."


# We can use expressions in strings, they need to be wrapped in $(). 
# Once you do that, whatever is inside will be evaluated.

"There are $((Get-ChildItem).Count) items in the folder $(Get-Location)."

"The 30% tip of a 33.35 dollar bill is $(33.35 * 0.14) dollars"

# String Formatting - c# like syntax is supported
# In C we'd use:

[string]::Format("There are {0} items.", $items)

# PowerShell shortcut.{0} is a placeholder for $items. -f is for format
# the number stands for the index of where the variable is called
"There are {0} items." -f $items

"There are {0} items in the location {1}." -f $items, $loc

# My example demo

$name = "Victor"
$myAge = $(6 * 5 + 2)
$lair = "Quebec"
$school = "Brainstation"


"my name is {0} and I'm {1} years of age. I live in {2} and I recently studied at {3}.The new BladeRunner movie happens in {4}" -f $name, $myAge, $lair, $school, ("20" + "19")  

# Regular Expressions
"888-368-1240" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}" #expect a numbet btw 0 and 9, 3 digits long, evaluate with what's on left
"zzz-368-1240" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}"
"888.368.1240" -inotmatch "[0-9]{3}-[0-9]{3}-[0-9]{4}"
