subroutine testing_sl
USE gafort_globals
ss=rdfl
	print '(f10.0,2x,f10.0,2f10.3)',xcord(ibest(1)),ycord(ibest(2)),ibest(3),best
     write(ss(195:204),'(f10.1)')xcord(ibest(1))
     write(ss(206:215),'(f10.1)')ycord(ibest(2))
     write(ss(251:257),'(f7.3)')ibest(3)
    
write(1923,'(a)') ss
rewind(1923)
write(command,'(a9,i3,a17)') 'printf "',itt,'" | aermod/aermod'
call system ( command, result )
end subroutine
