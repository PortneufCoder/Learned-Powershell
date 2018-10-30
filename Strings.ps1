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


# We can use expressions in strings, they need to be wrapped in $()
