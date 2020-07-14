!======================================================
! This Module defines the parameters 
! =====================================================

module global_parameters

implicit none 

! Parameters of the grid ==============================
real(kind=8) xmin 
real(kind=8) xmax
real(kind=8) dx
integer N_points_x
integer res_num
integer every_1D


! Parameters of evolution in time =====================
integer Nt ! Numero de Iteraciones
real(kind=8) t
real(kind=8) dt
real(kind=8) courant

! Parameters of the initial wave ======================
real(kind=8) amplitude
real(kind=8) x0
real(kind=8) sigma

!parameter that choses the order of integration
integer order

! Parameter that chooses the integration method =======
integer integrator
integer bounds

!Parameters to compute the CPU time

real (kind=8) cpu_it
real (kind=8) cpu_ft
real (kind=8) cpu_t

end module global_parameters
 
 
