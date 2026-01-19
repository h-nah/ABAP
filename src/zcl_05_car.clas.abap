CLASS zcl_05_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string
                seats TYPE i.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->seats = seats.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h, { seats } Sitzplätze)|.
  ENDMETHOD.
ENDCLASS.
