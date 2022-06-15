NAME	=	minishell


CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror
DEBUG	=	-g3 -fsanitize=address -DDEBUG_FLAG=1
RM		=	rm -f

# parser source files
SRC		=	main.c\
			minishell_initialize.c\
			read_pipeline.c\
			generate_process.c\
			redirect_process.c\
			execute_command.c\
			execute_helper_func.c\
			delete_command_list.c\
			parser/parser.c\
			parser/parser_error.c\
			parser/parse_command.c\
			parser/parse_redirect.c\
			parser/print_parsing_info.c\
			tokenizer/tokenizer.c\
			tokenizer/token_helper_func.c\
			tokenizer/recognition_procedure_1.c\
			tokenizer/recognition_procedure_2.c\
			tokenizer/word_expansion.c\
			tokenizer/word_expansion_quotize.c\
			built_in/env.c\
			built_in/export.c\
			built_in/key_compare.c\
			built_in/set_env.c\
			built_in/check_key.c\
			built_in/delete_content.c\
			built_in/echo.c\
			built_in/exit.c\
			built_in/exit_wrapper.c\
			built_in/cd.c\
			built_in/ft_atoll.c\
			built_in/ft_split_first.c\
			built_in/unset.c\
			built_in/pwd.c\
			built_in/find_question.c\
			signal/handle_signal.c\
			get_next_line.c
SRC_DIR	=	src
SRC		:=	$(SRC:%=$(SRC_DIR)/%)
OBJ		=	$(SRC:%.c=%.o)

INCL	=	minishell.h\
			doubly_linked_list.h\
			libft.h\
			cmd.h\
			parser/parser.h\
			parser/token.h\
			parser/token_recognition.h
INCL_DIR=	-I./include
ifeq ($(shell uname), Darwin)
INCL_DIR+=	-I/Users/$(USER)/.brew/Cellar/readline/8.1.2/include
endif

LIB_ADD	=	-L. -L/Users/$(USER)/.brew/Cellar/readline/8.1.2/lib
LIBTARGET=	all

# NOTE: library order (-ldlinkedlist and -lft) can be problem
DLLIST	=	libdlinkedlist.a
DLLIST_DIR=	doubly_linked_list
LIB_ADD	+=	-ldlinkedlist
LIBS	+=	DLLIST.lib

LIBFT	=	libft.a
LIBFT_DIR=	libft
LIB_ADD	+=	-lft
LIBS	+=	LIBFT.lib

ifeq ($(DEBUG_FLAG), 1)
CFLAGS	+=	$(DEBUG)
LIBFLAGS= DEBUG_FLAG=1
endif


libs: $(LIBS)
	$(MAKE) $(NAME)

all: $(NAME)

debug: DEBUG.flag
	$(MAKE) DEBUG_FLAG=1 libs
	touch DEBUG.flag

DEBUG.flag:
	$(MAKE) clean

$(LIBS): %.lib:
	$(MAKE) -C $($*_DIR) $(LIBFLAGS) all
	@cp -p $($*_DIR)/$($*) .

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) -lreadline $(LIB_ADD)

$(OBJ): %.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< $(INCL_DIR) 

clean:
	$(RM) $(OBJ)
	$(RM) DEBUG.flag

fclean: clean $(LIBS:%=%.clean)
	$(RM) $($(LIBS:%.lib=%))
	$(RM) $(NAME)
	$(RM) DEBUG.flag

$(LIBS:%=%.clean): %.lib.clean:
	$(RM) $($*)
	@$(MAKE) -C $($*_DIR) fclean
	$(RM) $*.lib

re: fclean
	$(MAKE) libs

.PHONY: all clean fclean re libs
