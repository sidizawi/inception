# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2024/12/28 23:53:00 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --project-directory ./srcs up

clean:
	docker compose --project-directory ./srcs down

ps:
	docker compose --project-directory ./srcs ps

logs:
	docker compose --project-directory ./srcs logs

re: all clean

.PHONY: all clean re