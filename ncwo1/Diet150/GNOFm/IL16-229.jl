using DoNOF

mol = """
0 1
C          1.07776        1.08690        1.96349
C          0.13839       -0.02710        1.50913
N          0.05607       -0.03575       -0.00617
H          1.01448       -0.03619       -0.38615
H         -0.42692       -0.87277       -0.36520
H         -0.42357        0.79410       -0.38662
H         -0.87527        0.09069        1.91101
H          0.52929       -1.01124        1.78217
H          1.13486        1.08204        3.05884
H          2.08532        0.93493        1.55682
H          0.71662        2.07853        1.65256
O          3.97298       -2.02259        0.29357
Cl         2.85192       -1.84894       -0.60735
O          3.11691       -2.40491       -1.93070
O          1.60869       -2.45077       -0.04085
O          2.57594       -0.33642       -0.77092
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-229"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
