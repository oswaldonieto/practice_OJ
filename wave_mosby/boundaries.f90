!========================================================
! This is the subroutine defines the boundary conditions
!========================================================

subroutine boundaries

use global_parameters
use arrays

implicit none
integer :: j
integer :: i
real(kind=8) :: sum_1
real(kind=8) :: sum_2
real(kind=8) :: sum_3
real(kind=8) :: sum_4
real(kind=8) :: productoria_1
real(kind=8) :: productoria_2




if (order.eq.1) then

! Define the left and right modes of the wave
Left  = 0.50d0*( PI + psi )
Right = 0.50d0*( PI - psi )

! Calculate the functions on the boundaries
Left(0) = 3.0d0*Left(1) - 3.0d0*Left(2) + Left(3)
Right(0) = 3.0d0*Right(1) - 3.0d0*Right(2) + Right(3)

Left(N_points_x) = 3.0d0*Left(N_points_x-1) - 3.0d0*Left(N_points_x-2) + Left(N_points_x - 3)
Right(N_points_x) = 3.0d0*Right(N_points_x-1) - 3.0d0*Right(N_points_x-2) + Right(N_points_x - 3)




else if (order.eq.2) then

Left  = 0.50d0*( PI + psi )
Right = 0.50d0*( PI - psi )


sum_1=0
sum_2=0
sum_3=0
sum_4=0


do i = 1, 5

productoria_1 = 1

 do j= 1, 5


  if (j.ne.i) then

productoria_1 = productoria_1 * (x(0) - x(j))/(x(i)-x(j))
  
   end if
 end do
   
sum_1 = sum_1 + (productoria_1 * Left(i))
sum_2 = sum_2 + (productoria_1 * Right(i))
  

end do

Left(0) = sum_1
Right(0) = sum_2


do i = N_points_x-5, N_points_x-1

productoria_2 = 1

 do j = N_points_x-5, N_points_x-1

   if (j.ne.i) then

 productoria_2 = productoria_2 * (x(N_points_x) - x(j))/(x(i)-x(j))

  end if  

 end do

 
sum_3 = sum_3 + (productoria_2 * Left(i))  
sum_4 = sum_4 + (productoria_2 * Right(i))  

end do


Left(N_points_x) = sum_3
Right(N_points_x) = sum_4

end if

! Set the boundaries

if (bounds.eq.1) then

PI(0) = Left(0) 
psi(0) = Left(0) 
PI(N_points_x) = Right(N_points_x) 
psi(N_points_x) = -Right(N_points_x) 


else if (bounds.eq.2) then

phi(0) = phi(N_points_x-1)
psi(0) = psi(N_points_x-1)
PI(0) = PI(N_points_x-1)

phi(N_points_x) = phi(1)
psi(N_points_x) = psi(1)
PI(N_points_x) = PI(1)

end if


end subroutine boundaries
