using DoNOF

mol = """
0 1
   C         -1.88889666     -0.17969206      0.00000000
   C          1.88889666      0.17969206      0.00000000
   O         -1.17043543     -1.16659040      0.00000000
   O         -1.49328055      1.07368943      0.00000000
   O          1.49328055     -1.07368943      0.00000000
   O          1.17043543      1.16659040      0.00000000
   H         -0.49883317      1.10719538      0.00000000
   H         -2.97948901     -0.25882910      0.00000000
   H          2.97948901      0.25882910      0.00000000
   H          0.49883317     -1.10719538      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S22-03"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
