using DoNOF

mol = """
0 2
   C         -1.06377673     -0.00001371     -0.08261355
   N          1.51022607     -0.00001271     -0.23168680
   H         -1.38701407      0.90853142     -0.57964889
   H         -1.26670033     -0.00458071      0.98239979
   H         -1.38777609     -0.90389008     -0.58760454
   H          0.24008018     -0.00007171     -0.24659637
   H          1.67743021      0.80556940      0.37284687
   H          1.67753075     -0.80553190      0.37290349
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT21"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
