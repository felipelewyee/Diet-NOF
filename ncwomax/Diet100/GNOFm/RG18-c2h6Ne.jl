using DoNOF

mol = """
0 1
C     0.7632579    0.0000000   -0.3998228 
C    -0.7632579    0.0000000   -0.3998228 
H     1.1578429    1.0169279   -0.3997675 
H     1.1578429   -0.5085118    0.4808355 
H     1.1578429   -0.5084161   -1.2805363 
H    -1.1578429   -1.0169279   -0.3997675 
H    -1.1578429    0.5085118    0.4808355 
H    -1.1578429    0.5084161   -1.2805363 
Ne    0.0000000   -0.0000000    3.1985822 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h6Ne"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
