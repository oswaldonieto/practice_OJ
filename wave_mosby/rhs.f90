subroutine rhs


use global_parameters
use arrays
use Derivs

implicit none

integer i 

rhs_phi = alpha*PI + beta*psi

if (order.eq.1) then

 call Derivssecondordercentered(alpha,dalpha)
 call Derivssecondordercentered(beta,dbeta)
 call Derivssecondordercentered(PI,dPI)
 call Derivssecondordercentered(psi,dpsi)
 call Derivssecondordercentered(phi,dphi)

else if (order.eq.2) then

 call Derivsfourthordercentered(alpha,dalpha)
 call Derivsfourthordercentered(beta,dbeta)
 call Derivsfourthordercentered(PI,dPI)
 call Derivsfourthordercentered(psi,dpsi)
 call Derivsfourthordercentered(phi,dphi)

end if


do i=1, N_points_x - 1 

  rhs_psi(i) = alpha(i)*dPI(i) + PI(i)*dalpha(i) + beta(i)*dpsi(i) + psi(i)*dbeta(i)
  rhs_PI(i) = alpha(i)*dpsi(i) + psi(i)*dalpha(i) + beta(i)*dPI(i) + PI(i)*dbeta(i)

  
end do

end subroutine rhs




