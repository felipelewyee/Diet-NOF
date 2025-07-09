using DoNOF

mol = """
0 1
   N         -1.04378426     -0.09487228      0.00000000
   H         -0.65570104     -1.04047940      0.00000000
   H         -0.65567745      0.37796757      0.81892116
   H         -0.65567745      0.37796757     -0.81892116
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-NH3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
