installROC =
function()
{
  message("Installing BiocManager and ROC needed for PSSMCreator")
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install()
  BiocManager::install("ROC")
}
