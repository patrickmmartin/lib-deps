CC=c99
ALL_LIBS=D.a E.a H.a L.a O.a R.a W.a T.a fluxcap.a

MAKELIB= @ar rcs  lib$@ $< ; echo archive $@

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
	c99 -static fluxmain.o -L. -lfluxcap -lD -lE -lH -lL -lO -lR -lW -lT -o fluxmain