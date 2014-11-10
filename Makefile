CC=c99

ALL_LIBS=libD.a libE.a libH.a libL.a libO.a libR.a libW.a libT.a libfluxcap.a

MAKELIB= @ar rcs $@ $< && echo build archive $@:$<

ALL_LD_FLAGS     =-lfluxcap -lD -lE -lH -lL -lO -lR -lW -lT
FLUXCAP_LD_FLAGS =-lfluxcap 
D_LD_FLAGS       =-lD
E_LD_FLAGS  	 =-lE
H_LD_FLAGS  	 =-lH
L_LD_FLAGS  	 =-lL
O_LD_FLAGS  	 =-lO
R_LD_FLAGS  	 =-lR
W_LD_FLAGS  	 =-lW
T_LD_FLAGS  	 =-lT

default:
	@echo all_libs: $(ALL_LIBS) 

ifeq ($(OS), Windows_NT)
  RM=del
endif

clean:
	-@$(RM) *.o
	-@$(RM) *.a

libD.a: d.o
	$(MAKELIB)
libE.a: e.o
	$(MAKELIB)
libH.a: h.o
	$(MAKELIB)
libL.a: l.o
	$(MAKELIB)
libO.a: o.o
	$(MAKELIB)
libR.a: r.o
	$(MAKELIB)
libW.a: w.o
	$(MAKELIB)
libT.a: t.o
	$(MAKELIB)
libfluxcap.a: fluxcap.o
	$(MAKELIB)

all_libs: $(ALL_LIBS)

# TODO(PMM) - I would like to auto-generate the lib dependency list
# this one, is of course, straightforward as it links it all
fluxmain: fluxmain.o $(ALL_LIBS)
	$(CC) -static fluxmain.o -L. $(ALL_LD_FLAGS) -o fluxmain

fluxlite_min: fluxlite.o libfluxcap.a libD.a
	$(CC) -static fluxlite.o -L. -lfluxcap -lD -o fluxlite

fluxlite: fluxlite.o $(ALL_LIBS)
	$(CC) -static fluxlite.o -L. $(ALL_LD_FLAGS) -o fluxlite

