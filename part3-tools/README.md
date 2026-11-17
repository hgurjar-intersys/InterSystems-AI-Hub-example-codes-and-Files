# Part 3: give your agent tools

Adds a patient table, a toolset, and an agent that uses the toolset.

```objectscript
do $system.OBJ.LoadDir("/path/to/part3-tools/Lab","ck",,1)
write ##class(Lab.Data.Patient).Seed()
```

You should see `Load finished successfully.` followed by `1`.
