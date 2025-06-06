build:
	@docker-compose --build --force-recreate

run:
	@docker-compose up

tests_web:
	@docker-compose exec web bundle exec rails test

tests_api:
	@docker-compose exec api bundle exec rails test

quality_web:
	docker-compose exec web bundle exec rubocop

quality_api:
	@docker-compose exec api bundle exec rubocop