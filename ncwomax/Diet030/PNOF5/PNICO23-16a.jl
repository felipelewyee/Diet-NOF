using DoNOF

mol = """
0 1
N     0.0549810   -2.1255994    0.0000000 
H    -0.4862269   -2.9797602    0.0000000 
H     0.6555228   -2.1464824    0.8134308 
H     0.6555228   -2.1464824   -0.8134308 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-16a"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
