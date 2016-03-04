* EE214B Project Part II
* Samuel Lenius 2016
* Testing matlab stuff

* ee114 device models
.include /usr/class/ee214/hspice/ee214_hspice.sp

* Resistors
* rx t1 t1 value
r1  n_vdd n_x   465
r2  n_vdd n_w   465
rf  n_ox  n_i   900

* Capacitors
* Cx t1 t1 value
cl        n_o   0   20f
cd        n_i   0   200f
c_magic_0 n_z   0   1.0
*cf        n_ox  n_i 130f

* MOSFETs
*MNx  d     g     s     b     n/pmos214     w       l
m1    n_x   n_g   n_i   0     nmos214       w=63u l=0.18u
m2    n_y   n_x   n_z   0     nmos214       w=63u l=0.18u
m3    n_w   n_c   n_y   0     nmos214       w=63u l=0.18u
m4    n_vdd n_w   n_o   0     nmos214       w=63u l=0.18u

mb1   n_i   n_b   0     0     nmos214       w=96u l=0.36u
mb2   n_z   n_b   0     0     nmos214       w=96u l=0.36u
mb3   n_o   n_b   0     0     nmos214       w=96u l=0.36u

* Diodes
*Dx   a     k       dwell     37.4p

* Sources
vdd   n_vdd   0     1.8
vg    n_g     0     1.179
vc    n_c     0     1.446
vb    n_b     0     0.685
vx    n_o     n_ox  0

is    n_i     0   DC=0  AC=1

.measure  ac  gainmax_vout  max   vdb(n_o)
.measure  ac  f3db_vout     when  vdb(n_o)='gainmax_vout - 3'


.op
.ac dec 100 1e6 1000e9
.lstb mode=single vsource=vx
.probe ac lstb(db) lstb(p)
.pz v(n_o) is
.noise v(n_o) is

.option post brief accurate
.end
