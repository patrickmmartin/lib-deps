CC=c99

ALL_LIBS=D.a E.a H.a L.a O.a R.a W.a T.a fluxcap.a

MAKELIB= @ar rcs lib$@ $< ; echo archive $@

ALL_LD_FLAGS=-lfluxcap -lD -lE -lH -lL -lO -lR -lW -lT
D_LD_FLAGS  =-lD
E_LD_FLAGS  =-lE
H_LD_FLAGS  =-lH
L_LD_FLAGS  =-lL
O_LD_FLAGS  =-lO
R_LD_FLAGS  =-lR
W_LD_FLAGS  =-lW
T_LD_FLAGS  =-lT


default:
	@echo all_libs: $(ALL_LIBS) 

clean:
	-rm *.o
	-rm *.a

D.a: d.o
	$(MAKELIB)
E.a: e.o
	$(MAKELIB)
H.a: h.o
	$(MAKELIB)
L.a: l.o
	$(MAKELIB)
O.a: o.o
	$(MAKELIB)
R.a: r.o
	$(MAKELIB)
W.a: w.o
	$(MAKELIB)
T.a: t.o
	$(MAKELIB)
fluxcap.a: fluxcap.o
	$(MAKELIB)

all_libs: $(ALL_LIBS)

fluxmain: fluxmain.o $(ALL_LIBS)
	$(CC) -static fluxmain.o -L. $(ALL_LD_FLAGS) -o fluxmain

