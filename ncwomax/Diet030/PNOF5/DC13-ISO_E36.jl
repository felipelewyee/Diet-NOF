using DoNOF

mol = """
0 1
C    -0.0564501    1.1653752    0.0000000 
N    -1.2512118    0.5932805    0.0000000 
C    -1.3031521   -0.7446908    0.0000000 
C    -0.1753362   -1.5497906    0.0000000 
C     1.0741749   -0.9260426    0.0000000 
C     1.1487241    0.4549272    0.0000000 
O    -0.0123522    2.5186681    0.0000000 
H    -2.2976817   -1.1782061    0.0000000 
H    -0.2688485   -2.6274937    0.0000000 
H     1.9826169   -1.5165303    0.0000000 
H     2.0909307    0.9854809    0.0000000 
H    -0.9314139    2.8250221    0.0000000 
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "DC13-ISO_E36"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

#DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
