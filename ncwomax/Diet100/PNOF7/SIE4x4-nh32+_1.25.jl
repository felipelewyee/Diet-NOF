using DoNOF

mol = """
1 2
   N          0.00000000      0.00000000     -1.35406924
   N          0.00000000      0.00000000      1.35406924
   H          0.84297303      0.48669071     -1.62974268
   H          0.00000000     -0.97338141     -1.62974268
   H         -0.84297303      0.48669071     -1.62974268
   H          0.84297303     -0.48669071      1.62974268
   H          0.00000000      0.97338141      1.62974268
   H         -0.84297303     -0.48669071      1.62974268
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "SIE4x4-nh32+_1.25"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
