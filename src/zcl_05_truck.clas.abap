CLASS zcl_05_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons  TYPE i          READ-ONLY.
    DATA is_transformed TYPE c LENGTH 1 READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS transform.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ).
    string &&= |, Cargo capacity: { cargo_in_tons }t|.
  ENDMETHOD.

  METHOD transform.
    IF is_transformed = 'X'. " IF is_transformed = abap_true.
      is_transformed = ''. " is_transformed = abap_false.
    ELSE.
      is_transformed = 'X'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
