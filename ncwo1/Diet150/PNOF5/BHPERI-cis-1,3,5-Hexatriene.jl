using DoNOF

mol = """
0 1
   C         -0.29185967     -2.89452203      0.00000000
   H          0.66835967     -3.40596421      0.00000000
   H         -1.17802099     -3.52183225      0.00000000
   C         -0.37379871     -1.55391455      0.00000000
   H         -1.35953406     -1.09227639      0.00000000
   C          0.78456671     -0.67768724      0.00000000
   H          1.75028705     -1.18240342      0.00000000
   C          0.78456671      0.67768724      0.00000000
   H          1.75028705      1.18240342      0.00000000
   C         -0.37379870      1.55391455      0.00000000
   H         -1.35953406      1.09227639      0.00000000
   C         -0.29185967      2.89452203      0.00000000
   H          0.66835967      3.40596421      0.00000000
   H         -1.17802099      3.52183225      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-cis-1,3,5-Hexatriene"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
