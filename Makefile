all:
	docker build -t viktorstanchev/pdns-geoip-example .

push: all
	docker push viktorstanchev/pdns-geoip-example

.PHONY: all push
