        implicit real*8(a-h,o-z)
        character*8 bead*3,residue*4,filename*1000
        real eneg, avg, sum
        integer nt, count
	character*8 comm*8
        dimension eneg(20,65), nt(65), avg(65)
        character filename1*1000
        character*30 myfile1, myfile2, line



        Call System("ls Eneg_avg*.txt > input_avg_b.txt")

        open(30, FILE='input_avg_b.txt',ACCESS='sequential'
     &,status="old")

        open(55, file='average.txt', status='new')

        do ifile=1,20

        read(30,*)filename1

        open(1,file=filename1,status="old")  

        write(myfile1,'(a,a,i3.3,a)')'Eneg_avg','_',ifile,'.txt'
        open(13, file=myfile1, position="append")

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
        do i=1,60
        read(1,'(i8,f16.5)')nt(i),eneg(ifile,i)
        write(*,*)nt(i),eneg(ifile,i)
        enddo

        enddo

        do ij=1,60
        sum=0.0
        count=0
        do kl=1,20
        sum=sum+eneg(kl,ij)
        count=count + 1
        enddo
        avg(ij)=sum/count
        write(55,19)ij,avg(ij)
19      format(i8, f12.5)        
        enddo


        close(30)
        close(13)
        close(55)
c###############################################################################
        stop


        end
