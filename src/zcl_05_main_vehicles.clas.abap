CLASS zcl_05_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_05_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen

    DATA vehicle  TYPE REF TO zcl_00_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.
    DATA truck    TYPE REF TO zcl_00_truck.

    " Instanziierungen
    out->write( zcl_00_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_00_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_00_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_00_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.

    out->write( zcl_00_vehicle=>number_of_vehicles ).

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 20 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_00_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_00_truck.
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                               THEN 'Der LKW hat sich in einen Autobot transformiert        '
                               ELSE 'Der Autobot hast sich wieder in einen LKW transformiert' ) }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
