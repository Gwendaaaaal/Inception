NAME = ex00

SOURCES = main.cpp Bureaucrat.cpp

OBJ_DIR = obj

OBJECT = $(SOURCES:%.cpp=%.o)

OBJECTS = $(addprefix $(OBJ_DIR)/, $(OBJECT))

CC = c++

CFLAGS = -Wall -Werror -Wextra -std=c++98

RMFLAGS = -rf

.PHONY: all clean fclean re

all : $(OBJ_DIR) $(NAME)

$(NAME) : $(OBJECTS) 
	$(CC) $(CFLAGS) $^ -o $@ 

$(OBJ_DIR)/%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR) :
	mkdir $(OBJ_DIR)

clean :
	rm $(RMFLAGS) $(OBJECTS)

fclean : clean
	rm $(RMFLAGS) $(NAME)

re : fclean all


