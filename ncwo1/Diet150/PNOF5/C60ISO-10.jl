using DoNOF

mol = """
0 1
   C         -4.30669562      0.20509682     -1.05813868
   C         -3.58826397      0.88191447     -2.02325675
   C         -2.97451362      2.07045626     -1.39057620
   C         -4.22068662      1.00002628      0.19132091
   C         -3.24302104      2.06297336      0.00317030
   C         -4.06345241      0.10553951      1.22878649
   C         -3.97151240     -1.17846359     -0.73545496
   C         -3.91582850     -1.27113230      0.68196645
   C         -2.93458142     -1.80670584     -1.45828581
   C         -2.56244849      0.24259432     -2.79961311
   C         -2.29031797     -1.12485188     -2.57203769
   C         -1.67909113      2.21669067     -1.88804934
   C         -1.43543021      1.15934129     -2.86767092
   C         -0.61978085      2.62771390     -1.01384108
   C         -2.14564406      2.22928777      0.93415467
   C         -0.82670846      2.62133740      0.42348683
   C         -3.09404693      0.31307082      2.23832967
   C         -2.20322777      1.44874131      2.17436306
   C         -2.84175451     -1.86791194      1.37066790
   C         -2.51650029     -0.99864018      2.49480869
   C         -1.87333534     -2.50638289     -0.74833666
   C         -1.73944693     -2.49709219      0.66483755
   C         -0.92434347     -1.57384252     -2.65672540
   C         -0.67936645     -2.45831489     -1.55166542
   C         -0.12685451      0.72291245     -3.11384573
   C          0.12685451     -0.72291245     -3.11384573
   C          0.67936645      2.45831489     -1.55166542
   C          0.92434347      1.57384252     -2.65672540
   C          1.87333534      2.50638289     -0.74833666
   C          0.38088603      2.50862289      1.26444630
   C          1.73944693      2.49709219      0.66483755
   C         -1.02254078      1.33994580      2.95095222
   C          0.22432742      1.94286165      2.55243329
   C         -1.29826900     -1.10733288      3.11011063
   C         -0.70327615      0.08929541      3.59366287
   C         -0.38088603     -2.50862289      1.26444630
   C         -0.22432742     -1.94286165      2.55243329
   C          0.61978085     -2.62771390     -1.01384108
   C          0.82670846     -2.62133740      0.42348683
   C          1.43543021     -1.15934129     -2.86767092
   C          1.67909113     -2.21669067     -1.88804934
   C          2.29031797      1.12485188     -2.57203769
   C          2.93458142      1.80670584     -1.45828581
   C          2.56244849     -0.24259432     -2.79961311
   C          3.97151240      1.17846359     -0.73545496
   C          2.84175451      1.86791194      1.37066790
   C          3.91582850      1.27113230      0.68196645
   C          1.29826900      1.10733288      3.11011063
   C          0.70327615     -0.08929541      3.59366287
   C          1.02254078     -1.33994580      2.95095222
   C          2.51650029      0.99864018      2.49480869
   C          2.14564406     -2.22928777      0.93415467
   C          4.06345241     -0.10553951      1.22878649
   C          2.20322777     -1.44874131      2.17436306
   C          3.09404693     -0.31307082      2.23832967
   C          2.97451362     -2.07045626     -1.39057620
   C          3.58826397     -0.88191447     -2.02325675
   C          4.30669562     -0.20509682     -1.05813868
   C          3.24302104     -2.06297336      0.00317030
   C          4.22068662     -1.00002628      0.19132091
"""

bset,p = DoNOF.molecule(mol,"def2-qzvp",spherical=true)

p.title = "C60ISO-10"

p.ipnof = 5

p.RI = true
p.maxit = 40

p.maxloop = 10

DoNOF.set_ncwo(p,1)

C = DoNOF.read_C(title=p.title)
n = DoNOF.read_n(title=p.title)

DoNOF.energy(bset,p,C=C,n=n,do_hfidr=false,do_m_diagnostic=true)
