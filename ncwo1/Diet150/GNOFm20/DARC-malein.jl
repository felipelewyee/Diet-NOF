using DoNOF

mol = """
0 1
   C          1.12082648      0.00000000      0.62433053
   C          0.66343964      0.00000000     -0.78668547
   C         -0.66343964      0.00000000     -0.78668547
   C         -1.12082648      0.00000000      0.62433053
   O          0.00000000      0.00000000      1.42741381
   O          2.22312358      0.00000000      1.06365601
   O         -2.22312358      0.00000000      1.06365601
   H          1.35627156      0.00000000     -1.61500798
   H         -1.35627156      0.00000000     -1.61500798
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-malein"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
