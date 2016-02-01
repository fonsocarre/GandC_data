# Data codebook

After executing the `main.R` script, the code yields two data sets:

1. `reducedData`
    + `individual:` each integer represents an individual. The numbers are the same 
        than in the original data.
    + `activity:` strings with the activity descriptor, as shown in 
        `data/activity_labels.txt`
    + All the rest: simplified names from the original data set. They have no
        periods or uppercase characters. Only variables with `mean` or `sd` in 
        their name are included in `reducedData`.

2. `summ`