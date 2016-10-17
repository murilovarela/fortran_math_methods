! Bissection method
! By Murilo Varela

! INSTRUCTIONS:
! Input your functions on the file function.95
! Input e   <tolerance>             <line 17>
! Input xi  <initial value>         <line 18>
! Input xf  <final value>         <line 19>
! Input n   <number of iterations>  <line 20>

include 'methods.f95'

program main
  implicit none
  integer :: i, n
  real*8 :: e, xi, xf, x0

  e = 0.0000000000001 !1.0e-14
  xi = -1000.0
  xf = 1000.0
  n = 100

  call methods_bs (n, e, xi, xf, x0, i)

end program

