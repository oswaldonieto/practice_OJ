subroutine RKF4

use arrays
use global_parameters

implicit none

integer l
real(kind=8) dt_temp

phi_p = phi
psi_p = psi
PI_p = PI

do l=1,6

call rhs

if (l.eq.1) then
  K1_phi = rhs_phi
  K1_psi = rhs_psi
  K1_PI  = rhs_PI

  dt_temp = dt/5.0d0

  psi = psi_p + dt_temp*K1_psi
  PI  = PI_p  + dt_temp*K1_PI
  phi = phi_p + dt_temp*K1_phi

else if (l.eq.2) then

  dt_temp = dt/40.0d0

  K2_phi = rhs_phi
  K2_psi = rhs_psi
  K2_PI = rhs_PI

  phi = phi_p + (3.0d0*dt_temp*K1_phi) + (9.0d0*dt_temp*K2_phi)
  psi = psi_p + (3.0d0*dt_temp*K1_psi) + (9.0d0*dt_temp*K2_psi)
  PI = PI_p + (3.0d0*dt_temp*K1_PI) + (9.0d0*dt_temp*K2_PI)


 else if (l.eq.3) then
  dt_temp = dt/5.0d0

  K3_phi = rhs_phi
  K3_psi = rhs_psi
  K3_PI = rhs_PI

 phi = phi_p + (3.0d0/2.0d0)*dt_temp*K1_phi - (9.0d0/2.0d0)*dt_temp*K2_phi + 6.0d0*dt_temp*K3_phi
 psi = psi_p + (3.0d0/2.0d0)*dt_temp*K1_psi - (9.0d0/2.0d0)*dt_temp*K2_psi + 6.0d0*dt_temp*K3_psi
 PI = PI_p + (3.0d0/2.0d0)*dt_temp*k1_PI - (9.0d0/2.0d0)*dt_temp*K2_PI + 6.0d0*dt_temp*K3_PI

else if (l.eq.4) then

 dt_temp = dt/27.0d0

 K4_phi = rhs_phi
 K4_psi = rhs_psi
 K4_PI = rhs_PI

 phi = phi_p - (11.0d0/2.0d0)*dt_temp*K1_phi + (135.0d0/2.0d0)*dt_temp*K2_phi - 70.0d0*dt_temp*K3_phi + 35.0d0*dt_temp*K4_phi
 psi = psi_p - (11.0d0/2.0d0)*dt_temp*K1_psi + (135.0d0/2.0d0)*dt_temp*K2_psi - 70.0d0*dt_temp*K3_psi + 35.0d0*dt_temp*K4_psi
 PI = PI_p - (11.0d0/2.0d0)*dt_temp*K1_PI + (135.0d0/2.0d0)*dt_temp*K2_PI - 70.0d0*dt_temp*K3_PI + 35.0d0*dt_temp*k4_PI

 else if (l.eq.5) then

 dt_temp = dt

 K5_phi = rhs_phi
 K5_psi = rhs_psi
 K5_PI = rhs_PI

 phi = phi_p + (1631.0d0/55296.0d0)*dt_temp*K1_phi + (175.0d0/512.0d0)*dt_temp*K2_phi + (575.0d0/13824.0d0)*dt_temp*K3_phi &
             + (44275.0d0/110592.0d0)*dt_temp*K4_phi + (253.0d0/4096.0d0)*dt_temp*K5_phi
 psi = psi_p + (1631.0d0/55296.0d0)*dt_temp*k1_psi + (175.0d0/512.0d0)*dt_temp*k2_psi + (575.0d0/13824.0d0)*dt_temp*k3_psi &
             + (44275.0d0/110592.0d0)*dt_temp*K4_psi + (253.0d0/4096.0d0)*dt_temp*k5_psi
 PI = PI_p + (1631.0d0/55296.0d0)*dt_temp*K1_PI + (175.0d0/512.0d0)*dt_temp*k2_PI + (575.0d0/13824.0d0)*dt_temp*k3_PI &
           + (44275.0d0/110592.0d0)*dt_temp*k4_PI + (253.0d0/4096.0d0)*dt_temp*k5_PI

else if (l.eq.6) then

dt_temp = dt

 K6_phi = rhs_phi
 K6_psi = rhs_psi
 K6_PI = rhs_PI

phi = phi_p + dt*((37.0d0/378.0d0)*k1_phi + (250.0d0/621.0d0)*k3_phi + (125.0d0/594.0d0)*k4_phi &
            + (512.0d0/1771.0d0)*k6_phi)
psi = psi_p + dt*((37.0d0/378.0d0)*k1_psi + (250.0d0/621.0d0)*k3_psi + (125.0d0/594.0d0)*k4_psi & 
            + (512.0d0/1771.0d0)*k6_psi)
PI = PI_p + dt*((37.0d0/378.0d0)*k1_PI + (250.0d0/621.0d0)*k3_PI + (125.0d0/594.0d0)*k4_PI & 
            + (512.0d0/1771.0d0)*k6_PI)

 
end if

call boundaries

end do

call boundaries

end subroutine RKF4
