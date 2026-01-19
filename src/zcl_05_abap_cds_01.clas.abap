
CLASS zcl_05_abap_cds_01 DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CLASS-METHODS: main.
ENDCLASS.

CLASS zcl_05_abap_cds_01 IMPLEMENTATION.

  METHOD main.

    DATA: lv_carrier TYPE /dmo/carrier_id,
          lv_connection TYPE /dmo/connection_id,
          lt_bookings TYPE TABLE OF /dmo/c_booking_approver_m.

    " Parameter vom Benutzer erfragen
    lv_carrier = 'LH'.
    lv_connection = '0400'.

    " CDS-View lesen
    SELECT * FROM /dmo/c_booking_approver_m
      WHERE carrierid = @lv_carrier
        AND connectionid = @lv_connection
      INTO TABLE @lt_bookings.

    " Ausgabe
 "   cl_demo_output=>display( lt_bookings ).

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
"   cl_demo_output=>display( lt_bookings ).
  ENDMETHOD.

ENDCLASS.
