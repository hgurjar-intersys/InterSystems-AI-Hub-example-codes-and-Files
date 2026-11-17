/// Part 5: same agent as part 4. The policies live on the skill (Lab.Skills.LabResults).
Class Lab.Agent.Assistant Extends %AI.Agent
{

Parameter PROVIDERCONFIG = "@{config:lab-llm}";

Parameter TOOLSETS = "Lab.Tools.Patients";

Parameter SKILLS = "Lab.Skills.LabResults";

XData INSTRUCTIONS [ MimeType = text/markdown ]
{
You are a concise assistant for a hospital IT team. Answer in at most three sentences.
Use your tools to look up patients. Never guess data a tool did not return.
}

}
