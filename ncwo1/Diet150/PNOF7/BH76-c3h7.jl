using DoNOF

mol = """
0 2
   C          1.12258660     -0.26247610      0.00005122
   C         -0.15121236      0.60084431     -0.00006278
   C         -1.40064165     -0.21480516     -0.00001678
   H          1.15551730     -0.90368070      0.88122780
   H          1.15554376     -0.90387120     -0.88098535
   H          2.01601772      0.36344057     -0.00000578
   H         -0.13407119      1.25156298     -0.87709590
   H         -0.13412517      1.25174820      0.87683034
   H         -1.81499801     -0.59105865      0.92442983
   H         -1.81461701     -0.59170425     -0.92437260
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-c3h7"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
