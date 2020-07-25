docs_generate:
	sh update_docs.sh

docs_serve:
	echo "Serving docs..."
	concurrently \
		"http-server ./docs -r -s -p 8080" \
		"open-cli http://localhost:8080/"

format:
	prototool format -f -w

lint:
	prototool lint