using DoNOF

mol = """
0 1
   H         -1.78935891      0.87878322      0.00009791
   C         -1.12663167      0.00011091     -0.00000309
   C         -0.19168134      0.00002491     -1.18134951
   C          1.08468111     -0.00033309     -0.73469235
   C          1.08467711      0.00036691      0.73469617
   C         -0.19168634     -0.00040809      1.18134833
   H         -1.78983991     -0.87817540     -0.00010709
   H         -0.51850346     -0.00063709      2.21454170
   H         -0.51849346      0.00008591     -2.21454488
   H          1.97842443     -0.00042809     -1.34934557
   H          1.97841243      0.00060991      1.34935839
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHPERI-1,3-Cyclopentadiene"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
