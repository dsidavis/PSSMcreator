pssm = 
function(posf, negf)
{
    pos = readPosFile(posf)
    neg = readNegFile(negf)

    PSSM = PSSMtable(pos[[2]], negative[[2]])
    showPSSM(PSSM, pos[[1]], neg[[1]])
    pscores = score(pos$whole, PSSM = PSSM)
    nscores = score(neg$whole, PSSM = PSSM)

    jpscores = jackknife(pos$whole, pos$values, neg$values)
    jnscores = jackknife.neg(neg$whole, pos$values, neg$values)


    unjacked <<- rocdemo.sca(c(rep(1, length(pscores)), rep(0, length(nscores))), c(pscores, nscores), dxrule.sca, caseLabel = "Sulfation", markerLabel = "Unjackknifed Scores")
}
