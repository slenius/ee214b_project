* Project Part1
.include /usr/class/ee214/hspice/ee214_hspice.sp

*    C B E
q1 vc1 vb1 0 npn214 4
q2 vc2 vb2 vc1 npn214 4
q3 Vcc vc2 ve3 npn214 5
q4 vo vc2 ve4 npn214 3

Rc2 Vcc vc2 250
Rc4 Vcc vo 100
Re4 ve4 vre4 15
Cl Vo 0 20f
C1 vre4 0 1 
Cd vb1 0 200f

Rf vb1 ve3 220
*Cf vb1 ve3

Vcc Vcc 0 dc=2.5
Vbias2 vb2 0 dc=1.6
Is vb1 0 dc 0 ac 1
Ib3 ve3 0 dc 4.5m ac 0
Ib4 ve4 0 dc 2m ac 0

.op
*.ac dec 10 1k 1000gig

.option post brief nomod

.end
