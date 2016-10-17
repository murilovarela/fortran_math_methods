! By Murilo Varela

include 'functions.f95'

subroutine methods_sc (n, e, xi, xf, x0, i)
  implicit none

  integer, intent(in) :: n
  real*8, intent(in) :: e

  integer, intent(out) :: i
  real*8, intent(out) :: x0

  real*8 :: f, xi, xf

    if(xf < xi) then
        x0 = xf
        xf = xi
        xi = x0
        x0 = xi
    else if (abs( f(xi) - f(xf) ) <= e) then
        xi = xi+xf
        x0 = xi
    else
        x0 = xi
    end if

    do i = 1, n
        if(abs( f(x0) ) <= e) then
            print*, "x = ", x0, "Result found with", i, "iterations."
            stop
        else
            x0 = xf - f(xf) * ((xf - xi) / (f(xf) - f(xi)))

            if(f(xi) - f(xf) > 0.0) then
                xf = x0
            else
                xi = x0
            end if
        end if

    end do

    print*, "Number of iterations exceeded."
    print*, "Total of ", i, "iterations."
    print*, "Last interval (xi, xf): ", xi, xf

end subroutine
