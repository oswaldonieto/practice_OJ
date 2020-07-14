module Derivs

use arrays
use global_parameters
implicit none

!real(kind=8), dimension(0:N_points_x), intent(IN) :: u
!real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
!integer :: i


contains

!***********************************************************************************
!Subrutina para calcular Derivadas
!Aproximación de segundo orden
!***********************************************************************************

subroutine Derivssecondordercentered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x -1 

  du(i) = (u(i+1) - u(i-1))/(2.0d0*dx)
             
 end do

end subroutine Derivssecondordercentered

!************************************************************************************
!Subrutina para calcular las derivadas
!Aproximación de Cuarto orden
!***********************************************************************************

subroutine Derivsfourthordercentered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x-1

  if (i.eq.1) then

   du(i) = (-3.0d0*u(i-1) - 10.0d0*u(i) + 18.0d0*u(i+1) - 6.0d0*u(i+2) + u(i+3))/(12.0d0*dx)

  else if (i.eq.N_points_x-1) then

   du(i) = (3.0d0*u(i+1) + 10.0d0*u(i) -18.0d0*u(i-1) + 6.0d0*u(i-2) - u(i-3))/(12.0d0*dx)

  else 

   du(i) = (u(i-2) - 8.0d0*u(i-1) + 8.0d0*u(i+1) - u(i+2))/(12.0d0*dx)

  end if

 end do

end subroutine Derivsfourthordercentered

!***********************************************************************************
!Aproximación de cuarto orden
!Derivada Descentrada a la izquierda
!***********************************************************************************


subroutine Derivsfourthorderleft1centered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x-1
 
   du(i) = (25.0d0*u(i) -48.0d0*u(i-1) + 36.0d0*u(i-2) -16.0d0*u(i-3) + 3.0d0*u(i-4))/(12.0d0*dx)
  
 end do

end subroutine Derivsfourthorderleft1centered

!***********************************************************************************
!Aproximación de cuarto orden
!Derivada Descentrada a la izquierda 2
!***********************************************************************************


subroutine Derivsfourthorderleft2centered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x-1

  du(i) = (3.0d0*u(i+1) + 10.0d0*u(i) -18.0d0*u(i-1) + 6.0d0*u(i-2) - u(i-3))/(12.0d0*dx)

 end do

end subroutine Derivsfourthorderleft2centered

!***********************************************************************************
!Aproximación de cuarto orden
!Derivada Descentrada a la derecha 
!***********************************************************************************


subroutine Derivsfourthorderright1centered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x-1

  du(i) = (-25.0d0*u(i) +48.0d0*u(i+1) - 36.0d0*u(i+2) + 16.0d0*u(i+3) - 3.0d0*u(i+4))/(12.0d0*dx)
  
 end do

end subroutine Derivsfourthorderright1centered

!***********************************************************************************
!Aproximación de cuarto orden
!Derivada Descentrada a la derecha 2
!***********************************************************************************
 

subroutine Derivsfourthorderright2centered(u,du)

real(kind=8), dimension(0:N_points_x), intent(IN) :: u
real(kind=8), dimension(0:N_points_x), intent(OUT) :: du 
integer :: i

 do i = 1, N_points_x-1

  du(i) = (-3.0d0*u(i-1) - 10.0d0*u(i) + 18.0d0*u(i+1) - 6.0d0*u(i+2) + u(i+3))/(12.0d0*dx)

 end do

end subroutine Derivsfourthorderright2centered


end module Derivs


