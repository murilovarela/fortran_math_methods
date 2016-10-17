subroutine transform_to_positive_definite_matrix (msize, a, b)
  implicit none
  integer, intent(in) :: msize
  real*8, dimension (msize,msize), intent(inout) :: a
  real*8, dimension (msize,msize) :: at
  real*8, dimension (msize), intent(inout) :: b
  real*8, dimension (msize) :: bt
  integer :: i, j

    at = a
    bt = b
    do j = 1, msize
        if (at(j,j) == 0.0) then
            do i = j, msize
                if(at(i,j) /= 0.0) then
                    at(j,:)= at(i,:)
                    at(i,:) = a(i,:)
                    bt(j) = bt(i)
                    bt(i) = b(j)
                    a = at
                    b = bt
                    exit
                end if
            end do
        end if
    end do

end subroutine
