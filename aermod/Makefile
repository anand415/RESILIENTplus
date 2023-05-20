PROG =  aermod
OBJS =  modules.o modules2.o aermod.o calc1.o calc2.o coset.o evcalc.o evoutput.o evset.o iblval.o \
inpsum.o meset.o metext.o ouset.o output.o pitarea.o \
prime.o prise.o reset.o setup.o siggrid.o sigmas.o soset.o tempgrid.o evalsec.o \
windgrid.o uninam.o rline.o
LIBS =
FC = gfortran
FFLAGS = -O3 -w
LDFLAGS =
all: $(PROG)
$(PROG):   $(OBJS)
	$(FC) $(LDFLAGS) $(FFLAGS) -o $@ $(OBJS) $(LIBS)
clean:
	rm -f $(PROG) $(OBJS) *.mod
