FROM ruby:2.7.1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y --no-install-recommends nodejs yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /web
WORKDIR /web
COPY Gemfile /web/Gemfile
COPY Gemfile.lock /web/Gemfile.lock
RUN bundle install
RUN yarn install
RUN yarn upgrade

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
