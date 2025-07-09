using DoNOF

mol = """
0 1
   Bi        -0.60393614     -1.67154157      0.00000000
   H          0.09993086     -2.70668557      1.24292700
   H          0.09993086     -2.70668557     -1.24292700
   H          0.86298586     -0.69101057      0.00000000
   H         -0.58058714      3.50884843      0.00000000
   S         -0.60393614      2.17582243      0.00000000
   H          0.72561186      2.09125243      0.00000000
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "HEAVY28-bih3_h2s"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
