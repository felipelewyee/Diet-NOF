using DoNOF

mol = """
0 1
 C 0.419805 1.910469 0.399249
 H 1.056541 1.910924 1.290856
 O 1.198991 2.096355 -0.7785
 C -0.419805 0.638354 0.362827
 H -1.080821 0.637279 1.235747
 H -1.048622 0.677201 -0.529555
 C 0.419805 -0.638354 0.362827
 H 1.080821 -0.637279 1.235747
 H 1.048622 -0.677201 -0.529555
 H 1.867867 1.407601 -0.798033
 H -0.228702 2.783073 0.456529
 C -0.419805 -1.910469 0.399249
 H 0.228702 -2.783073 0.456529
 H -1.056541 -1.910924 1.290856
 O -1.198991 -2.096355 -0.7785
 H -1.867867 -1.407601 -0.798033
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B29"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
