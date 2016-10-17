! By Murilo Varela

real*8 function f (x)
  implicit none

    real*8 :: x
    f = x**2.0 - 2.0 * x**3.0 + 3.0 * x + x - 100.0
    return
end function
