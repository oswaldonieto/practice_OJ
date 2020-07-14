!=========================================================
! This is the subroutine that saves data in One-Dimension
!=========================================================

  subroutine save(fval,base_name,first_index)

  use arrays
  use global_parameters

  implicit none

  character(len=20) filestatus
  logical firstcall
  data firstcall / .true. /
  save firstcall

  character(len=*), intent(IN) :: base_name
  real(kind=8), intent(IN) :: fval

  character(len=256) :: filename

  integer i,first_index,auxcounter,after,before

  if (res_num.eq.1) then
    filename = base_name // '_1.x'
  else if (res_num.eq.2) then
    filename = base_name // '_2.x'
  else if (res_num.eq.3) then
    filename = base_name // '_3.x'
  else if (res_num.eq.4) then
    filename = base_name // '_4.x'
  else if (res_num.eq.5) then
    filename = base_name // '_5.x'
  end if

  if (first_index.eq.0) then
     filestatus = 'replace'
  else
     filestatus = 'old'
  end if

  if (filestatus=='replace') then
     open(1,file=filename,status=filestatus)
  else
     open(1,file=filename,status=filestatus,position='append')
  end if
  do i=0,N_points_x,2**(res_num-1)
    write(1,*) t,fval
end do
 close(1)

  end subroutine save

