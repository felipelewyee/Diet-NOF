using DoNOF

mol = """
1 1
N    -0.4244606    1.9040409    0.0000000 
N     1.5727761    0.7484809    0.0000000 
C    -0.4729203   -0.4729499    0.0000000 
C     0.9339066   -0.4234257    0.0000000 
C    -1.0934336    0.7430950    0.0000000 
C     0.9593943    2.0078396    0.0000000 
C    -1.2104410   -1.7776776    0.0000000 
O     1.7131935   -1.4567240    0.0000000 
O     1.5638761    3.0280132    0.0000000 
H    -0.9283216    2.7839341    0.0000000 
H     2.5909886    0.7587326    0.0000000 
H    -2.1742321    0.8202918    0.0000000 
H    -0.9942529   -2.3753386   -0.8887400 
H    -0.9942529   -2.3753386    0.8887400 
H    -2.2864804   -1.6106914    0.0000000 
H     1.2446601   -2.3022822    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "PArel-T1"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
