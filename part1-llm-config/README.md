# Part 1: put your LLM key in the Wallet

There are no classes in this part. Run each line from an IRIS terminal (`iris session IRIS -U USER`).
Each `write` line should print `1`.

## 1. Create the resources

```objectscript
set $namespace="%SYS"
write ##class(Security.Resources).Create("LabAIUse")
write ##class(Security.Resources).Create("LabAIEdit")
set $namespace="USER"
```

## 2. Store the key

Type the key in the terminal only, never in a file.

```objectscript
write ##class(%Wallet.Collection).Create("LabSecrets",{"UseResource":"LabAIUse","EditResource":"LabAIEdit"})
set key="PASTE-YOUR-OPENAI-KEY"
write ##class(%Wallet.KeyValue).Create("LabSecrets.LLMKey",{"Usage":"CUSTOM","Secret":{"api_key":(key)}})
kill key
```

## 3. Create the LLM config

On a fresh install, register the descriptor once (otherwise you get `ERROR #26414: No descriptor found for AI.LLM`):

```objectscript
do ##class(%ConfigStore.DescriptorManager).RebuildRegistry()
write ##class(%ConfigStore.Configuration).Create("AI","LLM","","lab-llm",{"model_provider":"openai","model":"gpt-4o-mini","api_key":"secret://LabSecrets.LLMKey#api_key"})
```

## 4. Check it

```objectscript
do ##class(%ConfigStore.Configuration).GetDetails("AI.LLM.lab-llm",.cfg)  write cfg.%ToJSON()
```

The output should show the pointer, not the key:

```json
{"model_provider":"openai","model":"gpt-4o-mini","api_key":"secret://LabSecrets.LLMKey#api_key"}
```

## Clean up

```objectscript
do ##class(%ConfigStore.Configuration).Delete("AI.LLM.lab-llm")
do ##class(%Wallet.KeyValue).Delete("LabSecrets.LLMKey")
```
