# RUNNING SCRIPTS AND COMMANDS

Write-Host "Hello world!"
Get-TimeZone
Get-Service
Get-Service -Name "x"


# VARIABLES

$NumVar = 3
$StringVar = "One and two is"

Write-Host $NumVar
Write-Host $StringVar


# VARIABLE OPERATIONS

3 + 5
5 - 2
6 % 5

$NumVar + 10
$NumVar += 6

$StringVar + $NumVar

$InterpolatedString = "$StringVar $NumVar"
$InterpolatedString2 = "$StringVar $(1 + 2)."

Write-Host $InterpolatedString
Write-Host $InterpolatedString2

$StringVar -eq $NumVar
$StringVar -eq $NumVar


# OBJECT TYPES AND .NET BINDINGS

$NumVar.GetType()
$StringVar.GetType()
$InterpolatedString.GetType()

$true
$false
$null

[Math]
[Math]::PI
[Math]::Round(10.4)

[DateTime]::Now
$Now = [DateTime]::Now
$DayInterval = $Now - $Now.AddDays(-1)
$DayInterval.GetType()
$DayInterval.ToString()
$DayInterval.GetType() -eq [TimeSpan]
[TimeSpan]::new

# Casting
$NumAsString = "55"
"55" + 10
[Int]"55" + 10


# ARRAYS AND LISTS
$ArrayVar = @("bananas", "eggs", "milk")
"bread" -in $ArrayVar
$ArrayVar += "bread" 
"bread" -in $ArrayVar
$ArrayVar.GetType()
$StringArrayVar = [string[]]$ArrayVar
$StringArrayVar.GetType()

$ArrayVar[0]
$ArrayVar[-1]
$ArrayVar[1..3]
$ArrayVar[3..1]


# OBJECTS

# HashTables
$HashVar = @{
    "Han" = "Solo"
    "Boba" = "Fett"
    "IG" = 88
}
$HashVar.GetType()
$HashVar["Han"]
$HashVar["Chewbacca"] = $null
$HashVar.Count
$HashVar.Keys


# PsCustomObject
(Get-Service).GetType()
[PSCustomObject]
$PsVar = [PSCustomObject]$Hash
$PsVar2 = [PSCustomObject]@{
    "Neil" = "Armstrong"
    "Buzz" = "Aldrin"
}


# EXPORTING OUTPUT

Out-GridView -InputObject $HashVar
Export-Csv -InputObject $HashVar -Path "Star Wars Characters.csv" -NoTypeInformation
Export-Csv -InputObject [PSCustomObject[]]$HashVar `
    -Path "Star Wars Characters $((Get-Date).ToString("yyyy-MM-dd")).csv" `
    -NoTypeInformation


$Services = Get-Service
$Services.GetType()
$Services[0].GetType()
$PsServices = [PSCustomObject[]]$Services
$PsServices | Out-GridView
$PsServices | Export-Csv -Path "Services.csv"
$PsServices | Export-Csv `
    -Path "Services $((Get-Date).ToString("yyyy-MM-dd")).csv" `
    -NoTypeInformation


# THE PIPELINE
$Services = Get-Service
$Services | Select "Name", "Status"
$Services | Where {$_.Status -eq "Running"}
$Services | ForEach {
    $ServiceName = $_.Name
    Write-Host "Doing some action on $ServiceName"
}
 = $Services

# CREATING FUNCTIONS