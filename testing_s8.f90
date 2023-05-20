subroutine testing_s8
USE gafort_globals
ss=rdfl
print '(89(f7.3,2x))',ibest(1:nparam),best
do jj=1,nparam
 	write(ss(3812+85*(jj-1):3818+85*(jj-1)),'(f7.3)') ibest(jj)
enddo
write(1923,'(a)') ss
rewind(1923)
write(command,'(a9,i3,a17)') 'printf "',itt,'" | aermod/aermod'
call system ( command, result )
end subroutine
