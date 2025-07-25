using DoNOF

mol = """
0 1
   C         -1.88046287      0.00111379      0.32862906
   C         -0.56272152      0.00890691     -0.42565509
   N          0.56175803      0.02419386      0.34436055
   O         -0.51565481      0.00894847     -1.64564220
   H          0.47061187     -0.03031225      1.34431663
   C          1.89172539     -0.00184746     -0.24176108
   H         -2.46762978      0.86511826      0.01475945
   H         -1.76695224      0.02377747      1.41376562
   H         -2.43852215     -0.89339970      0.04804047
   H          1.93886925      0.69761231     -1.07585935
   H          2.14970098     -0.99537622     -0.61943137
   H          2.61927784      0.29126456      0.51447730
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E16"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
