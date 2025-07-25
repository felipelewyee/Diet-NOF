using DoNOF

mol = """
0 1
 C 1.875584 0.130736 -0.32056
 H 2.887453 0.457043 -0.062802
 O 1.653218 -1.200371 0.149911
 C 0.864089 1.055568 0.334537
 H 0.908299 0.900587 1.415373
 H 1.190796 2.081398 0.148883
 C -0.575347 0.908472 -0.164542
 H -0.605995 1.026631 -1.2504
 H -1.180538 1.714275 0.255569
 H 2.296367 -1.773225 -0.27545
 H 1.770789 0.178953 -1.40993
 C -1.249973 -0.401478 0.206657
 H -0.77921 -1.238776 -0.307475
 H -1.152855 -0.573277 1.2837
 O -2.625204 -0.275695 -0.165482
 H -3.045336 -1.124863 -0.009459
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B40"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
