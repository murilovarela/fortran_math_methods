! By Murilo Varela

real*8 function f (x)
  implicit none

    real*8 :: x
    f = (x/2.0)**2 - sin(x)
    return
end function

real*8 function df (x)
  implicit none

    real*8 :: x
    df = x/2.0 - cos(x)
    return
end function
