all: help

help:
	-@echo "serve     run a server on localhost"
	-@echo "deploy    upload to the cloud"

deploy:
	test -f .gaepass && cat .gaepass || cat ~/.gaepass | appcfg.py -e "$(MAIL)" --passin update .

serve: .tmp/blobstore
	dev_appserver.py --enable_sendmail --blobstore_path=.tmp/blobstore --datastore_path=.tmp/datastore --host 0.0.0.0 .

.tmp/blobstore:
	mkdir -p .tmp/blobstore
