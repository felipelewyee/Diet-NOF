using DoNOF

mol = """
0 1
   C         -4.04121230     -0.49929645      0.00305586
   H         -3.69617581     -1.54341138     -0.02931617
   H         -3.69730568     -0.00418228     -0.91727227
   H         -5.13931804     -0.51084108     -0.01535164
   C         -3.52625401      0.22020629      1.24982235
   H         -3.90253427      1.25365195      1.27734647
   H         -3.90264390     -0.27289449      2.15833300
   C         -1.98393373      0.24911350      1.30066003
   H         -1.58270539     -0.77756663      1.28999241
   H         -1.58259384      0.75192719      0.40567662
   C         -1.46553607      0.93225514      2.48242002
   N         -1.07611856      1.48085499      3.43093587
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "FH51-C3H7CN"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
