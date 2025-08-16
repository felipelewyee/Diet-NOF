using DoNOF

mol = """
0 1
   N     0.000000    0.000000    4.096650
   C     0.000000    0.000000    5.238933
   H     0.000000    0.000000    6.306340
   I     0.000000    0.000000    0.837908
   C     0.000000    0.000000   -1.257438
   C     0.000000    1.203512   -1.948538
   C     0.000000    1.198619   -3.335779
   C     0.000000    0.000000   -4.032362
   C     0.000000   -1.198619   -3.335779
   C     0.000000   -1.203512   -1.948538
   H     0.000000    2.141160   -1.408692
   H     0.000000    2.139452   -3.871441
   H     0.000000    0.000000   -5.114718
   H     0.000000   -2.139452   -3.871441
   H     0.000000   -2.141160   -1.408692
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HAL59-NCH_PhI"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.020 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
