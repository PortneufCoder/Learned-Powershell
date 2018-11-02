# diving deeper into conditional logic in PowerShell

# we can use ; to put commands on single line

$cool = {Clear-Host; "PowerShell is more powerful than I thought!"}

& $cool # the & ampersand before calling the variable allows its execution

$fancyStuff = {"Goose must be a great dinner"}

$goose = $fancyStuff

for ($i = 0; $i -lt 3; $i++) {

    &$fancyStuff;
    &$goose;

} # --> both return the same thing

$value = {20 + 15}

&$value

$forty = 5 + (&$value) # wont work without parantheses

$forty

$forty = { return 40; Write-Host "I love PowerShell"} #return blocks the rest of the code from running
&$forty

# lets pass some parameters for evaluation

$drama = {

    $question = $args[0]
    $answer = $args[1]
    Write-Host "Eternal question: $question. Is it $answer"

}

&$drama "Whish is the cheatier team?" "Manchester united or Chelsea?"

# better method to do the above aka, clearer

$drama = {

   param ($question, $answer)
   Write-Host "Eternal question: $question. Is it $answer"

}

&$drama "Which is the cheatier team?" "Manchester united or Chelsea?"

# We can check for empty values.

 $qa = {

    param ($question, $answer) 
    if (!$answer) { $answer = "Error: you must provide an answer"}
    Write-Host "Here's the question: $question, The answer is $answer"

} # --> here, the ! (not) symbol indicates the variable is not a value

&$qa "Question?"

# explicit typing in PowerShell

$math = {

    param ([int] $x, [int] $y)
    return $x * $y

} # [int] forces the params to be integers

&$math 3 12

&$math 3 "twelve" # fails, an int was expected

Set-Location D:\

$myCoolFiles = {

    process {
        if ( $_.Name -like "*.ini" ) # --> $_ refers to the "current object"
        { return $_.Name }

        else { "Nothing"}
}

}
Get-ChildItem | &$myCoolFiles # Here we pass the 'process' pipeline through the 'dir' or 'Get-ChildItem' command so it can run


$getTxtFiles = {

    begin { $retval = "Here are the txt files:"} # begin here
    process {
        if ( $_.extension -like "*.txt")
        { $retval = $retval + "`t" + $_.Extension + "`r`n" } # do process

    }

    end { return $retval } # then end


}

Get-ChildItem | &$getTxtFiles