CC := g++
CXXFLAGS := -std=c++17 -O2 -Wall -Wextra -pedantic
TARGET := kusched
SRCS := main.cpp
OBJS := $(SRCS:.cpp=.o)

.PHONY: all clean test format run

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $< -o $@

run: all
	./$(TARGET)

test: all
	./scripts/run_tests.sh

format:
	@if command -v clang-format >/dev/null 2>&1; then \
		clang-format -i $(SRCS) parser.h; \
		echo "Formatted with clang-format"; \
	else \
		echo "clang-format not found; install it to use 'make format'"; \
	fi

clean:
	rm -f $(OBJS) $(TARGET)

