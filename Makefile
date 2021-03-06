CC=c99

ALL_LIBS=libD.a libE.a libH.a libL.a libO.a libR.a libW.a libT.a libfluxcap.a
ALL_BIN=fluxmain fluxlite fluxlite_min fluxlite_min_dyn

MAKELIB= @ar rcs $@ $< && echo build archive $@:$<

_= -L. -lfluxcap

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
	@echo binaries: $(ALL_BIN) 

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
libfluxcap_dyn.a: fluxcap_dyn.o
	$(MAKELIB)

all_libs: $(ALL_LIBS)

fluxmain: fluxmain.o $(ALL_LIBS)
	$(CC) -static fluxmain.o -L. $(ALL_LD_FLAGS) -o fluxmain

fluxlite_min: fluxlite.o libfluxcap.a libD.a
	$(CC) -static fluxlite.o -L. -lfluxcap -lD -o fluxlite_min

fluxlite: fluxlite.o $(ALL_LIBS)
	$(CC) -static fluxlite.o -L. $(ALL_LD_FLAGS) -o fluxlite

fluxlite_min_dyn: fluxlite_dyn.o libfluxcap_dyn.a libD.a
	$(CC) -static fluxlite_dyn.o -L. -lfluxcap_dyn -lD -o fluxlite_min_dyn

fluxlite_min_dyn_nolibs: fluxlite_dyn.o libfluxcap_dyn.a libD.a
	$(CC) -static fluxlite_dyn.o -L. -o fluxlite_min_dyn


graphs:
	makesimple > make.simple
	gvmake -file make.simple fluxmain
	gvmake -file make.simple fluxlite
	gvmake -file make.simple fluxlite_min_dyn
	gvmake -file make.simple fluxmain --debug > fluxmain.gv
	gvmake -file make.simple fluxlite --debug > fluxlite.gv
	gvmake -file make.simple fluxlite_min_dyn --debug > fluxlite_min_dyn.gv
















fluxall: fluxmain.o $(ALL_LIBS)
	$(CC) -static fluxmain.o $(_) -lT -lH -lE  -lW -lO -lR -lL -lD -o fluxall

