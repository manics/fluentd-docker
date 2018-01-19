FROM fluent/fluentd:v1.0.2

RUN apk add --update --virtual .build-deps sudo build-base ruby-dev \
    && sudo gem install \
        fluent-plugin-rewrite-tag-filter \
        fluent-plugin-slack \
        fluent-plugin-elasticsearch \
    && sudo gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    /home/fluent/.gem/ruby/2.3.0/cache/*.gem
