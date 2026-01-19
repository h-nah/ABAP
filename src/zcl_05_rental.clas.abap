CLASS zcl_05_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     interfaces zif_05_parnter.
     TYPES ty_vehicles type TABLE of REF to zcl_00_vehicle.

     data vehicles type ty_vehicles READ-ONLY.

     methods add_vehicle
      importing vehicle TYPE REF TO zcl_00_vehicle.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_rental IMPLEMENTATION.

  METHOD add_vehicle.
   APPEND vehicle to vehicles.
  ENDMETHOD.

  METHOD zif_05_parnter~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.
