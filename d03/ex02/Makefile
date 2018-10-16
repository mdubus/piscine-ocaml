# Name
NAME="a.out"

# Sources
SOURCES = cipher.ml uncipher.ml

# Compilateurs
CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep

# Libs
LIBS = $(WITHGRAPHICS)
WITHGRAPHICS = graphics.cma -cclib -lGraphics

all: depend $(NAME)

$(NAME): opt byt
	ln -s $(NAME).byt $(NAME)

opt: $(NAME).opt
byt: $(NAME).byt

OBJS = $(SOURCES:.ml=.cmo)
OPTOBJS = $(SOURCES:.ml=.cmx)

$(NAME).byt: $(OBJS)
	$(CAMLC) -o $(NAME).byt $(LIBS) $(OBJS)

$(NAME).opt: $(OPTOBJS)
	$(CAMLOPT) -o $(NAME).opt $(LIBS:.cma=.cmxa) $(OPTOBJS)

# Compilation
.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(CAMLC) -c $<

.mli.cmi:
	$(CAMLC) -c $<

.ml.cmx:
	$(CAMLOPT) -c $<

# Clean
clean:
	rm -f *.cm[iox] *~ .*~
	rm -f $(NAME).o
	rm -f $(SOURCES:.ml=.o)

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME).opt
	rm -f $(NAME).byt

depend: .depend
	$(CAMLDEP) $(SOURCES) > .depend

re: fclean all

include .depend
