* Autogenerated spice file from design_project.m

* ee114 device models
.include /usr/class/ee214/hspice/ee214_hspice.sp

r1  n_vdd n_x   902.2

cd        n_i   0   200.0f
cl        n_o   0   20.0f
cr1       n_vdd n_x 2.4f
cbn       n_bn  0   1
cbp       n_bp  0   1
cf        n_i   n_v 0.0f

m1    n_x   n_vx  n_i   0     nmos214       w=11.0u l=0.18u
m2    n_v   n_i   0     0     nmos214       w=41.7u l=0.18u
m3    n_vdd n_x   n_o   0     nmos214       w=5.8u l=0.18u

mb1   n_i   n_bn  0     0     nmos214       w=7.3u l=0.18u
mb2   n_o   n_bn  0     0     nmos214       w=1.7u l=0.18u
mb3   n_v   n_bp  n_vdd n_vdd pmos214       w=46.3u l=0.18u

vdd   n_vdd   0     1.8
vx    n_v     n_vx  0
is    n_i     0   DC=0  AC=1
*is    n_i     0   sin(0 150u 1e9)
ib    n_vdd   n_bn  468.750u
mb9   n_bn    n_bn  0     0     nmos214       w=7.2u l=0.18u
mb10  n_bp    n_bn  0     0     nmos214       w=7.2u l=0.18u
mb11  n_bp    n_bp  n_vdd n_vdd pmos214       w=19.9u l=0.18u
.op
.ac dec 1000 1e3 1000e9
*.tran 1p 5n
.lstb mode=single vsource=vx
.probe ac lstb(db) lstb(p)
.pz v(n_o) is
.noise v(n_o) is
.option post brief accurate
.end
