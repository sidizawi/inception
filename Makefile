# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2024/12/28 23:40:02 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --project-directory ./srcs up

clean:
	docker compose --project-directory ./srcs down

re: all clean

.PHONY: all clean re