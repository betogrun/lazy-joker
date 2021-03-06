# LazyJoker

This application aims to display jokes fetched from the [jokeAPI](https://sv443.net/jokeapi/v2/), store them in the database and display them to the user in random order and without repetition.
The idea is to use a "lazy" approach and just retrieve and persist jokes from the API if all the stored jokes have already been displayed in a given session.

### Getting started

Follow the steps below to get a development environment running

Clone the project
```
git clone git@github.com:betogrun/lazy-joker.git && cd indexer
```

Create the database and run the migrations

```
docker-compose run --rm web bundle exec rails db:create
```

### Running
```
docker-compose up
```

## Running the tests
```
docker-compose run --rm web bundle exec rspec
```


