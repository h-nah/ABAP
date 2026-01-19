CLASS zcl_05_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_in_tons
      RETURNING VALUE(total_weight_in_tons) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_05_airplane IMPLEMENTATION.
  METHOD constructor.
    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'ID' ).
    ENDIF.
    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'PLANE_TYPE' ).
    ENDIF.
    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'EMPTY_WEIGHT_IN_TONS' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * '1.1'.
  ENDMETHOD.
ENDCLASS.
