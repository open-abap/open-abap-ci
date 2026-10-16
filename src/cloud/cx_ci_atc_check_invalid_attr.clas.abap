CLASS cx_ci_atc_check_invalid_attr DEFINITION PUBLIC INHERITING FROM cx_dynamic_check FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_t100_message.

    METHODS constructor
      IMPORTING
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous LIKE previous OPTIONAL.
ENDCLASS.

CLASS cx_ci_atc_check_invalid_attr IMPLEMENTATION.
  METHOD constructor.
    super->constructor( previous = previous ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
