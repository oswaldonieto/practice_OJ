!subroutine NormaerrorL1(error, sum)

subroutine NormaerrorL1(l)

use arrays
use global_parameters
implicit none

integer :: i
integer, intent(in) :: l

call exact

NormaL1(l) = 0.0d0

do i = 1 , N_points_x

NormaL1(l) = NormaL1(l) + 0.5*(dabs(error_phi(i-1)) + dabs(error_phi(i)))*dx

end do

!NormaL2(l) = (1.0d0/N_points_x) * (NormaL1(l)**2)**(1.0d0/2.0d0)



end subroutine NormaerrorL1
