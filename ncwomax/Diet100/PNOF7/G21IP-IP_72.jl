using DoNOF

mol = """
1 2
   C          0.00000000      0.00000000      0.69418988
   C          0.00000000      0.00000000     -0.69418988
   H         -0.90339310      0.23020355     -1.25663635
   H          0.90339310     -0.23020355     -1.25663635
   H          0.90339310      0.23020355      1.25663635
   H         -0.90339310     -0.23020355      1.25663635
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "G21IP-IP_72"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
