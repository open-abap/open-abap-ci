CLASS cl_ci_query_attributes DEFINITION PUBLIC.
  PUBLIC SECTION.

    CLASS-METHODS generic
      IMPORTING
        p_name         TYPE char30
        p_title        TYPE c
        p_attributes   TYPE sci_atttab
        p_message      TYPE c OPTIONAL
        p_display      TYPE flag
      RETURNING
        VALUE(p_break) TYPE abap_bool.
ENDCLASS.

CLASS cl_ci_query_attributes IMPLEMENTATION.
  METHOD generic.
    RETURN. " todo, implement method
  ENDMETHOD.

ENDCLASS.