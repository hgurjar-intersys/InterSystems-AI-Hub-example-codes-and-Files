# Part 5: decide who may call a tool, and keep a record

Adds the authorization policy `Lab.Policy.LabAccess` and attaches it, together with the built-in
`%AI.Policy.SystemAudit`, to the skill. The roles, users and grants are created in the terminal; see the article.

```objectscript
do $system.OBJ.LoadDir("/path/to/part5-policies/Lab","ck",,1)
```

The article creates two users, `clerk` and `clinician`. Choose your own passwords.
