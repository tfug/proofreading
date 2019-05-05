build-image:
	docker build --no-cache -t tfug/proofreading .

run-check:
	docker run \
  -it \
  --rm \
  -v $(PWD)/..:/usr/local/documents \
  tfug/proofreading \
  /bin/ash proofreading/proofreading.sh

clear-output:
	rm -r output
