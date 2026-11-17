/// Sample lab results for the three fake patients.
Class Lab.Data.LabResult Extends %Persistent
{

Property MRN As %String [ Required ];

Property Test As %String;

Property Value As %Numeric(SCALE = 1);

Property Unit As %String;

Property RefRange As %String;

Property TakenOn As %Date;

/// Load 5 fake results. Run once: write ##class(Lab.Data.LabResult).Seed()
ClassMethod Seed() As %Status
{
    Do ..%KillExtent()
    For row = $LB("MRN001","HbA1c",8.2,"%","4.0-5.6","2026-10-02"), $LB("MRN001","HbA1c",7.4,"%","4.0-5.6","2026-11-03"), $LB("MRN002","Potassium",5.9,"mmol/L","3.5-5.1","2026-11-10"), $LB("MRN002","Creatinine",88,"umol/L","60-110","2026-11-10"), $LB("MRN003","Eosinophils",0.3,"10^9/L","0.0-0.5","2026-09-21") {
        Set r = ..%New(), r.MRN = $LG(row,1), r.Test = $LG(row,2), r.Value = $LG(row,3), r.Unit = $LG(row,4), r.RefRange = $LG(row,5), r.TakenOn = $ZDH($LG(row,6),3)
        $$$ThrowOnError(r.%Save())
    }
    Return $$$OK
}

}
