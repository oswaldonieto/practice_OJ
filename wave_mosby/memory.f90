!====================================================
! This subroutine gives memory to the arrays
!==================================================== 

subroutine memory

use arrays
use global_parameters

implicit none

allocate(x(0:N_points_x))

allocate(dPI(0:N_points_x))
allocate(dphi(0:N_points_x))
allocate(dpsi(0:N_points_x))
allocate(dalpha(0:N_points_x))
allocate(dbeta(0:N_points_x))

allocate(phi_exact(0:N_points_x))
allocate(error_phi(0:N_points_x))
allocate(NormaL1(1:Nt))


allocate(phi(0:N_points_x))
allocate(phi_P(0:N_points_x))
allocate(rhs_phi(0:N_points_x))

allocate(psi(0:N_points_x))
allocate(psi_p(0:N_points_x))
allocate(rhs_psi(0:N_points_x))

allocate(PI(0:N_points_x))
allocate(PI_p(0:N_points_x))
allocate(rhs_PI(0:N_points_x))

allocate(Left(0:N_points_x))
allocate(Right(0:N_points_x))

allocate(alpha(0:N_points_x))
allocate(beta(0:N_points_x))

allocate(K1_phi(0:N_points_x))
allocate(K2_phi(0:N_points_x))
allocate(K3_phi(0:N_points_x))
allocate(K4_phi(0:N_points_x))
allocate(K5_phi(0:N_points_x))
allocate(K6_phi(0:N_points_x))

allocate(K1_psi(0:N_points_x))
allocate(K2_psi(0:N_points_x))
allocate(K3_psi(0:N_points_x))
allocate(K4_psi(0:N_points_x))
allocate(K5_psi(0:N_points_x))
allocate(K6_psi(0:N_points_x))

allocate(K1_PI(0:N_points_x))
allocate(K2_PI(0:N_points_x))
allocate(K3_PI(0:N_points_x))
allocate(K4_PI(0:N_points_x))
allocate(K5_PI(0:N_points_x))
allocate(K6_PI(0:N_points_x))


end subroutine memory
