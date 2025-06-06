build:
	docker build -t my-haproxy .

test:
	docker run -it --rm --network cluster_default --name haproxy-syntax-check -v $(PWD)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg my-haproxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg

run:
	docker run -d --name my-running-haproxy --network cluster_default -p 7777:7777 -v $(PWD)/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg  --sysctl net.ipv4.ip_unprivileged_port_start=0 my-haproxy


shell:
	docker run \
	-it \
	--rm \
	--network cluster_default \
	--name haproxy-shell \
	my-haproxy /bin/bash

logs:
	docker logs -f my-running-haproxy