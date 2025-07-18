using DoNOF

mol = """
1 2
   O         -2.41571871     -0.15562939      0.00000000
   C         -1.11908584     -0.06592757      0.00000000
   C         -0.43651559      1.18418930      0.00000000
   C          0.92433068      1.18337433      0.00000000
   C          1.63241284     -0.04261171      0.00000000
   C          0.95537635     -1.27862639      0.00000000
   C         -0.40660611     -1.30369805      0.00000000
   H         -2.86175237      0.70642900      0.00000000
   H         -1.00479195      2.10838488      0.00000000
   H          1.47294075      2.11703564      0.00000000
   H          2.71617992     -0.02717077      0.00000000
   H          1.52118247     -2.20170103      0.00000000
   H         -0.97795244     -2.22404824      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RC21-9e"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
