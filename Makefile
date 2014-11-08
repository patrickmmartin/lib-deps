ALL_LIBS = D.a E.a H.a L.a O.a R.a W.a T.a

default:
	@echo libs: $(ALL_LIBS) 

MAKELIB= @ar -cvq $@ $<

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

all_libs: $(ALL_LIBS)