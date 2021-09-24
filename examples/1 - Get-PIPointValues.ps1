# 2 Ways to Import AF SDK
using Assembly OSIsoft.AFSDK
[Reflection.Assembly]::LoadWithPartialName("OSIsoft.AFSDK") | Out-Null

# USER 
$PI_SERVER_NAME = "pi0.radixeng.us"
$PI_POINT_NAME = "SINUSOID"


$PiPoint = [OSIsoft.AF.PI.PIPoint]::FindPIPoint("\\$PI_SERVER_NAME\$PI_POINT_NAME")
$Value = $PiPoint.RecordedValue("*")
$RecordedValues = $PiPoint.RecordedValuesByCount(
    "*",
    100,
    $false,
    [OSIsoft.AF.Data.AFBoundaryType]::Inside,
    $null,
    $false
)

$RecordedValues.GetType()
[PSCustomObject[]] | Out-GridView

$PsRecordedValues = [Collections.Generic.List[PSCustomObject]]::new()
for($i=0; $i -lt $RecordedValues.Count; $i++)
{
    # $Value = $RecordedValues[$i]
    # $ValueObj = @{
    #     "TimeStamp" = $Value.TimeStamp
    #     "Value" = $Value.Value
    #     "Status" = $Value.Status
    # }
    
    # Odered Dictionary gives us a way to preserve ordering.
    $ValueObj = [Collections.Specialized.OrderedDictionary]::new()
    $ValueObj.Add("TimeStamp", $Value.Timestamp)
    $ValueObj.Add("Value", $Value.Value)
    $ValueObj.Add("Status", $Value.Status)

    $PsRecordedValues.Add([PSCustomObject]$ValueObj)
    
}

# $PsRecordedValues
$PsRecordedValues | Out-GridView