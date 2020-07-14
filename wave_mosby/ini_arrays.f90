!==============================================================
! This subroutine sets the initial values of the arrays in zero
! =============================================================

subroutine ini_arrays

use arrays
use global_parameters 

implicit none 

! Arrays of the grid ==========================================

x=0.0d0

! Arrays of the functions =====================================

dPi=0.0d0
dpsi=0.0d0
dalpha=0.0d0
dbeta=0.0d0
dphi=0.0d0


psi=0.0d0
psi_p=0.0d0
rhs_psi=0.0d0

phi=0.0d0
phi_p=0.0d0
rhs_phi=0.0d0

PI=0.0d0
PI_p=0.0d0
rhs_PI=0.0d0


Left  = 0.0d0
Right = 0.0d0

! Arrays of the functions of the observer =====================
alpha=0.0d0
beta=0.0d0

! Arrays of the RK4 method ====================================
K1_phi=0.0d0
K2_phi=0.0d0
K3_phi=0.0d0
K4_phi=0.0d0
k5_phi=0.0d0
k6_phi=0.0d0


K1_psi=0.0d0
K2_psi=0.0d0
K3_psi=0.0d0
K4_psi=0.0d0
k5_psi=0.0d0
k6_psi=0.0d0


K1_PI=0.0d0
K2_PI=0.0d0
K3_PI=0.0d0
K4_PI=0.0d0
k5_PI=0.0d0
k6_PI=0.0d0


phi_exact=0.0d0
error_phi=0.0d0
NormaL1 = 0.0d0

end subroutine ini_arrays
