
KAFKA_DIR := kafka_2.11-2.1.0

.PHONY: install
install: .deps .deps/$(KAFKA_DIR)

.deps:
	mkdir -p .deps

.deps/$(KAFKA_DIR): .deps
	cd .deps && \
	wget https://www-us.apache.org/dist/kafka/2.1.0/$(KAFKA_DIR).tgz && \
	tar -zxf $(KAFKA_DIR).tgz && \
        rm $(KAFKA_DIR).tgz

