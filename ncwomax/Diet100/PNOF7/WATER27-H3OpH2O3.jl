using DoNOF

mol = """
1 1
O     0.4488552    2.4506609   -0.1128380 
H     0.5365645    3.1082364    0.5858367 
H     0.9587367    2.7678608   -0.8657250 
O    -2.3467622   -0.8366105   -0.1128380 
H    -2.8764061   -0.5536400   -0.8657250 
H    -2.9600939   -1.0894397    0.5858367 
O     1.8979070   -1.6140505   -0.1128380 
H     2.4235294   -2.0187966    0.5858367 
H     1.9176694   -2.2142207   -0.8657250 
O     0.0000000    0.0000000    0.4980372 
H     0.7206738   -0.6586452    0.2267139 
H     0.2100666    0.9534444    0.2267139 
H    -0.9307403   -0.2947992    0.2267139 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WATER27-H3OpH2O3"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
