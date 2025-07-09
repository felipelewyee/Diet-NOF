using DoNOF

mol = """
1 1
 Na     -0.62134778     -0.83649140     -0.10392252
  O      0.72608003      0.97874806      0.12101240
  H      1.68902363      0.99417362      0.17325772
  H      0.47192348      1.90746586      0.17792570
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "CHB6-23"

p.ipnof = 7

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
