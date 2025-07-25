using DoNOF

mol = """
0 1
   C         -0.88787051     -0.88787051     -0.88787051
   C          0.00000000      0.00000000      0.00000000
   C          0.88787051      0.88787051     -0.88787051
   C         -0.88787051      0.88787051      0.88787051
   C          0.88787051     -0.88787051      0.88787051
   H         -1.53176783     -0.28230739     -1.53176783
   H         -0.28230739     -1.53176783     -1.53176783
   H         -1.53176783     -1.53176783     -0.28230739
   H          0.28230739      1.53176783     -1.53176783
   H          1.53176783      1.53176783     -0.28230739
   H          1.53176783      0.28230739     -1.53176783
   H         -1.53176783      1.53176783      0.28230739
   H         -1.53176783      0.28230739      1.53176783
   H         -0.28230739      1.53176783      1.53176783
   H          1.53176783     -1.53176783      0.28230739
   H          1.53176783     -0.28230739      1.53176783
   H          0.28230739     -1.53176783      1.53176783
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "RSE43-E45"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
