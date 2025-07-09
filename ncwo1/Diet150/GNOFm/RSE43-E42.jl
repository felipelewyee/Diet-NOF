using DoNOF

mol = """
0 1
   N          0.27661183      0.27245741      1.55708323
   C         -0.52042450     -0.06911223      0.39075215
   C          0.30387741      0.06882606     -0.86832804
   O          1.50707047      0.04325543     -0.91631557
   O         -0.47649905      0.17995858     -1.96848960
   H          1.22036743     -0.08392456      1.45617153
   H         -0.12822543     -0.10525741      2.40378322
   H          0.11282350      0.20987575     -2.73894433
   H         -0.90531325     -1.10287502      0.37415572
   H         -1.39028840      0.58679598      0.31013168
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E42"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
