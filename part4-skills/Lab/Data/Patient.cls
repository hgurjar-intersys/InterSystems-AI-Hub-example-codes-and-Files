/// Sample data for the agent to look up: three fake patients.
Class Lab.Data.Patient Extends %Persistent
{

Property MRN As %String [ Required ];

Property Name As %String;

Property BirthYear As %Integer;

Property Diagnosis As %String(MAXLEN = 200);

Index MRNIdx On MRN [ Unique ];

/// Load 3 fake patients. Run once: write ##class(Lab.Data.Patient).Seed()
ClassMethod Seed() As %Status
{
    Do ..%KillExtent()
    For row = $LB("MRN001","Ana Lopez",1980,"Type 2 diabetes"), $LB("MRN002","Ben Okafor",1975,"Hypertension"), $LB("MRN003","Chen Wei",1992,"Asthma") {
        Set p = ..%New(), p.MRN = $LG(row,1), p.Name = $LG(row,2), p.BirthYear = $LG(row,3), p.Diagnosis = $LG(row,4)
        $$$ThrowOnError(p.%Save())
    }
    Return $$$OK
}

}
