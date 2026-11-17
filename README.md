# InterSystems IRIS AI Hub: example code and files

Companion code for the InterSystems Developer Community series on InterSystems IRIS AI Hub.
Each part has its own folder, and each folder works on its own. The steps are in the article and in the folder's README.

| Part | Folder | What it covers |
|---|---|---|
| 1 | [`part1-llm-config`](part1-llm-config) | Put your LLM key in the Wallet and create an LLM config |
| 2 | [`part2-first-agent`](part2-first-agent) | Build your first agent |
| 3 | [`part3-tools`](part3-tools) | Give your agent tools |
| 4 | [`part4-skills`](part4-skills) | Teach your agent a skill |
| 5 | [`part5-policies`](part5-policies) | Decide who may call a tool, and keep a record |

## Before you start

- You need an InterSystems IRIS AI Hub Early Access build. Parts 1–2 were tested on build 154 and parts 3–5 on build 2027.1.0AI.123.
- Run everything in the `USER` namespace.
- Parts 2–5 use the LLM config `AI.LLM.lab-llm` from part 1.

## Loading a part

From an IRIS terminal in `USER`, point `LoadDir` at that part's `Lab` folder:

```objectscript
do $system.OBJ.LoadDir("/path/to/partN-.../Lab","ck",,1)
```

Every part reuses the same class names (`Lab.Agent.Assistant` and so on), so loading a later part replaces the earlier version.

## Never commit keys

None of these files contains an API key. Keys go in the IRIS Wallet only (see part 1).
