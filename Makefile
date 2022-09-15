-include submake/Makefile
target=a.out
temp+=abc
ccflags=-Iheader
obj-y=/home/wg/worker/makefiletest/
src=$(wildcard *.cpp)
objs=$(patsubst %.cpp,%.o,$(src))
$(target):	
%.o:%.cpp
	$(CXX) -c $^ -o $@ $(ccflags)
	
clean:
	rm $(objs) -f
	echo $(temp)
	echo $(abc)
test:
	echo $(obj-y)
build/CMakeCache.txt:
	echo "CMakeCache.txt"
.PHONY:clean install test
.DEFAULT_GOAL:=$(target)
$(target):$(objs)
	$(CXX) $^ -o $@ 
install:
	cp a.out ../

