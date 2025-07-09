using DoNOF

mol = """
0 1
 C 1.578385 0.14769 0.343809
 H 1.39475 0.012968 1.413545
 O 1.359929 -1.086203 -0.359782
 C 0.653845 1.215099 -0.221322
 H 1.057827 2.180283 0.093924
 H 0.729693 1.184864 -1.311438
 C -0.817334 1.152127 0.208156
 H -1.303525 2.065738 -0.145828
 H -0.883765 1.159762 1.29926
 H 1.98412 -1.734446 -0.021385
 H 2.616286 0.458948 0.206544
 C -1.627725 -0.034052 -0.311301
 H -2.684229 0.151015 -0.118566
 H -1.501868 -0.118146 -1.397506
 O -1.324262 -1.260154 0.333377
 H -0.417651 -1.475314 0.076637
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B1"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
