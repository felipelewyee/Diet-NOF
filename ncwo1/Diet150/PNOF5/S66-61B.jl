using DoNOF

mol = """
0 1
C         -0.481184901779   -0.327553527141   -0.038355102891
O         -0.903798841598   -1.442733774255   -0.235501682281
O         -1.294877259706    0.731411990675    0.194234376812
H         -2.195639368397    0.377031452763    0.153698637035
C          0.959082161099    0.082112553505   -0.021149720119
H          1.584905226444   -0.788068391413   -0.179304878863
H          1.135119575350    0.816386187893   -0.804274300341
H          1.196393408480    0.551413507974    0.930652670807
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-61B"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
