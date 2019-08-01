
This is a slight adaptation of PSSMcreator originally written by Linda Tran.
It is a Graphical User Interface for some statistical operations for genetic data.

The changes include
+ putting the code into a package;
+ putting this on github for easy installation;
+ automatically installing the BiocManager and ROC packages as necessary;
+ put the blosum62 data into the data/ directory of the package and ensure
 it is loaded from the package and so not from a local file;
+ put the sample p115n560 positive and negative txt files in the package;
+ update the code to remove the `type = "l"` when creating the ROC plots;
+ reorganizing the code to avoid global variables and so allow multiple instances
 of the GUI to work simultaneously without overwriting each other's data;
+ remove the dependency on the GGIR package.
 
 
# Installation

The "simplest" way to install the package is to run R
and then issue the following commands
```
install.packages("devtools")
install_github("dsidavis/PSSMcreator")
```
You only need to do this once per machine.

Then you can load the package with 
```
library(PSSM)
```
and run the GUI with
```
PSSM()
```

If the ROC package has not already been installed, this will first
install the ROC package using the BiocManager package which will also 
be installed if necessary. 
