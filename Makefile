PROGRAM = armd

# w for ignore warning, -g for all warning
FC = gfortran
FFLAGS = -Ofast -fopenmp -g -ffpe-trap=zero,overflow,underflow,invalid

.SUFFIXES : .o .f90 .f

RAW =    GA_openmp.o crosnmuts8.o  train_test.o GA_openmp2.o initial3_s8.o  GA_openmp3.o    selecnnewgen.o evals8.o initials8.o  crosnmut2_s8.o   crosnmut3_s8.o   initial2_s8.o randgen.o testing_s8.o

.SILENT: *.o

.f90.o:
	$(FC) $(FFLAGS)  -c -o $@ $<

.F90.o:
	$(FC) $(FFLAGS) $(INCLUDE) -c -o $@ $<

$(PROGRAM):	$(RAW)
	$(FC) $(FFLAGS)  -o $(@) $(RAW)

clean:
	rm -f $(PROGRAM) *.o *.mod
  
