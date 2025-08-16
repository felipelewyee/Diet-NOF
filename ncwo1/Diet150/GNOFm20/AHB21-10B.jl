using DoNOF

mol = """
0 1
  O     -1.23110973      0.09790429     -0.05372440
  H     -0.11773792      0.03366878     -0.06528348
  H     -1.46896962     -0.65591986      0.49310314
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-10B"

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
