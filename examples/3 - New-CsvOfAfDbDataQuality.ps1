using Assembly OSIsoft.AFSDK

$AF_SERVER_NAME = "pi0.radixeng.us"
$AF_DATABASE_NAME = "AF Example Kit - Pump Condition Based Maintenance (RDX)"

$PiSystem = [OSIsoft.AF.PISystem]::CreatePISystem($AF_SERVER_NAME)
$AfDatabase = $PiSystem.Databases[$AF_DATABASE_NAME]


# Using search tokens to find all AF Attributes in the AF Database

$SearchTokens = [Collections.Generic.List[OSISoft.AF.Search.AFSearchToken]]::new()

$NestedTokens = [Collections.Generic.List[OSISoft.AF.Search.AFSearchToken]]::new()

$NestedTokens.Add([OSIsoft.AF.Search.AFSearchToken]::new(
    [OSIsoft.AF.Search.AFSearchFilter]::Name,
    [OSIsoft.AF.Search.AFSearchOperator]::Equal,
    '*'
))

$SearchTokens.Add([OSIsoft.AF.Search.AFSearchToken]::new(
    [OSIsoft.AF.Search.AFSearchFilter]::Element,
    [OSIsoft.AF.Search.AFSearchOperator]::Equal,
    $null,
    $NestedTokens
))

$SearchTokens.Add([OSIsoft.AF.Search.AFSearchToken]::new(
    [OSIsoft.AF.Search.AFSearchFilter]::Name,
    [OSIsoft.AF.Search.AFSearchOperator]::Equal,
    "*"
))

$AfAttributeSearch = [OSIsoft.AF.Search.AFAttributeSearch]::new(
    $AfDatabase,
    "AllAfAttributes",
    [OSIsoft.AF.Search.AFSearchToken[]]$SearchTokens
)
$AfAttributeSearch.CacheTimeout = [TimeSpan]::FromMinutes(10)
$AfAttributeSearch.GetTotalCount()
$SearchResults = $AfAttributeSearch.FindAttributes(0, 500)

$Rows = [Collections.Generic.List[PSCustomObject]]::new()
foreach($Attribute in $SearchResults)
{
    $RowData = [Collections.Specialized.OrderedDictionary]::new()
    $RowData.Add("Name", $Attribute.Name)
    $RowData.Add("Path", $Attribute.GetPath())
    $RowData.Add("Template", $Attribute.Template)
    
    $AttributeValue = $Attribute.GetValue()
    $RowData.Add("Value.TimeStamp", $AttributeValue.TimeStamp)
    $RowData.Add("Value.Value", $AttributeValue.Value)
    $RowData.Add("Value.Status", $AttributeValue.Status)
    $Rows.Add([PSCustomObject]$RowData)
}

$Rows | Out-GridView
