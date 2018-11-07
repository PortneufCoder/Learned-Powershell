# Working with files 

Set-Location "D:\"
Get-ChildItem "*.txt"

# Get-Content gets stuff from disk
$a = Get-Content "eula.1031.txt"
$a

# When powershell gets the contents of a file,
# the output is created as an array
# to prove that...

$a.GetType() # --> System.Array

# examples
$a[4]
$a[7]

for ( $i=0; $i -le $a.Count; $i++ )
    { $a[$i] } # --> since its an array we can loop over it.

# to combine the text we can use Join, passing in the seperator and the variable

$seperator = [System.Environment]::NewLine # the thing that seperates the array is a new line
$allText = [string]::Join($seperator, $a)

$allText
$allText.GetType() # --> Now we see its a string



# writing to disk, we use Set-Content
$newValue = "Powershell Powershell Powershell is great, awesome, freaking amazing!"
Set-Content -Value $newValue  -Path "testing.txt"
Get-Content "testing.txt" 

# Careful, Set-Content will overwrite any existing data, and replace it with the new value.

# To append we use Add-Content, so no overwriting happens
Add-Content -Value "Vic's value" -Path "testing.txt"
Get-Content "testing.txt"

# We can save objects by outputting to .CSV

Get-Process | Export-Csv "Processes.csv"

# I'm saving the result's headers into a variable for later use.

$header = Get-Content "header.txt"

$header.GetType()

$header

for ( $b = 0; $b -le $header.Count; $b++ ) {
    $header[$b]


}

$splitHeader = [System.Environment]::NewLine
$formattedHeader = [string]::Join($splitHeader, $header)

$formattedHeader


# XML files
# Create an XML template

$courseTemplate = @" 
    <courses version="1.0">
        <course>
            <name></name>
            <level></level>
        </course>
    </courses>
"@ # --> create an xml template

# export the content to the file
$courseTemplate | Out-File "d:\udemy.xml"

$courseXml = New-Object xml
$courseXml.Load("d:\udemy.xml")