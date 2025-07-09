using DoNOF

mol = """
0 1
   C         -0.62421620      0.28593985      0.00000000
   H         -0.68092146      1.36354307      0.00000000
   H         -1.48969207     -0.35847391      0.00000000
   N          0.55573802     -0.26924615      0.00000000
   H          0.55369001     -1.30176739      0.00000000
   O          1.68540169      0.28000452      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-13r_7"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
