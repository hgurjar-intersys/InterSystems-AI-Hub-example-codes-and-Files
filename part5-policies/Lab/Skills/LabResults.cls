/// Skill: how to look up and report lab results.
Class Lab.Skills.LabResults Extends %AI.Agent.Skill [ DependsOn = Lab.Data.LabResult ]
{

XData SUMMARY [ MimeType = text/yaml ]
{
name: lab-results
description: Look up a patient's lab results and report them safely, with units and reference ranges.
}

XData INSTRUCTIONS [ MimeType = text/markdown ]
{
When the user asks about lab results:
1. Call GetLabResults with the patient's MRN.
2. Report each result as: test, value and unit, reference range, date.
3. If a value is outside its reference range, add the words OUT OF RANGE.
4. Do not interpret results or suggest treatment. Say that a clinician should review anything out of range.
}

XData Definition [ MimeType = application/xml ]
{
<ToolSet Name="LabResults">
  <Policies>
    <Authorization Class="Lab.Policy.LabAccess"/>
    <Audit Class="%AI.Policy.SystemAudit"/>
  </Policies>
  <Query Name="GetLabResults" Description="Lab results for one patient, newest first."
         Arguments="mrn As %String" MaxRows="20">
    <![CDATA[SELECT Test, Value, Unit, RefRange, TakenOn FROM Lab_Data.LabResult WHERE MRN = :mrn ORDER BY TakenOn DESC]]>
  </Query>
</ToolSet>
}

}
