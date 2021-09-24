using Assembly OSIsoft.AFSDK

$AF_SERVER_NAME = "pi0.radixeng.us"
$AF_DATABASE_NAME = "AF Example Kit - Pump Condition Based Maintenance (RDX)"

$PiSystem = [OSIsoft.AF.PISystem]::CreatePISystem($AF_SERVER_NAME)
$AfDatabase = $PiSystem.Databases[$AF_DATABASE_NAME]

# Finding an Element
$PumpStationElement = $AfDatabase.Elements["Pump Station"]
$Pump01Element = $PumpStationElement.Elements["Pump01"]
$Pump01Attributes = $Pump01Element.Attributes
$Pump01Analyses = $Pump01Element.Analyses
$Pump01Template = $Pump01Element.Template

# Finding Templates
$AfDatabaseTemplates = $AfDatabase.ElementTemplates

# Finding an AF Object (right-click in PI System Explorer and copy path)
$AF_OBJECT_PATH = "\\pi0\AF Example Kit - Pump Condition Based Maintenance (RDX)\Pump Station\Pump01"
$AfObject = [OSIsoft.AF.AFObject]::FindObject($AF_OBJECT_PATH)

# SEARCHING
# Searching for all Analyses in an AF Database

# Using query strings

$AfAnalysisSearch = [OSIsoft.AF.Search.AFAnalysisSearch]::new(
    $AfDatabase,
    "AllAnalyses",
    "*"
)
$AfAnalysisSearch.CacheTimeout = [TimeSpan]::FromMinutes(10)
$AfAnalysisSearch.GetTotalCount()
$SearchResults = $AfAnalysisSearch.FindAnalyses(0, $false, 500)
$SearchResults.GetType
$AfAnalyses = [Linq.Enumerable]::ToArray($SearchResults)

# Using search tokens to find running analyses

$SearchTokens = [Collections.Generic.List[OSISoft.AF.Search.AFSearchToken]]::new()
$SearchTokens.Add([OSIsoft.AF.Search.AFSearchToken]::new(
    [OSIsoft.AF.Search.AFSearchFilter]::Name,
    [OSIsoft.AF.Search.AFSearchOperator]::Equal,
    "*"
))
$SearchTokens.Add([OSIsoft.AF.Search.AFSearchToken]::new(
    [OSIsoft.AF.Search.AFSearchFilter]::Status,
    [OSIsoft.AF.Search.AFSearchOperator]::Equal,
    [OSIsoft.AF.Analysis.AFStatus]::Enabled
))

$AfAnalysisSearch = [OSIsoft.AF.Search.AFAnalysisSearch]::new(
    $AfDatabase,
    "AllAnalyses",
    $SearchTokens
)
$AfAnalysisSearch.CacheTimeout = [TimeSpan]::FromMinutes(10)
$AfAnalysisSearch.GetTotalCount()
$SearchResults = $AfAnalysisSearch.FindAnalyses(0, $false, 500)
$SearchResults.GetType()
$AfAnalyses = [Linq.Enumerable]::ToArray($SearchResults)

$AfAnalyses | Out-GridView

# If you want to find all Analyses on an AF Server, you can iterate through each AF Database.
# Alternatively, you can use the Analysis Service's QueryRuntime method, which will yield useful performance metrics as well.