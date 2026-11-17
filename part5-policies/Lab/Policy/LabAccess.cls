Include %AI

/// Authorization policy: only users who hold the LabClinical resource may read lab results.
Class Lab.Policy.LabAccess Extends %AI.Policy.Authorization
{

Method %CanExecute(toolref As %String, call As %DynamicObject, metadata As %DynamicObject) As %Status
{
    If (call.name = "GetLabResults") && '$System.Security.Check("LabClinical", "USE") {
        Return $$$ERROR($$$AICoreToolAccessDenied, "Lab results need the LabClinical resource. User "_$Username_" does not have it.")
    }
    Return $$$OK
}

}
