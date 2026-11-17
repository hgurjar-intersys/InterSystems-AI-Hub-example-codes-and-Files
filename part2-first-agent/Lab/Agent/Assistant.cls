/// Declarative agent: the model comes from the Config Store entry AI.LLM.lab-llm,
/// the system prompt from XData INSTRUCTIONS. No tools yet; part 3 adds them.
Class Lab.Agent.Assistant Extends %AI.Agent
{

Parameter PROVIDERCONFIG = "@{config:lab-llm}";

XData INSTRUCTIONS [ MimeType = text/markdown ]
{
You are a concise assistant for a hospital IT team. Answer in at most three sentences.
If you don't know something, say so. Never make up patient data.
}

}
