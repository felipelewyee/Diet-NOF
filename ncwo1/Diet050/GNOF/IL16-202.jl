using DoNOF

mol = """
0 1
C          1.39869        0.00460       -0.35986
N         -0.04092       -0.16968        0.01657
C         -0.94691        0.94573       -0.45919
C         -1.09281        1.05636       -1.97615
C         -0.54728       -1.54568       -0.29192
H         -0.06025       -0.10490        1.04300
H         -0.45644       -1.76195       -1.36093
H          0.04287       -2.25341        0.29679
H          1.70632        1.01947       -0.09298
H          1.98295       -0.70513        0.23272
H         -0.53420        1.86170       -0.02018
H         -1.91068        0.76604        0.03222
H          1.54446       -0.17403       -1.42987
H         -1.59123       -1.61045        0.02723
H         -1.76588        1.89143       -2.20731
H         -0.13490        1.25942       -2.46970
H         -1.52780        0.15120       -2.41652
Cl        -0.06296       -0.03803        2.86058
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-202"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
