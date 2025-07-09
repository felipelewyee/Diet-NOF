using DoNOF

mol = """
0 1
  N   -0.11115880832978     -0.02551613494687     -0.01730510413245
  O   -0.58895878482719      0.46555591931502      1.24339838521922
  H   0.90087984737186     -0.04906254294276      0.02793548072260
  H   -0.33038589374312      0.73021745058808     -0.65400731806521
  H   0.15696863952822      0.47750630798653      1.84464755625584
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "BHROT27-nh2oh_ecl"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
