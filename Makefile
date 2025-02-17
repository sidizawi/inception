# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sidzawi <sidzawi@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 22:00:31 by sidzawi           #+#    #+#              #
#    Updated: 2025/02/17 01:34:41 by sidzawi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	chmod -R 777 ~/data
	docker compose --project-directory ./srcs up --build

clean:
	docker compose --project-directory ./srcs down

fclean:
	docker compose --project-directory ./srcs down --volumes --rmi all

# todo: add clear network, and clear volumes

ps:
	docker compose --project-directory ./srcs ps

data:
	rm -rf ./srcs/.data

prune:
	docker system prune -a

logs:
	docker compose --project-directory ./srcs logs

re: fclean all

.PHONY: all clean fclean re ps logs