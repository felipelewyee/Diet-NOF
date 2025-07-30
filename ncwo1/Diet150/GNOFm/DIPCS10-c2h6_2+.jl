using DoNOF

mol = """
2 1
   C          0.13122756     -0.66178531      0.00000000
   C         -0.13122756      0.66178531      0.00000000
   H         -0.80707569     -1.32582694      0.49166647
   H         -0.80707569     -1.32582694     -0.49166647
   H          1.08170581     -1.20629748      0.00000000
   H          0.80707569      1.32582694     -0.49166647
   H         -1.08170581      1.20629748      0.00000000
   H          0.80707569      1.32582694      0.49166647
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-c2h6_2+"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
