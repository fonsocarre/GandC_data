# Getting and Cleaning data project
### Alfonso del Carre

`main.R` is the main script. It reads the data in the original folder 
structure. This data has to be located in `<project_folder>/data`.

After executing `main.R`, only two variables stay in the workspace:
`reducedData` and `summ`, which are further explained in `CodeBook.md`.

`summaryData.txt` shows the output of
> write.table(summ, "summaryData.txt", row.names = F)

The file is huge because there were a lot of variables with `mean` or `sd` in 
their names. I was doubting between doing that with only the first set
(`tBodyAcc*`) and with all of them. I chose all of them for sake of completeness.