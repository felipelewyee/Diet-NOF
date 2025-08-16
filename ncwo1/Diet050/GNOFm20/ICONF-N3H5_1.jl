using DoNOF

mol = """
0 1
   N         -0.77907197      0.10994832      0.00000000
   N         -0.03149962      0.01698457      1.22272462
   N         -0.03149962      0.01698457     -1.22272462
   H          0.73807619     -0.65953384     -1.13084901
   H          0.38903766      0.93051636     -1.38896889
   H          0.73807619     -0.65953384      1.13084901
   H          0.38903766      0.93051636      1.38896889
   H         -1.41215648     -0.68588250      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-N3H5_1"

p.ipnof = 8
p.ista = 1
p.h_cut = 0.02 * sqrt(2)

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
