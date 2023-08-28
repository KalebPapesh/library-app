FROM ruby:2.7.8

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app

EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
