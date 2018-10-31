#___________________________#
# HASH TABLES
#___________________________#

# hashes in powershell are basically objects with key-value pairs.

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
$hash # show the new row

# remove value
$hash.Remove("Pluralsight")
$hash

# check if key exists
$hash.Contains("bleep") #false
