runner = $(shell whoami)
MAKEFLAGS += --no-print-directory
.DEFAULT_GOAL=all

.PHONY: clean all \
	gtest gtest_install gtest_clean \
	fmt fmt_install fmt_clean \
	libmodbus libmodbus_install libmodbus_clean

all: gtest fmt libmodbus

install: check_runner \
	gtest_install \
	fmt_install \
	libmodbus_install

clean: \
	gtest_clean \
	fmt_clean \
	libmodbus_clean

check_runner: # check if make is executed by root user
ifneq ($(runner), root)
	$(error Some submodules require other module installation. Please, run make as root [now: $(runner)].)
else
	@echo 'Running as root. OK'
endif

# Gtest -----------------------------------

GTEST_DIR=gtest/
GTEST_BUILD_DIR=gtest/build/

gtest: gtest_clean
	@echo Build gtest
	@cmake -S ./$(GTEST_DIR) -B ./$(GTEST_BUILD_DIR) -DBUILD_SHARED_LIBS=ON -DINSTALL_GTEST=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr
	@cmake --build ./$(GTEST_BUILD_DIR)

gtest_install: check_runner
	@echo Install gtest
	@cmake --install ./$(GTEST_BUILD_DIR)

gtest_clean:
	@echo Clean gtest
	@rm -rf ./$(GTEST_BUILD_DIR)

# fmt -------------------------------------

FMT_DIR=fmt/
FMT_BUILD_DIR=fmt/build/

fmt: fmt_clean
	@echo Build fmt
	@cmake -S ./$(FMT_DIR) -B ./$(FMT_BUILD_DIR)
	@cmake --build ./$(FMT_BUILD_DIR)

fmt_install: check_runner
	@echo Install fmt
	@cmake --install ./$(FMT_BUILD_DIR)

fmt_clean:
	@echo Clean fmt
	@rm -rf ./$(FMT_BUILD_DIR)

# MODBUS ---------------------------------

libmodbus: libmodbus_clean
	@echo Build libmodbus
	@mkdir -p ./libmodbus/build
	@cd libmodbus; ./autogen.sh;
	@cd libmodbus; ./configure --prefix=`pwd`/build;
	@$(MAKE) -C ./libmodbus/
	@$(MAKE) -C ./libmodbus/ install

libmodbus_install: check_runner
	@echo Install libmodbus
	@cp -r ./libmodbus/build/* /usr/local/

libmodbus_clean:
	@echo Clean libmodbus
	@rm -rf ./libmodbus/build
