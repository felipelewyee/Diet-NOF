using DoNOF

mol = """
0 1
   C         -1.96212545     -1.30462258     -1.20527270
   C         -1.34568629     -1.85822257     -0.08099810
   C         -1.52866212     -1.22043594      1.14546722
   C         -2.31252819     -0.06814660      1.19274532
   C         -2.89285561      0.41913471      0.01139322
   N         -2.71534255     -0.19654912     -1.17518331
   H         -1.06630235     -1.61204303      2.05295720
   H         -1.84499962     -1.77389272     -2.18697069
   H         -0.74076128     -2.76081694     -0.16910225
   H         -2.47385287      0.45616957      2.13622030
   C         -3.75580396      1.65306398      0.00357943
   H         -3.68023450      2.20987166      0.94633478
   H         -3.46955638      2.30992792     -0.82883975
   H         -4.81096342      1.37981852     -0.15211369
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-methylpyridine"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
