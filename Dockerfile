FROM ruby:3.1.1-alpine

RUN apk add --no-cache \
    build-base \
    mariadb-dev \
    nodejs \
    # yarn \
    tzdata \
    postgresql-dev \
    # git \
    # curl \
    # bash \
    && rm -rf /var/cache/apk/*

RUN gem install bundler

WORKDIR /app

# COPY . .
COPY . /app
COPY Gemfile Gemfile.lock ./

RUN bundle install
# RUN yarn install --production

# CMD ["node", "src/index.js"]
# CMD ["bundle", "exec", "rails", "server", "-b", "
CMD rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'

EXPOSE 3000