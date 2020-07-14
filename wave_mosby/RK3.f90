!===================================================
! This is the subroutine of the integration method: 
! Runge-Kutta of 3-order 
!(Predictor Corrector)
!===================================================

subroutine RK3

use arrays
use global_parameters

implicit none

integer l
real(kind=8) dt_temp

phi_p = phi 
psi_p = psi
PI_p  = PI

do l=1,3

call rhs

if (l.eq.1) then
  dt_temp = dt
  phi = phi_p + dt_temp*rhs_phi
  psi = psi_p + dt_temp*rhs_psi
  PI  = PI_p  + dt_temp*rhs_PI
  
else if (l.eq.2) then
  dt_temp = 0.25d0*dt
  phi = 0.75*phi_p + 0.25*phi + dt_temp*rhs_phi
  psi = 0.75*psi_p + 0.25*psi + dt_temp*rhs_psi
  PI  = 0.75*PI_p + 0.25*PI + dt_temp*rhs_PI

else 
  dt_temp = 2.0d0*dt/3.0d0
  phi = phi_p/3.0d0 + 2.0d0*phi/3.0d0 + dt_temp*rhs_phi
  psi = psi_p/3.0d0 + 2.0d0*psi/3.0d0 + dt_temp*rhs_psi
  PI = PI_p/3.0d0 + 2.0d0*PI/3.0d0 + dt_temp*rhs_PI
end if 

call boundaries

end do
end subroutine RK3