using DoNOF

mol = """
0 1
   C         -4.92154244     -0.93536885      0.03408146
   H         -4.51206184     -1.95244972     -0.06280535
   H         -4.69547547     -0.39718288     -0.89893267
   H         -6.01429549     -1.02344448      0.10937925
   C         -4.33629439     -0.20928041      1.24713451
   H         -4.77036027      0.79878891      1.33917555
   H         -4.61260349     -0.74994701      2.16958456
   C         -2.81461750     -0.07731307      1.18722911
   H         -2.53609747      0.48334786      0.27949111
   H         -2.37056717     -1.08992051      1.07981017
   N         -2.30897596      0.67367641      2.34643880
   H         -2.49569412      0.15107573      3.20594287
   H         -1.29382741      0.77576568      2.28815036
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7NH2"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
