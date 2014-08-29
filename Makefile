.PHONY: test style

all: test style

test:
	nosetests

style:
	find . -iname "*.py"|xargs flake8 --ignore=E501,E128,F401,F841,E302,E127,F811,F821,F403 --exclude=*pybitmessage*
