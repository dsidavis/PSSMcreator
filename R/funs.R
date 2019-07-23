readPosFile =
function(pos.location)
{
    positive.whole = readLines(pos.location)
    positive.whole = positive.whole[positive.whole != ""]
    # Does this make any sense ?  Should be nchar()
    positive.whole = positive.whole[  sapply(positive.whole, length) > 0 ]
    positive = as.data.frame(matrix(unlist(strsplit(positive.whole, split = "")),
                              nrow = length(positive.whole), ncol = 11, byrow = TRUE))

    colnames(positive) = -5:5
    positive[positive == "."] = NA
    list(whole = positive.whole, values = positive)
}

readNegFile =
function(filename)
{
    readPosFile(filename)
}



showPSSM =
function(PSSM, positive.whole, negative.whole, labels = aa.all)
{
    PSSM.values = as.vector(t(round(PSSM, 3)), mode = "character")
    PSSM.display1 = c(paste(-5:5, collapse = "\t"),
                      sapply(0:19, function(i)
                                      paste(PSSM.values[(i*11+1):((i+1)*11)], collapse = "\t")))
    temp = c("  ", labels)
    PSSM.display2 = sapply(1:21, function(i) paste(temp[i], PSSM.display1[i], sep = "\t"))
    PSSM.display3 = sapply(1:21, function(i) paste(PSSM.display2[i], temp[i], sep = "\t"))
    msg.temp = paste(PSSM.display3, collapse = "\n")
    msg = paste("p", length(positive.whole),
                "n", length(negative.whole),
                " PSSM that was created:\n", msg.temp, "\n", sep = "")
}
