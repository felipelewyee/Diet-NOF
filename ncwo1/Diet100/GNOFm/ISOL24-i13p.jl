using DoNOF

mol = """
0 1
   C         -4.12621764     -0.75299509      0.22995903
   C         -4.34216308      0.30068444     -0.66648735
   C         -3.26163184      1.10944297     -1.03590746
   C         -1.98113142      0.87703824     -0.52890422
   C         -1.76793146     -0.18223429      0.37047556
   C         -2.85438560     -0.99390861      0.74960606
   N         -0.48840730     -0.49237168      0.85790516
   N          0.48840730      0.49237168      0.85790516
   C          1.76793146      0.18223429      0.37047556
   C          2.85438560      0.99390861      0.74960606
   C          4.12621764      0.75299509      0.22995903
   C          4.34216308     -0.30068444     -0.66648735
   C          3.26163184     -1.10944297     -1.03590746
   C          1.98113142     -0.87703824     -0.52890422
   H         -0.46915339     -1.11917602      1.65844144
   H          0.46915339      1.11917602      1.65844144
   H         -4.95482997     -1.39035415      0.53363855
   H         -5.33569008      0.48917985     -1.06661054
   H         -3.41234218      1.93274695     -1.73214767
   H         -1.14154223      1.50162216     -0.81976788
   H         -2.69408964     -1.81388582      1.44979932
   H          2.69408964      1.81388582      1.44979932
   H          4.95482997      1.39035415      0.53363855
   H          5.33569008     -0.48917985     -1.06661054
   H          3.41234218     -1.93274695     -1.73214767
   H          1.14154223     -1.50162216     -0.81976788
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ISOL24-i13p"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
