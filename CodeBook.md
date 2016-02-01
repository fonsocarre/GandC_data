# Data codebook

After executing the `main.R` script, the code yields two data sets:

1. `reducedData` is a reduced data set that groups test and train data, but
only includes mean and standard deviation measures, apart from individual and
activity identifiers
    + `individual:` each integer represents an individual. The numbers are the same 
        than in the original data.
    + `activity:` strings with the activity descriptor, as shown in 
        `data/activity_labels.txt`
    + All the rest: simplified names from the original data set. They have no
        periods or uppercase characters. Only variables with `mean` or `sd` in 
        their name are included in `reducedData`.

2. `summ` is a summary of the data in reducedData. Every variable apart from 
`individuals` and `activity` has a mean (`*_mean`) and standard deviation 
(`*_sd`) measure for every activity type of every individual.