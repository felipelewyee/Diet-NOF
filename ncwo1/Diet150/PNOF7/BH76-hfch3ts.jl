using DoNOF

mol = """
0 2
   H          0.00037485      2.26246822      0.00000000
   F         -0.00011015      1.02398179      0.00000000
   C         -0.00011015     -0.64466754      0.00000000
   H          1.05368609     -0.88007204      0.00000000
   H         -0.52692032     -0.88085522      0.91235449
   H         -0.52692032     -0.88085522     -0.91235449
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-hfch3ts"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
