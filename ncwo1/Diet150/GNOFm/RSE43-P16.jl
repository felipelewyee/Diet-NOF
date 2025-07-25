using DoNOF

mol = """
0 2
   C         -2.00696075      0.00228084      0.40532190
   C         -0.77127125      0.01444883     -0.36065580
   N          0.38850087      0.03819041      0.37515180
   O         -0.75932423      0.01467719     -1.59140215
   H          0.33536541     -0.04827607      1.37604481
   C          1.69079541     -0.00167655     -0.26293147
   H         -2.02519580      0.00409299      1.48819276
   H         -2.93897124     -0.00831976     -0.13973351
   H          1.70685302      0.69066118     -1.10436168
   H          1.92918689     -0.99934151     -0.64541176
   H          2.45102168      0.29326245      0.45978509
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-P16"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
