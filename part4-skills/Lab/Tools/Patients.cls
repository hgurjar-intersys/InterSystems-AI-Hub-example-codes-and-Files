/// ToolSet: the tools the LLM may call.
Class Lab.Tools.Patients Extends %AI.ToolSet [ DependsOn = Lab.Data.Patient ]
{

XData Definition [ MimeType = application/xml ]
{
<ToolSet Name="Patients">
  <Description>Look up patients.</Description>
  <Tool Name="GetPatient" Method="GetPatient"/>
  <Query Name="FindByDiagnosis" Description="List patients whose diagnosis contains a word, e.g. Asthma."
         Arguments="term As %String" MaxRows="10">
    <![CDATA[SELECT MRN, Name, Diagnosis FROM Lab_Data.Patient WHERE UPPER(Diagnosis) [ UPPER(:term)]]>
  </Query>
</ToolSet>
}

/// Get a patient's name, birth year and diagnosis by MRN (e.g. MRN001).
ClassMethod GetPatient(mrn As %String(DESCRIPTION = "Medical record number, e.g. MRN001")) As %String
{
    Set p = ##class(Lab.Data.Patient).MRNIdxOpen(mrn)
    If '$IsObject(p) Return "No patient with MRN "_mrn
    Return {"mrn":(p.MRN),"name":(p.Name),"birthYear":(p.BirthYear),"diagnosis":(p.Diagnosis)}.%ToJSON()
}

}
