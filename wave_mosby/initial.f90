!====================================================================
! This subroutine sets the initial values of the arrays and variables
! ===================================================================

subroutine initial

use arrays
use global_parameters

implicit none

!Initial time
t=0

! Initial wave
phi = amplitude*exp( (-(x-x0)**2)/sigma**2 )
psi = -2*(x-x0)*phi/sigma**2
PI = 0.0d0

!Left and Right modes of the wave
Left  = 0.50d0*( PI + phi )
Right = 0.50d0*( PI - phi )

!Values of alpha and beta
alpha = 1.0d0
beta = 0.0d0


end subroutine initial 
