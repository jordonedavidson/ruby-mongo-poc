FROM ruby:3.2.2

WORKDIR /usr/src/app

COPY Gemfile ./

RUN bundle install

COPY ./app .

# using rackup to start the app. 
## --host 0.0.0.0 is necessary to read from the host machine apparently.
## even though the port is set in the puma.rb config file it seems to be necessary here.
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]