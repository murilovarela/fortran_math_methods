! nameOfThe method
! By Murilo Varela

! INSTRUCTIONS:
! Input your functions on the file function.95
! Input e   <tolerance>             <line 17>
! Input xi  <initial value>         <line 18>
! Input n   <number of iterations>  <line 19>

include 'methods.f95'

program main
  implicit none
  integer :: i, n
  real*8 :: e, xi, xf, x0, nx

  e = 0.00000000000001 !1.0e-14
  xi = -10.0
  xf = 10.0
  n = 1000
  nx = 100.0

  call methods_bf (n, nx, e, xi, xf, x0, i)

end program

