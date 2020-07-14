
!====================================================
! This Module defines the arrays 
!
! allocatabe   --> asignes memory
! dimension(:) --> for one dimensional arrays
! dimension(:,:) --> for two dimensional arrays
! dimension(:,:,:) --> for three dimensional arrays    
!==================================================== 


module arrays 

implicit none

real(kind=8), allocatable, dimension(:) :: NormaL1
real(kind=8), allocatable, dimension(:) :: NormaL2


real(kind=8), allocatable, dimension(:) :: x
real(kind=8), allocatable, dimension(:) :: dPI
real(kind=8), allocatable, dimension(:) :: dphi
real(kind=8), allocatable, dimension(:) :: dpsi
real(kind=8), allocatable, dimension(:) :: dalpha
real(kind=8), allocatable, dimension(:) :: dbeta



real(kind=8), allocatable, dimension(:) :: phi_exact
real(kind=8), allocatable, dimension(:) :: error_phi

real(kind=8), allocatable, dimension(:) :: phi
real(kind=8), allocatable, dimension(:) :: phi_p
real(kind=8), allocatable, dimension(:) :: rhs_phi


real(kind=8), allocatable, dimension(:) :: psi
real(kind=8), allocatable, dimension(:) :: psi_p
real(kind=8), allocatable, dimension(:) :: rhs_psi


real(kind=8), allocatable, dimension(:) :: PI
real(kind=8), allocatable, dimension(:) :: PI_p
real(kind=8), allocatable, dimension(:) :: rhs_PI


real(kind=8), allocatable, dimension(:) :: alpha
real(kind=8), allocatable, dimension(:) :: beta


real(kind=8), allocatable, dimension(:) :: Left
real(kind=8), allocatable, dimension(:) :: Right

real(kind=8), allocatable, dimension(:) :: K1_phi
real(kind=8), allocatable, dimension(:) :: K2_phi
real(kind=8), allocatable, dimension(:) :: K3_phi
real(kind=8), allocatable, dimension(:) :: K4_phi
real(kind=8), allocatable, dimension(:) :: k5_phi
real(kind=8), allocatable, dimension(:) :: k6_phi


real(kind=8), allocatable, dimension(:) :: K1_psi
real(kind=8), allocatable, dimension(:) :: K2_psi
real(kind=8), allocatable, dimension(:) :: K3_psi
real(kind=8), allocatable, dimension(:) :: K4_psi
real(kind=8), allocatable, dimension(:) :: k5_psi
real(kind=8), allocatable, dimension(:) :: k6_psi
 

real(kind=8), allocatable, dimension(:) :: K1_PI
real(kind=8), allocatable, dimension(:) :: K2_PI
real(kind=8), allocatable, dimension(:) :: K3_PI
real(kind=8), allocatable, dimension(:) :: K4_PI
real(kind=8), allocatable, dimension(:) :: k5_PI
real(kind=8), allocatable, dimension(:) :: k6_PI



end module arrays
