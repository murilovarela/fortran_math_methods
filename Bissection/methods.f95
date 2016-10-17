! By Murilo Varela

include 'functions.f95'

subroutine methods_bs (n, e, xi, xf, x0, i)
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
    end if

    do i = 1, n
        x0 = (xi + xf) / 2.0

        if (abs( f(x0) ) <= e) then
            print*, "x = ", x0, "Result found with", i, "iterations."
            stop
        else if (abs(xi - x0) <= e) then
            print*, "Actual interval is smaller then tolerance."
            print*, "Last x =", x0, "With f(x) =", f(x0)
            print*, "Result found with", i, "iterations."
            stop
        else
            if (f(x0)*f(xi) > 0.0) then
                xi = x0
            else
                xf = x0
            end if
        end if

    end do

    print*, "Number of iterations exceeded."
    print*, "Total of ", i, "iterations."
    print*, "Last x =", x0

end subroutine
