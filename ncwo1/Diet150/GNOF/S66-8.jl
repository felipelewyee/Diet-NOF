using DoNOF

mol = """
0 1
O    -0.92208    0.66104   -0.00451
H     0.04219    0.62856   -0.00416
C    -1.38350   -0.67442    0.00376
H    -2.46979   -0.64303    0.00290
H    -1.06148   -1.23390   -0.87777
H    -1.06254   -1.22260    0.89275
O     1.99337    0.56453   -0.00206
H     2.43257    0.95268   -0.76194
H     2.43125    0.96713    0.75103
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-8"

p.ipnof = 8

p.RI = true
p.gpu = false

p.maxloop = 10

DoNOF.set_ncwo(p,1)

#C = DoNOF.read_C(title=p.title)
#n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
