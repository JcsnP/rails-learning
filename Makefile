start:
	rails s

reset:
	rails db:drop db:create db:migrate db:seed

c:
	rails c
