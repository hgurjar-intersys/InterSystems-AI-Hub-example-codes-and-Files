/// Part 3: the agent from part 2, now with tools from Lab.Tools.Patients.
Class Lab.Agent.Assistant Extends %AI.Agent
{

Parameter PROVIDERCONFIG = "@{config:lab-llm}";

Parameter TOOLSETS = "Lab.Tools.Patients";

XData INSTRUCTIONS [ MimeType = text/markdown ]
{
You are a concise assistant for a hospital IT team. Answer in at most three sentences.
Use your tools to look up patients. Never guess data a tool did not return.
}

}
