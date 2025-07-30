using DoNOF

mol = """
0 1
   C         -1.84269656     -0.11821556      0.00000000
   C         -0.60989395      0.39584742      0.00000000
   C          0.60989395     -0.39584742      0.00000000
   C          1.84269656      0.11821556      0.00000000
   H         -2.01011690     -1.19008798      0.00000000
   H         -2.72188018      0.51347962      0.00000000
   H         -0.48338197      1.47603489      0.00000000
   H          0.48338197     -1.47603489      0.00000000
   H          2.01011690      1.19008798      0.00000000
   H          2.72188018     -0.51347962      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISO34-E7"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
