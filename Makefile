
KAFKA_DIR := kafka_2.11-2.1.0
KAFKA_PATH := .deps/$(KAFKA_DIR)

.PHONY: build
install: .deps .deps/$(KAFKA_DIR)


.PHONY: start
start: build zookeeper kafka

.PHONY: zookeeper
zookeeper:
	$(KAFKA_PATH)/bin/zookeeper-server-start.sh $(KAFKA_PATH)/config/zookeeper.properties &

.PHONY: kafka
kafka:
	$(KAFKA_PATH)/bin/kafka-server-start.sh $(KAFKA_PATH)/config/server.properties &

.deps:
	mkdir -p .deps

.deps/$(KAFKA_DIR): .deps
	cd .deps && \
	wget https://www-us.apache.org/dist/kafka/2.1.0/$(KAFKA_DIR).tgz && \
	tar -zxf $(KAFKA_DIR).tgz && \
        rm $(KAFKA_DIR).tgz

