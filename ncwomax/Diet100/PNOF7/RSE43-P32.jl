using DoNOF

mol = """
0 2
   C         -0.42634001      0.07513323      0.00000000
   O          0.94011401      0.18715717      0.00000000
   H          1.36671027     -0.67877659      0.00000000
   H         -0.94024214      0.20824309     -0.94555412
   H         -0.94024214      0.20824309      0.94555412
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P32"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
