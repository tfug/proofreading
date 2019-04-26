build-image:
	docker build --no-cache -t proofreading .

run-check:
	docker run \
  -it \
  --rm \
  -v $(PWD)/..:/usr/local/documents \
  proofreading \
  /bin/ash proofreading/proofreading.sh

clear-output:
	rm -rf proofreading/output
