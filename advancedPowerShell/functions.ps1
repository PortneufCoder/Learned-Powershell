# PowerShell functions


function get-fullName ( $fname, $lname ) {
 
    Write-Host ( $fname + " " + $lname )

}

get-fullName "Code is" "good!" # simple basic syntax like most languages

# working with refs in powershell fncs...

function Set-Fvar( [ref] $myparam ) {
    $myparam.Value = 38


}

$fvar = 42
"fvar before: $fvar"
Set-FVar ([ref] $fvar) # calling ref here switches the value of my parameter, so on line 21 fvar is now 38.
"fvar after: $fvar"

# pipeline functions!

function Get-CoolFiles () {

    begin { $retval = "Here are your cool files: `r`n" }
    process {
            if ( $_.Name -like "*.ps1" ) # this func gives me only ps1 files
            { $retval = $retval + $_.Name }

    }
    end { return $retval }
}

Get-ChildItem | Get-CoolFiles

# lets use a filter function below, it only returns certain
# objects that fit the defined criteria

filter Show-INIFiles {

    Set-Location d:\
    $filename = $_.Name
    "Here are the ini files: "
    if ( $filename -like "*.ini" ) {

        return $_

    }

}

Get-ChildItem | Show-INIFiles

# Now lets create a function below that lists all files in the directory

function List-AllFiles () {

    begin { $finalval = "Here are all the files: `r`n" }
    process {
            $finalval = $finalval + "`t" + $_.Name + "`r`n"

    }
    end { return $finalval }
}

Get-ChildItem | List-AllFiles

# Now lets combine the output from both to create a pipeline!

Get-ChildItem | Show-INIFiles | List-AllFiles

filter Show-TXTFiles {

    Set-Location d:\
    $filename = $_.Name
    if ( $filename -like "*.txt" ) {
        "Here are the text files: "
        return $_

    }

}

Get-ChildItem | Show-INIFiles | List-AllFiles
Get-ChildItem | Show-txtFiles | List-AllFiles

# In the above, we are able to use the same function more than once!