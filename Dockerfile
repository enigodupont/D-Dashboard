FROM ruby:2.3-alpine3.7

COPY . /opt/D-Dashboard

RUN chmod +x /opt/D-Dashboard/bin/* \
    && apk add --no-cache nodejs build-base postgresql-dev sqlite-dev tzdata \
    && /opt/D-Dashboard/bin/setup

EXPOSE 3000

WORKDIR /opt/D-Dashboard

ENTRYPOINT [ "sh", "-c", "bin/rails s" ]
