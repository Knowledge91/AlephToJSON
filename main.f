      program alephToJSON
      use,intrinsic :: iso_fortran_env, only: wp => real64
      use json_module
      use num_const

      implicit none

      type(json_core) :: json
      type(json_value),pointer :: p, inp

!     initialize Aleph data
      integer N, i
      parameter(N=80)
      character(len=10) :: name
      real(dp) :: sbin(N),dsbin(N),sfm2(N),derr(N),corerr(N,N)

!     VpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpAVpA
      call aleph_vplusa(sbin,dsbin,sfm2,derr,corerr)

!     initialize the class
      call json%initialize()

!     initialize the structure:
      call json%create_object(p,'')

!     add an "inputs" object to the structure:
      call json%create_object(inp,'data')
      call json%add(p, inp)     !add it to the root

!     add some data to inputs:
      call json%add(inp, 'sbin', sbin)
      call json%add(inp, 'dsbin', dsbin)
      call json%add(inp, 'sfm2', sfm2)
      call json%add(inp, 'derr', derr)

      do i=1, N
         write(name,"(A6,I0.2)") "corerr", i
         call json%add(inp, name, corerr(:,i))
      end do

      nullify(inp)              !don't need this anymore

!     write the file:
      call json%print(p,'./alephVpA.json')

!     cleanup:
      call json%destroy(p)
      if (json%failed()) stop 1

!     VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
!     get Aleph V json
      call aleph_v(sbin,dsbin,sfm2,derr,corerr)

!     initialize the class
      call json%initialize()

!     initialize the structure:
      call json%create_object(p,'')

!     add an "inputs" object to the structure:
      call json%create_object(inp,'data')
      call json%add(p, inp)     !add it to the root

!     add some data to inputs:
      call json%add(inp, 'sbin', sbin)
      call json%add(inp, 'dsbin', dsbin)
      call json%add(inp, 'sfm2', sfm2)
      call json%add(inp, 'derr', derr)

      do i=1, N
         write(name,"(A6,I0.2)") "corerr", i
         call json%add(inp, name, corerr(:,i))
      end do

      nullify(inp)              !don't need this anymore

!     write the file:
      call json%print(p,'./alephV.json')

!     cleanup:
      call json%destroy(p)
      if (json%failed()) stop 1

!     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      call aleph_a(sbin,dsbin,sfm2,derr,corerr)

!     initialize the class
      call json%initialize()

!     initialize the structure:
      call json%create_object(p,'')

!     add an "inputs" object to the structure:
      call json%create_object(inp,'data')
      call json%add(p, inp)     !add it to the root

!     add some data to inputs:
      call json%add(inp, 'sbin', sbin)
      call json%add(inp, 'dsbin', dsbin)
      call json%add(inp, 'sfm2', sfm2)
      call json%add(inp, 'derr', derr)

      do i=1, N
         write(name,"(A6,I0.2)") "corerr", i
         call json%add(inp, name, corerr(:,i))
      end do

      nullify(inp)              !don't need this anymore

!     write the file:
      call json%print(p,'./alephA.json')

!     cleanup:
      call json%destroy(p)
      if (json%failed()) stop 1

      end program alephToJSON
