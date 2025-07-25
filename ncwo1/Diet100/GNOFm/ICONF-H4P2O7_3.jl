using DoNOF

mol = """
0 1
   O         -1.32405101      0.96468670      0.88212237
   P         -1.55403603     -0.15340022     -0.27983881
   O         -2.69238420      0.07911544     -1.16403264
   O         -0.08728201      0.00667959     -0.98546916
   P          1.28122647     -0.22022769     -0.14435231
   O          1.16222968     -1.35332236      0.79483311
   O          2.40489281     -0.41354468     -1.23510036
   O          1.61457791      1.21802300      0.45657383
   O         -1.50367569     -1.56347668      0.42587351
   H         -2.16110179      1.23977049      1.29161539
   H          2.57955161      0.37780562     -1.77306138
   H          0.85844259      1.56329860      0.97096654
   H         -0.57839033     -1.74540781      0.75986991
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "ICONF-H4P2O7_3"

p.ipnof = 8
p.ista = 1

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
