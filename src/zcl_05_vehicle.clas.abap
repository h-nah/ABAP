CLASS zcl_05_vehicle DEFINITION
  PUBLIC ABSTRACT
*Abstrake Klassen können nicht instanziert werden (SInd nur zur VErerbung von attributen zuständig)
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.
    METHODS accelerate IMPORTING !value TYPE i
                       RAISING   zcx_00_value_too_high.

    METHODS brake FINAL IMPORTING !value TYPE i  "FINAL ist einSchlüsselwort, welches Methodes nicht mehr bearebtiebar macht
                  RAISING   zcx_00_value_too_high.

*Abstrake Klassen können nicht instanziert werden (SInd nur zur VErerbung von attributen zuständig)
*Jedes hat diese Methode, wie sie implemeniter wird, wird von der Unterklasse entschieden
*Jede Unterklasse muss abstrakte Methoden implementieren

    METHODS to_string RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_05_vehicle IMPLEMENTATION.
  METHOD accelerate.
    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_00_value_too_high( value = value ).
    ENDIF.

    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_00_value_too_high( value = value ).
    ENDIF.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h)|.
  ENDMETHOD.
ENDCLASS.
