!===================================================
! This is the subroutine of the integration method: 
! Runge-Kutta of 4-order 
!===================================================

subroutine RK4

use arrays
use global_parameters

implicit none

integer l
real(kind=8) dt_temp

phi_p = phi 
psi_p = psi
PI_p = PI

do l=1,4

call rhs

if (l.eq.1) then
  K1_phi = rhs_phi
  K1_psi = rhs_psi
  K1_PI  = rhs_PI
  
  dt_temp = dt/2.0d0
  
  psi = psi_p + dt_temp*K1_psi
  PI  = PI_p  + dt_temp*K1_PI
  phi = phi_p + dt_temp*K1_phi
  
else if (l.eq.2) then
  dt_temp = dt/2.0d0
  
  K2_phi = rhs_phi
  K2_psi = rhs_psi
  K2_PI = rhs_PI
  
  phi = phi_p + dt_temp*K2_phi
  psi = psi_p + dt_temp*K2_psi
  PI = PI_p + dt_temp*K2_PI
  
    
 else if (l.eq.3) then 
  dt_temp = dt
  
  K3_phi = rhs_phi
  K3_psi = rhs_psi
  K3_PI = rhs_PI
  
  
  phi = phi_p + dt_temp*K3_phi
  psi = psi_p + dt_temp*K3_psi
  PI  = PI_p  + dt_temp*K3_PI
  
  else if(l.eq.4) then
  
  dt_temp = dt
      
  K4_phi = rhs_phi
  K4_psi = rhs_psi
  K4_PI  = rhs_PI

phi = phi_p + (dt/6.0d0)*( K1_phi + 2.0d0*K2_phi + 2.0d0*K3_phi + K4_phi ) 
psi = psi_p + (dt/6.0d0)*( K1_psi + 2.0d0*K2_psi + 2.0d0*K3_psi + K4_psi ) 
PI  = PI_p  + (dt/6.0d0)*( K1_PI  + 2.0d0*K2_PI  + 2.0d0*K3_PI  + K4_PI ) 
  
end if 

call boundaries

end do


call boundaries

end subroutine RK4
