CLASS zcl_05_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
  interfaces zif_05_parnter.
    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z00_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_00_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_00_cargo_plane.
ENDCLASS.


CLASS zcl_05_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF     airplane IS INSTANCE OF zcl_00_cargo_plane
         AND airplane->get_total_weight_in_tons( )  > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_05_parnter~to_string.
  string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
