# Part 4: teach your agent a skill

Adds a lab-results table and the `Lab.Skills.LabResults` skill.

```objectscript
do $system.OBJ.LoadDir("/path/to/part4-skills/Lab","ck",,1)
write ##class(Lab.Data.LabResult).Seed()
```

If you're starting with this part, also run `write ##class(Lab.Data.Patient).Seed()`.
