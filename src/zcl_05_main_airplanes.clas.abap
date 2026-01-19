CLASS zcl_05_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_05_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA carrier   TYPE REF TO zcl_00_carrier.
    DATA airplane  TYPE REF TO zcl_00_airplane.
*    DATA airplanes TYPE TABLE OF REF TO zcl_00_airplane.

    " Instanziierungen
    out->write( zcl_00_airplane=>number_of_airplanes ).

    carrier = NEW #( 'Lufthansa' ).

    TRY.
        airplane = NEW zcl_00_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 800 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_00_cargo_plane( id                   = 'D-AJKF'
                                           plane_type           = 'Boeing 747-400F'
                                           empty_weight_in_tons = 166
                                           cargo_in_tons        = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_00_passenger_plane( id                   = 'D-AIND'
                                               plane_type           = 'Airbus A320-200'
                                               empty_weight_in_tons = 42
                                               number_of_seats      = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( zcl_00_airplane=>number_of_airplanes ).

    " Ausgabe
    LOOP AT carrier->airplanes INTO airplane.
      out->write(
          |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons }t, { airplane->get_total_weight_in_tons( ) }t| ).
    ENDLOOP.
    out->write( carrier->get_biggest_cargo_plane( ) ).
  ENDMETHOD.
ENDCLASS.
