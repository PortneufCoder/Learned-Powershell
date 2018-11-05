function divider ( $enum, $denum ) {

    Write-Host "divider begins..."
    $result = $enum / $denum
    Write-Host "Result: $result"
    Write-Host "dividing done..."

    trap { # trap allows me to create a scenario that runs when there's an error
    Write-Host "Whoops! There's an error..."
    Write-Host $_.ErrorID
    Write-Host $_.Exception.Message
    continue # this will go to the next line after the error

    }

}

Clear-Host 
divider 33 7

divider 21 0

 # We can also check for errors specifically

 function multiplier ($firstnum, $secondnum) {

    trap [System.DivideByZeroException] { # --> traps can added anywhere in the code, but best practice is that it stays consistent.
        Write-Host "Dude, you can't divide by zero!"
        continue

    }
    trap {
        Write-Host "Whoops! Another error..."
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        break

    }

    Write-Host "Multiplier begins..."
    $score = $firstnum * $secondnum 
    if ( $score -eq 0 ) {
        throw [System.DivideByZeroException]

    } else {
    Write-Host "Score: $score"
    Write-Host "Multiplying done"

    }
 }

 multiplier 45 5