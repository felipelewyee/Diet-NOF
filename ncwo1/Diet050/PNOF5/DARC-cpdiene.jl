using DoNOF

mol = """
0 1
   C          0.00000000     -1.17162727      0.19064138
   C          0.00000000     -0.72992754     -1.07677700
   C          0.00000000      0.72992754     -1.07677700
   C          0.00000000      1.17162727      0.19064138
   C          0.00000000      0.00000000      1.11578996
   H          0.00000000     -2.20239405      0.51728693
   H          0.00000000     -1.34551457     -1.96712174
   H          0.00000000      1.34551457     -1.96712174
   H          0.00000000      2.20239405      0.51728693
   H         -0.87580408      0.00000000      1.77807545
   H          0.87580408      0.00000000      1.77807545
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DARC-cpdiene"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
