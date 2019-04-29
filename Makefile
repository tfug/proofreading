build-image:
	docker build --no-cache -t chie8842/tensorflow_docs_proofreading .

run-check:
	docker run \
  -it \
  --rm \
  -v $(PWD)/..:/usr/local/documents \
  chie8842/tensorflow_docs_proofreading \
  /bin/ash proofreading/proofreading.sh

clear-output:
	rm -rf proofreading/output
