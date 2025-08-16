using DoNOF

mol = """
1 1
C     0.0000000   -0.7086540    0.0996485 
C     0.0000000    0.7086540    0.0996485 
Cl   -1.4459067   -1.5704256    0.2108608 
Cl    1.4459067   -1.5704256    0.2108608 
Cl   -1.4459067    1.5704256    0.2108608 
Cl    1.4459067    1.5704256    0.2108608 
H     0.0000000    0.0000000   -1.0427402 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-c2cl43"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
