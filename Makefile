LEX_SRC    := source/analyzer.l      # Lex specification file
EXEC       := lex_analyzer           # name of the generated lexer executable

LEX        := flex
CC         := gcc
CFLAGS     := -std=c11 -Wall -Wextra
LDFLAGS    :=

TEST_DIR   := tests
AC_FILES   := $(wildcard $(TEST_DIR)/*.ac)
OUT_FILES  := $(AC_FILES:.ac=.out)

.PHONY: all test clean generate

all: $(EXEC)

$(EXEC): $(LEX_SRC)
	$(LEX) -o lex.yy.c $(LEX_SRC)
	$(CC) $(CFLAGS) lex.yy.c $(LDFLAGS) -o $(EXEC)

test: all $(OUT_FILES)
	@echo "\n✅ All tests passed!"

$(TEST_DIR)/%.out: $(TEST_DIR)/%.ac $(EXEC)
	./$(EXEC) $< > $@
	@diff -u $@ $(TEST_DIR)/$*.txt

generate:
	python3 code_generator.py 50 > $(TEST_DIR)/test_generated.ac
	@echo "Generated $(TEST_DIR)/test_generated.ac"

clean:
	rm -f lex.yy.c $(EXEC) $(OUT_FILES)
