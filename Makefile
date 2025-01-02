# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2025/01/02 22:50:10 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --project-directory ./srcs up --build

clean:
	docker compose --project-directory ./srcs down

fclean:
	docker compose --project-directory ./srcs down --volumes --rmi all

# todo: add clear network, and clear volumes

ps:
	docker compose --project-directory ./srcs ps

logs:
	docker compose --project-directory ./srcs logs

re: fclean all

.PHONY: all clean fclean re ps logs