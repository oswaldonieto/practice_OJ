!=================================================
! This subroutine sets the grid
! ================================================

subroutine grid

use arrays
use global_parameters

implicit none

integer i

! Separation between the points of the grid =====
dx = (xmax - xmin)/dble(N_points_x)

! Separation of time for evolution===============
dt = courant * dx

!Create the grid=================================
do i=0, N_points_x

x(i) = xmin+ dble(i)*dx

end do

print *, 'dx           =', dx
print *, 'dt           =', dt

end subroutine grid