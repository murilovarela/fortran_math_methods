! Secant method
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
  real*8 :: e, xi, xf, x0

  e = 0.00000000000001 !1.0e-14
  xi = -3.0
  xf = 3.0
  n = 1000000

  call methods_sc (n, e, xi, xf, x0, i)

end program

