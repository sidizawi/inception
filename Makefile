# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2025/02/22 17:32:44 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p ~/data/wordpress ~/data/mariadb
	chmod -R 777 ~/data
	docker compose --project-directory ./srcs up --build

clean:
	docker compose --project-directory ./srcs down

fclean:
	rm -rf ~/data
	docker compose --project-directory ./srcs down --volumes --rmi all

ps:
	docker compose --project-directory ./srcs ps

logs:
	docker compose --project-directory ./srcs logs

re: fclean all

.PHONY: all clean fclean re ps logs
