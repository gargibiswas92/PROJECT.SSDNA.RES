        implicit real*8(a-h,o-z)
        character*8 bead*3,residue*4,filename*1000
        real a, sum, avg
	character*8 comm*8
        dimension a(100000,65), avg(65)
        character filename1*1000
        character*30 myfile1, myfile2, line



        Call System("ls 2body_*.dat > input_two_b.txt")

        open(30, FILE='input_two_b.txt',ACCESS='sequential'
     &,status="old")

        do ifile=1,20

        read(30,*)filename1

        open(1,file=filename1,status="old")  

        write(myfile1,'(a,a,i3.3,a)')'Eneg_avg','_',ifile,'.txt'
        open(13, file=myfile1, position="append")

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
        do i=1,10000
        read(1,'(60f15.6)')(a(i,j),j=1,60)
c        write(*,*)(a(i,j),j=1,60)
        enddo

        do ij=1,60
        sum=0.0
        count=0
        do kl=1,10000
        sum=sum+a(kl,ij)
        count=count+1
        enddo
        avg(ij)=sum/count
     
        write(13,25)ij,avg(ij)
25      format(i8, f16.5)
        enddo
        enddo

        close(30)
        close(13)
c###############################################################################
        stop


        end
