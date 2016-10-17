! Jacobi method
! By Murilo Varela

! INSTRUCTIONS:
! Input your matrix on file input.txt <1. matrix size; 2. matrix A; 3. matrix b> <form: A * x = b>
! Input e       <tolerance>             <line 35>
! Input n       <number of iterations>  <line 36>
! Input x(1)    <initial value>         <line 38> <optional>
! Input x(2)    <initial value>         <line 39> <optional>
! Input x(3)    <initial value>         <line 40> <optional>

include 'methods.f95'
include 'routines.f95'

program main
  implicit none
  integer :: n, msize, i, j
  real*8 :: e
  real*8, allocatable, dimension (:,:) :: a
  real*8, allocatable, dimension (:) :: b, x, xs
  read(*,*) i
  print*, i
  open(10, file = 'input.txt')
  read(10,*) msize
    allocate(a(msize,msize))
    allocate(b(msize))
    allocate(x(msize))
    allocate(xs(msize))

    do i = 1, msize
        read(10,*) a(i,:)
    end do

    read(10,*) b(:)

  e = 0.00000000000001 !1.0e-14
  n = 100

  x(1) = -4.6
  x(2) = 13.9
  x(3) = 33.5

  call transform_to_positive_definite_matrix (msize, a, b)
  do i=1,msize
    write(*,*) (a(i,j), j=1,msize), b(i)
  end do
  call methods_jacobi (n, msize, e, a, b, x, i, xs)
  close(10)
end program
