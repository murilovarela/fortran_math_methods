! By Murilo Varela

include 'functions.f95'

subroutine methods_bf (n, nx, e, xi, xf, x0, i)
  implicit none

  integer, intent(in) :: n
  real*8, intent(in) :: e, nx

  integer, intent(out) :: i
  real*8, intent(out) :: x0, xi, xf

  real*8 :: f, k, c

    if(xi > xf) then
        x0 = xi
        xi = xf
        xf = x0
    end if

    do i = 0, n

        x0 = xi
        c = nx
        k = (xf - xi) / nx

        do while(c > 0.0)

            if(abs(f(x0)) < e) then
                print*, "result", x0, "iterations", i
                stop
            end if
            if(f(xi) * f(x0) < 0) then
                xf = x0
                xi = x0 - 2.0 * k
                c = -1.0
            else
                x0 = x0 + k
            end if
            !print*, c
            c = c - 1.0
        end do
    end do

    print*, "Number of iterations exceeded."
    print*, "Total of ", i, "iterations."
    print*, "Last x =", x0, "with f(x) = ", f(x0)

end subroutine
