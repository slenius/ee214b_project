* Project Part1
.include /usr/class/ee214/hspice/ee214_hspice.sp

*    c B E
q1 vc1 vb1 0 npn214 4
q2 vc2 vb2 vc1 npn214 4
q3 vcc vc2 ve3 npn214 5
q4 vo vc2 ve4 npn214 3

rc2 vcc vc2 250
rc4 vcc vo 100
re4 ve4 vre4 15
cl vo 0 20f
c1 vre4 0 1
cd vb1 0 200f

rf vb1 vx1 220
cf vb1 vx1 57f
vx vx1 ve3 0

vcc vcc 0 dc=2.5
vbias2 vb2 0 dc=1.6
is vb1 0 dc 0 ac 1
*is vb1 0 sin(0 150u 1e9)
ib3 ve3 0 dc 4.5m ac 0
ib4 ve4 0 dc 2m ac 0

.op
.ac dec 100 1k 100gig
.lstb mode=single vsource=vx
.probe ac lstb(db) lstb(p)

.pz v(vo) is

.noise v(vo) is

*.print inoise onoise

*.tran 1p 5n


.option post brief nomod ITLPZ=1000 FMAX=2E12

.end
