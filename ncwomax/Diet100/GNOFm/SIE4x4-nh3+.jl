using DoNOF

mol = """
1 2
   N          0.00000000      0.00000000      0.00000000
   H          0.50940010     -0.88230686      0.00000000
   H          0.50940010      0.88230686      0.00000000
   H         -1.01880021      0.00000000      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-nh3+"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
