using DoNOF

mol = """
0 1
 C -1.269829 -0.3859 0.257633
 H -1.227609 -0.480555 1.343423
 O -2.660656 -0.361126 -0.065574
 C -0.567481 0.899205 -0.171284
 H -0.571867 0.966626 -1.264194
 H -1.167488 1.73355 0.196987
 C 0.869976 1.048819 0.336645
 H 0.897495 0.900334 1.421633
 H 1.199104 2.076789 0.16199
 H -2.731301 -0.411931 -1.022283
 H -0.781289 -1.260257 -0.17103
 C 1.891663 0.127746 -0.320297
 H 1.818212 0.206172 -1.405168
 H 2.902049 0.436634 -0.035511
 O 1.696485 -1.255712 -0.02914
 H 1.830092 -1.371882 0.915686
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BUT14DIOL-B44"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
