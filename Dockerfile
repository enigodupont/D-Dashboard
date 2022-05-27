FROM ruby:2.7-alpine3.15

COPY . /opt/D-Dashboard

WORKDIR /opt/D-Dashboard

EXPOSE 3000

ENV RAILS_ENVIRONMENT development

RUN chmod +x /opt/D-Dashboard/bin/* \
    && apk add --no-cache nodejs build-base postgresql-dev sqlite-dev tzdata postgresql-dev\
    && gem install bundler --conservative -v 2.2.3 \
    && /opt/D-Dashboard/bin/bundle install \
    && /opt/D-Dashboard/bin/rake assets:precompile

ENTRYPOINT [ "sh", "-c", "/opt/D-Dashboard/entrypoint.sh" ]
