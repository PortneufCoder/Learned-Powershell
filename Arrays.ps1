$array = "arcane", "code"
$array[0]
$array[1]

$array.GetType() #array

#updating arrays
$names = "victor", "ajani"

$names[0] = "Another"

$names[1] = "String"

$names

# declare an empty array
$newArray = @()

$numbers = 1, 45, 77, 82

$numbers -contains 45 #True


#push  items into the empty array

$newArray = 4..8 # numeric range notation
$newArray
