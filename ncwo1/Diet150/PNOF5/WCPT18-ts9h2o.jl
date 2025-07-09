using DoNOF

mol = """
0 1
C	0.4966180	0.9453210	0.2830690
H	0.9905760	1.5218220	1.0628080
C	-0.7032780	1.4327910	-0.2066700
H	-1.0045630	1.1716200	-1.2177630
H	-1.4663380	0.1338920	0.1290210
H	-1.0675590	2.3865800	0.1529860
H	-0.5795510	-1.1563030	-0.1636390
O	-1.6365420	-1.0048900	0.0232200
H	-1.8271180	-1.3904810	0.8895460
S	1.2054280	-0.5560430	-0.0935700
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "WCPT18-ts9h2o"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
