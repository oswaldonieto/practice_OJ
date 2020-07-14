
!======================================================
! This Subroutine does the evolution in time of the system
! ===================================================== 


subroutine evolve

use global_parameters
use arrays

implicit none

real (kind=8) :: sum
integer l 

! =============== Call subroutines
call memory 
call ini_arrays
call grid
call initial
call exact

print *,'----------------------------'
print *,'|  Time step  |    Time    |'
print *,'----------------------------'

write(*,"(A5,I6,A6,ES9.2,A3)") ' |   ',0,'    | ',t,'  |'



! =============== Save Initial Data
call save1Ddata(phi, 'phi', 0)
call save1Ddata(psi, 'psi', 0)
call save1Ddata(PI, 'PI', 0)
call save1Ddata(Left, 'Left', 0)
call save1Ddata(Right, 'Right', 0)

call save1Ddata(phi_exact, 'phi_exact', 0)
call save1Ddata(error_phi, 'error_phi', 0)
call save(NormaL1(0), 'NormaL1',0)
call save(NormaL2(0), 'NormaL2',0)

! =============== Start Evolution

do l=1, Nt
t = t + dt 

if (mod(l,every_1D).eq.0) then
    call cpu_time(cpu_t)
    write(*,"(A5,I6,A6,ES9.2,A3)") ' |   ',l,'    | ',t,'  |'
    print *,'cpu time = ',cpu_t-cpu_it,'secs'
 end if

! =============== Choose Integration Method
if (integrator.eq.1) then
  call RK3 
else if (integrator.eq.2) then
  call RK4
else if (integrator.eq.3) then
  call RKF4 
end if

call exact


call NormaerrorL1(l)


if (mod(l, every_1D).eq.0) then

   ! =============== Save Data in each step
   call save(NormaL2(l), 'NormaL2',1)
call save(NormaL1(l), 'NormaL1', 1)
call save1Ddata(phi, 'phi', 1)
call save1Ddata(psi, 'psi', 1)
call save1Ddata(PI, 'PI', 1)
call save1Ddata(Left, 'Left', 1)
call save1Ddata(Right, 'Right', 1)

call save1Ddata(phi_exact, 'phi_exact', 1)
call save1Ddata(error_phi, 'error_phi', 1)

end if

end do


end subroutine evolve

