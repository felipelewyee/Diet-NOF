using DoNOF

mol = """
0 1
   N          0.00000000      0.00000000      1.14271621
   C         -1.12415740      0.00000000      0.35290193
   C          1.12415740      0.00000000      0.35290193
   C         -0.71189725      0.00000000     -0.96006654
   C          0.71189725      0.00000000     -0.96006654
   H          0.00000000      0.00000000      2.14833657
   H         -2.11145475      0.00000000      0.78525808
   H          2.11145475      0.00000000      0.78525808
   H         -1.35853848      0.00000000     -1.82361985
   H          1.35853848      0.00000000     -1.82361985
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-05r"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
