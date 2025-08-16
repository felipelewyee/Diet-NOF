using DoNOF

mol = """
0 3
   C          0.00087040     -0.50561060      0.00000000
   H         -1.05537693     -0.74805845      0.00000000
   H          0.52074787     -0.77071253      0.91244975
   H          0.52074787     -0.77071253     -0.91244975
   H          0.01214038      0.79677557      0.00000000
   O          0.00087040      1.99831855      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT11"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
