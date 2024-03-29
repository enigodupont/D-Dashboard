FROM ruby:3.1.2-alpine

COPY . /opt/D-Dashboard

WORKDIR /opt/D-Dashboard

EXPOSE 3000

ENV RAILS_ENVIRONMENT development

RUN chmod +x /opt/D-Dashboard/bin/* \
    && apk add --no-cache nodejs build-base postgresql-dev sqlite-dev tzdata postgresql-dev yarn\
    && gem install bundler --conservative -v 2.3.7 \
    && /opt/D-Dashboard/bin/bundle install

ENTRYPOINT [ "sh", "-c", "/opt/D-Dashboard/entrypoint.sh" ]
