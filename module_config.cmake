set( TARGET_NAME app )

list(APPEND MODULE_DEPS
    -pthread
    -lfmt
    -ldl
    -lmodbus
    )


set( MAJOR 0 )
set( MINOR 1 )
set( PATCH 0 )
