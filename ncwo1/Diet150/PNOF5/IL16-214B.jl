using DoNOF

mol = """
-1 1
O          2.59639        0.51211        1.05973
Cl         1.95096        0.92671        2.34949
O          2.89233        0.83017        3.45533
O          1.40416        2.29118        2.20006
O          0.78307       -0.02337        2.59336
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "IL16-214B"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
