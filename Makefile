# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2025/02/17 21:15:36 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose --project-directory ./srcs up --build

clean:
	docker compose --project-directory ./srcs down

fclean:
	docker compose --project-directory ./srcs down --volumes --rmi all

ps:
	docker compose --project-directory ./srcs ps

logs:
	docker compose --project-directory ./srcs logs

re: fclean all

.PHONY: all clean fclean re ps logs
