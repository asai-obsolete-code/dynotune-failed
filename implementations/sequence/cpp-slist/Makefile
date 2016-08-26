
.PHONY: test

test: main
	./main ../../../data/numbers/small

CXXFLAGS = -std=c++11

PROG	= main
SRC	= impl.cpp ../../common.cpp ../../rss.cpp
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
