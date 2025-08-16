using DoNOF

mol = """
0 1
C    -0.0000000    0.0000000    0.7632579 
C    -0.0000000   -0.0000000   -0.7632579 
H    -0.8806855    0.5084640    1.1578428 
H     0.0000000   -1.0169281    1.1578428 
H     0.8806855    0.5084640    1.1578428 
H     0.8806855   -0.5084640   -1.1578428 
H    -0.8806855   -0.5084640   -1.1578428 
H     0.0000000    1.0169281   -1.1578428 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RG18-c2h6"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
