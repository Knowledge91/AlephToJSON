IDIR=/usr/local/Include
CC=gfortran
CFLAGS=-I$(IDIR)

# make automattically adds the LIBS flag -L/${LDIR}
LDIR=/usr/local/lib

LIBS=-ljsonfortran

alephToJSON: main.f aleph14_vpa.f90
	$(CC) -o $@ num_const.f90 aleph14_vpa.f90 main.f ${CFLAGS} ${LIBS}

clean:
	rm alephToJSON
	rm *.o
