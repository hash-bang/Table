#/usr/bin/make
DIST = Distro

.PHONY: all

all:

clean:
	rm -f table_*.deb
	rm -rf Distro/usr/share/table Distro/usr/bin Distro/usr/share/man

deb: clean man
	mkdir -p Distro/usr/share/table Distro/usr/bin
	cp -a table Distro/usr/share/table
	ln -s /usr/share/table/table Distro/usr/bin/table
	dpkg -b Distro table_0.9.deb

install: deb
	dpkg -i table_0.9.deb
	rm -f table_0.9.deb

man:
	mkdir -p Distro/usr/share/man 
	pod2man table Distro/usr/share/man/table.1
	gzip -f Distro/usr/share/man/table.1
