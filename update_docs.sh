DOC_OUT="${PWD}/docs"

if [ ! -d "$DOC_OUT" ]; then
  mkdirp "$DOC_OUT"
elif [ "$(ls -A /"$DOC_OUT")" ]; then
  echo "Removing old docs..."
  rimraf "${DOC_OUT}/*"
fi

echo "Generating docs..."
protoc \
  --doc_out="${DOC_OUT}" \
  --doc_opt=html,index.html \
  packages/**/*.proto