using DoNOF

mol = """
0 1
P     0.0549810    1.1994907    0.0000000 
H    -0.3857959    2.5499033    0.0000000 
H    -0.8242968    0.8048268    1.0357427 
H    -0.8242968    0.8048268   -1.0357427 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PNICO23-16b"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
