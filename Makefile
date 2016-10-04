#
# Install asciidoc with:
#  brew install asciidoc
#  sudo easy_install Pygments
#

iconsdir := $(shell brew list asciidoc | grep /etc/asciidoc | head -n1 | egrep -o '.*/etc/asciidoc')/images/icons

default:
	asciidoc \
		-b html5 \
		-a theme=flask \
		-a toc2 \
		-a data-uri \
		-a docinfo \
		-a icons \
		-a pygments \
		-a iconsdir=$(iconsdir) \
		-o index.html \
		rpc-spec.asciidoc

pdf:
	a2x --fop \
		-a toc \
		-a data-uri \
		-a docinfo \
		-a icons \
		-a pygments \
		-a iconsdir=$(iconsdir) \
		-a pygments \
		-o thrift-rpc-missing-specification.pdf \
		--no-xmllint \
		rpc-spec.asciidoc

all: default pdf

clean:
	rm -f index.html *.png

publish: default pdf
	./publish.sh
