using DoNOF

mol = """
0 1
   Sb         0.07940814     -1.16740071      0.00000000
   H          0.92542714     -1.96223271      1.21137400
   H          0.92542714     -1.96223271     -1.21137400
   H         -1.13926886     -2.32204371      0.00000000
   O          0.07940814      2.66198329      0.00000000
   H         -0.06916886      1.71249229      0.00000000
   H         -0.80123286      3.03943429      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-sbh3_h2o"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
