using DoNOF

mol = """
0 1
N         -0.156806479510    0.581673166353   -0.696458377117
H          0.543779494645    0.328711362674   -1.385170676986
H         -1.048350393030    0.294215510191   -1.077986085180
C          0.107387389561   -0.166988987343    0.531235607954
H         -0.644247722134    0.081570880212    1.278403276781
H          0.124878228533   -1.254991772613    0.417290135918
H          1.073359481934    0.135809840526    0.932686118683
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "S66-11A"

p.ipnof = 8

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
