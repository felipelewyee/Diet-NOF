using DoNOF

mol = """
2 1
   S          0.00000000      0.00000000     -0.64783784
   H          1.05659680      0.00000000      0.32391892
   H         -1.05659680      0.00000000      0.32391892
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DIPCS10-h2s_2+"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
