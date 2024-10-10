KOTLINC		?=	/Applications/IntelliJ\ IDEA.app/Contents/plugins/Kotlin/kotlinc/bin/kotlinc
SRCS		= 	Main.kt
CLASSES		=	jakarta.validation-api-3.1.0.jar
OUTPUT		=	./build/
TARGET_JVM	=	17
DUMP 		= 	dump
.PHONY: all clean disasm

all: $(OUTPUT) disasm

$(OUTPUT): 
	$(KOTLINC) -cp $(CLASSES) -d $(OUTPUT) -jvm-target $(TARGET_JVM) -include-runtime $(SRCS)

disasm: $(OUTPUT)
	rm -f $(DUMP)
	find $(OUTPUT) -name "*.class" -exec javap -v -p -l {} >> $(DUMP) \;
clean:
	rm -rf $(OUTPUT)
	rm -f $(DUMP)