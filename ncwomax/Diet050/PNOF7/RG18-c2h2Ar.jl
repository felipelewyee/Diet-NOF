using DoNOF

mol = """
0 1
H    -1.6666499    0.0000000   -0.7937658 
C    -0.6032500    0.0000000   -0.7937658 
C     0.6032500    0.0000000   -0.7937658 
H     1.6666499    0.0000000   -0.7937658 
Ar    0.0000000    0.0000000    3.1750633 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h2Ar"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
