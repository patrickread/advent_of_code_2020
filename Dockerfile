FROM ruby:2.7
COPY . /app
ENTRYPOINT ["ruby", "app/src/start.rb"]
