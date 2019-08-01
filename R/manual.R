pssm =
    # This is the start of doing the computations independently of the GUI.
    # This is better for testing and ensuring correctness whenever the code is
    # changed.
    # And it is easier to use than the GUI.
function(posf, negf)
{
    pos = readPosFile(posf)
    neg = readNegFile(negf)

    PSSM = PSSMtable(pos[[2]], neg[[2]])
    showPSSM(PSSM, pos[[1]], neg[[1]])
    pscores = score(pos$whole, PSSM = PSSM)
    nscores = score(neg$whole, PSSM = PSSM)

    jpscores = jackknife(pos$whole, pos$values, neg$values)
    jnscores = jackknife.neg(neg$whole, pos$values, neg$values)


    unjacked <- ROC::rocdemo.sca(c(rep(1, length(pscores)), rep(0, length(nscores))), c(pscores, nscores), ROC::dxrule.sca, caseLabel = "Sulfation", markerLabel = "Unjackknifed Scores")

    jacked <- ROC::rocdemo.sca(c(rep(1, length(jpscores)), rep(0, length(jnscores))), c(jpscores, jnscores), ROC::dxrule.sca, caseLabel = "Sulfation", markerLabel = "Jackknifed Scores")

    list(PSSM = PSSM, pscores = pscores, nscores = nscores,
         jpscores = jpscores, jnscores = jnscores,
         unjacked = unjacked, jacked = jacked)
}
