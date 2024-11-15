FROM docker.elastic.co/elasticsearch/elasticsearch:8.9.0

# Simple, single node deployment
ENV discovery.type=single-node
ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
ENV xpack.security.enabled=false
ENV xpack.security.http.ssl.enabled=false

EXPOSE 9200 9300

COPY setup-index.sh /tmp/setup-index.sh
COPY index-config.json /tmp/index-config.json

COPY setup-index.sh /usr/share/elasticsearch/setup-index.sh
COPY index-config.json /usr/share/elasticsearch/index-config.json

CMD ["sh", "-c", "/usr/local/bin/docker-entrypoint.sh & sleep 15 && sh /usr/share/elasticsearch/setup-index.sh && wait"]
