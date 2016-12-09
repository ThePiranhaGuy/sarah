FILES = main.vala

all: sarahLib sarahApp sarahPlugins 


sarahApp:
	valac  -o sarah  $(FILES)  --vapidir ./bin --pkg libpeas-1.0  --pkg sarah  -X -I. -X -L./bin -X  -lsarah -d ./bin


sarahLib:
	valac -o libsarah.so --library=sarah -H sarah.h  --gir=Sarah-1.0.gir -X -shared -X  -fPIC  --pkg libpeas-1.0  --pkg gmodule-2.0  sarah.vala  -d ./bin
	g-ir-compiler --shared-library=libsarah.so ./bin/Sarah-1.0.gir -o ./bin/Sarah-1.0.typelib



sarahPlugins:
	valac -o libhello.so --library=hello  ./plugins/vala-extension.vala  -X -shared -X -fPIC   --vapidir ./bin --pkg sarah  --pkg libpeas-1.0  -X -I. -X -L./bin -X -lsarah -d ./bin/plugins
	

clean:
	rm -rf *.vapi *.h *.so sarah
	
install:
	cp ./plugins/*.py	  ./bin/plugins 
	cp ./plugins/*.plugin ./bin/plugins 
	cd ./bin
	export LD_LIBRARY_PATH=.
	export GI_TYPELIB_PATH=.