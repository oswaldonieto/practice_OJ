!!$ ---------------------------------------------------------------
!!$ WAVE_v1.0:
!!$
!!$ Authors : Fabio Duvan Lora Clavijo.
!!$           Anamaria Navarro.
!!$
!!$ Version : 1.0 (2/07/2015)
!!$
!!$ This program solves the relativistic wave equation onto a
!!$ Minkowski space-time.
!!$ ---------------------------------------------------------------

program main 

use global_parameters

implicit none

integer N_points_xx
integer Ntt
integer every_1D_ini

Namelist/Wave_Input/ xmin, xmax, &
                     N_points_xx , res_num, &
                     Ntt , courant,  every_1D_ini, &
                     amplitude, x0, sigma, order, &
                     integrator, bounds
                                              
open(3, file='input.par', status='old')
read(3, nml= Wave_Input)
close(3)

N_points_x = 2**(res_num - 1)*N_points_xx
Nt = 2**(res_num - 1)*Ntt
every_1D = 2**(res_num - 1)*every_1D_ini

print *,
print *, '***************************************'
print *, 'Parameters:'
print *, 'res_num      = ', res_num
print *, 'x_min        = ', xmin
print *, 'x_max        = ', xmax
print *, 'N_points_x   = ', N_points_x
print *, 'Nt           = ', Nt
print *, 'courant      = ', courant
print *, 'every_1D     = ', every_1D
print *, '***************************************'
print *, 'Wave Data:'
print *, 'amplitude    = ', amplitude
print *, 'x0           = ', x0
print *, 'sigma        = ', sigma
print *, '***************************************'
print *, 'Integration Method:' 
print *, '1 if RK3, 2 if RK4, 3 if RKF4 -->           ', integrator
print *, '***************************************'
print *, 'Boundary conditions:'
print *, '1 if outgoing, 2 if periodic --> ', bounds
print *


call cpu_time(cpu_it)
call evolve
call cpu_time(cpu_ft)

print *
print *, 'Program wave 1D has finished'
print *, 'CPU time has been = ', cpu_ft - cpu_it 
print *, '***************************************'
print *, 'Parameters:'
print *, 'res_num      = ', res_num
print *, 'x_min        = ', xmin
print *, 'x_max        = ', xmax
print *, 'N_points_x   = ', N_points_x
print *, 'Nt           = ', Nt
print *, 'courant      = ', courant
print *, 'every_1D     = ', every_1D
print *, 'dx           =', dx
print *, 'dt           =', dt
print *, '***************************************'
print *, 'Wave Data:'
print *, 'amplitude    = ', amplitude
print *, 'x0           = ', x0
print *, 'sigma        = ', sigma
print *, '***************************************'
print *, 'order        = ', order    
print *, '***************************************'
print *, 'Integration Method:' 
print *, '1 if RK3, 2 if RK4, 3 if RKF4 -->           ', integrator
print *, '***************************************'
print *, 'Boundary conditions:'
print *, '1 if outgoing, 2 if periodic --> ', bounds
print *




end program main 
