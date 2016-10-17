! By Murilo Varela

include 'functions.f95'

subroutine methods_jacobi (n, msize, e, a, b, x, i, xs)
  implicit none

  integer, intent(in) :: n, msize
  real*8, intent(in) :: e
  real*8, dimension (msize,msize), intent(inout) :: a
  real*8, dimension (msize), intent(inout) :: b, x

  integer, intent(out) :: i
  real*8, dimension (msize), intent(out) :: xs

  real*8, dimension (msize) :: xl, er
  real*8 :: xt
  integer :: j, k

    do k = 1, n
        xl = x

        do i = 1, msize
            do j = 1, msize
                if(i /= j) then
                    xt = xt - (a(i,j) * x(j) ) / a(i,i)
                end if
            end do
            xt = xt + b(i) / a(i,i)
            x(i) = xt
            xt = 0.0
        end do

        do j = 1, msize
            er(j) = abs((x(j)-xl(j))/x(j))
        end do

        if (maxval(er) <= e) then
            xs = x
            print*, "Solution found with", k, " iterations"
            print*, "x1 = ", x(1), "x2 = ", x(2), "x3 = ", x(3)
            stop
        end if

    end do

    print*, "Number of iterations exceeded."
    print*, "Total of ", k, "iterations."
    print*, "Last values tested", "x1 = ", x(1), "x2 = ", x(2), "x3 = ", x(3)
    print*, "Absolute error:", "Er x1 = ", er(1), "Er x2 = ", er(2), " Er x3 = ", er(3)

end subroutine


























