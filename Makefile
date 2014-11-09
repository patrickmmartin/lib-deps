CC=c99
ALL_LIBS=D.a E.a H.a L.a O.a R.a W.a T.a fluxcap.a

clean:
	-rm *.o
	-rm *.a

default:
	@echo all_libs: $(ALL_LIBS) 

MAKELIB= @ar rcs  lib$@ $< ; echo archive $@



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

fluxmain: fluxmain.o