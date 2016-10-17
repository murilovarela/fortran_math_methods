! Newton-Raphson method
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
  real*8 :: e, xi, x0

  e = 0.0001
  xi = 5.0
  n = 100

  call methods_nr (n, e, xi, x0, i)

end program

