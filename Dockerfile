FROM ruby:2.7
COPY . .
ENTRYPOINT ["ruby", "src/start.rb"]
