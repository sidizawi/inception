# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2024/12/26 23:03:05 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose up

clean:
	docker compose down

re: all clean

.PHONY: all clean re