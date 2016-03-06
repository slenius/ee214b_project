* EE214B Project Part II
* Samuel Lenius 2016

* ee114 device models
.include /usr/class/ee214/hspice/ee214_hspice.sp

* Resistors
* rx t1 t1 value
rc2  n_vdd n_x   250
rc4  n_vdd n_o   100
re4  n_z   n_ze  15
rf   n_yx  n_i   220

* Capacitors
* Cx t1 t1 value
cl        n_o   0   20f
cd        n_i   0   200f
c_magic   n_ze  0   1.0
cf        n_yx  n_i 0f

* MOSFETs
*MNx  d     g     s     b     n/pmos214     w       l
m1    n_w   n_i   0     0     nmos214       w=100u l=0.18u
m2    n_x   n_b   n_w   0     nmos214       w=100u l=0.18u
m3    n_vdd n_x   n_y   0     nmos214       w=100u l=0.18u
m4    n_o   n_x   n_z   0     nmos214       w=30u l=0.18u

* Diodes
*Dx   a     k       dwell     37.4p

* Sources
vdd   n_vdd   0     1.8
vb    n_b     0     1.8
vx    n_y     n_yx  0

is    n_i     0   DC=0  AC=1

ib3   n_y     0     4.5m
ib4   n_z     0     2.0m



.op
.ac dec 100 1e6 1000e9
.lstb mode=single vsource=vx
.probe ac lstb(db) lstb(p)
.pz v(vod) vid
.noise v(n_o) is

.option post brief accurate
.end
