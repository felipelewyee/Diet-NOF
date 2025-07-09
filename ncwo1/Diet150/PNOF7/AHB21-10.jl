using DoNOF

mol = """
-1 1
  O      1.23583426     -0.09177426     -0.06793615
  H      1.54755831      0.57192835      0.55691305
  O     -1.23110973      0.09790429     -0.05372440
  H     -0.11773792      0.03366878     -0.06528348
  H     -1.46896962     -0.65591986      0.49310314
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "AHB21-10"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
