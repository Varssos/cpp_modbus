#include "app/app.hpp"
#include "config/config.hpp"
#include "device/device.hpp"
#include <iostream>
#include <fmt/core.h>
#include <modbus/modbus.h>

int main()
{
    std::cout << "Hello world" << std::endl;
    fmt::print("Hello, world!\n");

    modbus_t *iCtx{ nullptr };

    iCtx = modbus_new_rtu("/dev/ttyUSB0", 9600, 'N', 8, 1);
    
    modbus_set_slave( iCtx, 1 );
    modbus_set_debug( iCtx, true );
    modbus_set_error_recovery( iCtx, MODBUS_ERROR_RECOVERY_LINK );
    modbus_set_response_timeout( iCtx, 1, 50 );

    int size{1};
    uint16_t lReg[ size ];
    int lReadRegisterSize = modbus_read_registers( iCtx, 0x0130, size, lReg);
    if( lReadRegisterSize != size ){
        fmt::print("Failed to read. Error: {}.\n", modbus_strerror(errno));
    }else{
        double result{};
        result = lReg[0];
        result /= 100;
        fmt::print("Read value: {}Hz.\n", result);
    }

    modbus_close( iCtx );
    modbus_free( iCtx );

    
    return 0;
}
