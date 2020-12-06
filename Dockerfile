FROM ruby:2.7

ENV app /app

WORKDIR $app
COPY Gemfile $app/Gemfile
COPY Gemfile.lock $app/Gemfile.lock
RUN bundle install
COPY . $app

ENTRYPOINT ["ruby", "src/start.rb"]
