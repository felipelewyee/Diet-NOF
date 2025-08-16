using DoNOF

mol = """
0 1
   O         -2.53820248     -0.08771520     -1.02724234
   P         -1.35941727     -0.07970400      0.02969318
   O         -1.27738380     -1.25285556      0.93417310
   O          0.00000000      0.00000000     -0.87883739
   P          1.35941727      0.07970400      0.02969318
   O          1.27738380      1.25285556      0.93417310
   O          1.49416219     -1.36283276      0.64970831
   O          2.53820248      0.08771520     -1.02724234
   O         -1.49416219      1.36283276      0.64970831
   H         -2.91545388     -0.97873665     -1.12334103
   H          0.59640375     -1.64077375      0.97642748
   H          2.91545388      0.97873665     -1.12334103
   H         -0.59640375      1.64077375      0.97642748
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-H4P2O7_1"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
