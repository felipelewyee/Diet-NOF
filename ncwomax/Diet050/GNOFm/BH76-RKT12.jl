using DoNOF

mol = """
0 2
   P          0.82622984      0.00033303     -0.42274658
   H          0.85541132      1.03491355      0.54066823
   H          0.87146232     -1.02481363      0.55012462
   H         -0.65761545     -0.01070698     -0.46212372
   H         -1.89548803      0.00027403     -0.20592255
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT12"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
