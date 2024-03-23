NAME = build

all: $(NAME)

$(NAME):
		docker build -t nginx srcs/requirements/nginx/