using DoNOF

mol = """
0 1
   C         -0.34178645      0.12129333      0.00000000
   O          1.07982848      0.19878837      0.00000000
   H          1.43664414     -0.69532477      0.00000000
   H         -0.71318586      1.14551854      0.00000000
   H         -0.73075016     -0.38513774     -0.89146642
   H         -0.73075016     -0.38513774      0.89146642
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E32"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
