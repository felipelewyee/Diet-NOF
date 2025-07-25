using DoNOF

mol = """
0 2
   C         -1.37322424     -0.51843687     -0.00004566
   C         -0.39256408      0.63146105      0.00000234
   N          1.97763722     -0.41044820     -0.00008366
   H         -1.24171311     -1.14678617     -0.88052998
   H         -1.24168136     -1.14689201      0.88036024
   H         -2.40454837     -0.15645371     -0.00000166
   H         -0.40974647      1.24583584     -0.89724668
   H         -0.40972742      1.24575117      0.89730978
   H          0.77752672      0.07768024     -0.00006066
   H          2.35912110      0.08943644     -0.80483117
   H          2.35892001      0.08885223      0.80512711
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BH76-RKT20"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
