


# common makefile.

# See below for explanation
# https://www.gnu.org/software/make/manual/html_node/Automatic-Prerequisites.html

.PHONY: test

test: main
	./main ../../../data/numbers/small

PROG	= main
OBJS	= $(patsubst %.cpp,%.o,$(SRC))
DEPENDS	= $(patsubst %.cpp,%.d,$(SRC))

$(PROG): $(OBJS)
	$(CXX) -o $@ $(OBJS)

.cpp.o:
	$(CXX) $(CXXFLAGS) -o $@ -c $<

.PHONY : clean depend
clean:
	-$(RM) $(PROG) $(OBJS) $(DEPENDS)

%.d: %.cpp
	@set -e; $(CXX) -MM $(CXXFLAGS) $< | sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' > $@;  [ -s $@ ] || rm -f $@

-include $(DEPENDS)
