! By Murilo Varela

include 'functions.f95'

subroutine methods_nr (n, e, xi, x0, i)
  implicit none
  integer, intent(in) :: n
  real*8, intent(in) :: e, xi

  integer, intent(out) :: i
  real*8, intent(out) :: x0

  real*8 :: f, df

    if(xi == 0.0) then
        x0 = e
    else
        x0 = xi
    end if

    do i = 0, n
        print*, x0, f(x0), df(x0)
        if(abs( f(x0) ) <= e) then
            print*, "x = ", x0, "Result found with", i, "iterations."
            stop
        else
            x0 = x0 - f(x0) / df(x0)
        end if
    end do

    print*, "Number of iterations exceeded."
    print*, "Total of ", i, "iterations."
    print*, "Last x =: ", x0

end subroutine
