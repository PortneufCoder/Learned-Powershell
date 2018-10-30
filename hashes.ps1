#___________________________#
# HASH TABLES
#___________________________#

$hash = @{
"key" = "someValue";
"Pluralsight" = "pluralsight.com";
"learn" = "powershell", "c#"
}

$hash # display all vals
$hash["learn"] # get value of specific key
$hash.learn # same thing

# add value to the hash table(object)

$hash["Top Gear"] = "t0pgear.com"
$hash

# remove value
$hash.Remove("Pluralsight")
$hash
