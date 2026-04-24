CLASS cl_abap_comp_procs DEFINITION PUBLIC.
  PUBLIC SECTION.

    TYPES:
      BEGIN OF t_scan_result,
        subrc      TYPE sy-subrc,
        message    TYPE c LENGTH 200,
        line       TYPE i,
        word       TYPE c LENGTH 30,
        include    TYPE c LENGTH 40,
        tokens     TYPE stokesx_tab,
        statements TYPE sstmnt_tab,
        levels     TYPE slevel_tab,
        structures TYPE sstruc_tab,
      END OF t_scan_result.

ENDCLASS.

CLASS cl_abap_comp_procs IMPLEMENTATION.

ENDCLASS.