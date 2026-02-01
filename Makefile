# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nilsdruon <nilsdruon@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/15 14:28:47 by nildruon          #+#    #+#              #
#    Updated: 2026/01/26 21:46:36 by nilsdruon        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Werror -Wall -Wextra -Ilibft

CFILES = ft_printf.c hex_converter.c pointer_converter.c putnbr_u_int.c

OFILES = $(CFILES:.c=.o)


NAME = libftprintf.a 

HEADER = printf.h

LIBFT = libft
LIBFT_A = $(LIBFT)/libft.a
CREATE = ar rcs

REMOVE = rm -f


%.o: %.c  $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OFILES)
	@make -C $(LIBFT)
	@cp $(LIBFT_A) $(NAME)
	@ar rcs $(NAME) $(OFILES)

fclean: clean
	$(REMOVE) $(NAME)
	@make -C $(LIBFT) fclean

clean:
	$(REMOVE) $(OFILES)
	@make -C $(LIBFT) clean

re: fclean all

.PHONY: all clean fclean re