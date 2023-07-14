FROM ruby:2.7

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["ruby", "sess_lock_wait_collect.rb"]

