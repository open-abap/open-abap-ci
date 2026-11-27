CLASS cl_ci_test_abap_comp_procs DEFINITION PUBLIC INHERITING FROM cl_ci_test_root CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES t_comments TYPE string_table.

    TYPES: BEGIN OF t_token,
             str  TYPE string,
             row  TYPE i,
             col  TYPE i,
             type TYPE c LENGTH 1,
           END OF t_token.
    TYPES t_tokens TYPE STANDARD TABLE OF t_token WITH DEFAULT KEY.

    TYPES: BEGIN OF t_proc_id,
             program TYPE c LENGTH 40,
             type    TYPE c LENGTH 4,
             name    TYPE string,
           END OF t_proc_id.

    TYPES: BEGIN OF t_stmt,
             keyword  TYPE string,
             tokens   TYPE t_tokens,
             comments TYPE t_comments,
             include  TYPE c LENGTH 40,
             line     TYPE i,
             column   TYPE i,
           END OF t_stmt.
    TYPES t_stmts TYPE STANDARD TABLE OF t_stmt WITH DEFAULT KEY.

    TYPES: BEGIN OF t_proc_entry,
             proc_id TYPE t_proc_id,
             stmts   TYPE t_stmts,
           END OF t_proc_entry.

    TYPES: BEGIN OF t_stack_entry,
             stmt         TYPE t_stmt,
             stmt_proc_id TYPE t_proc_id,
           END OF t_stack_entry.
    TYPES t_stack TYPE STANDARD TABLE OF t_stack_entry WITH DEFAULT KEY.

    TYPES: BEGIN OF t_collect,
             stack TYPE t_stack,
           END OF t_collect.

    TYPES: BEGIN OF t_info,
             program  TYPE c LENGTH 40,
             include  TYPE c LENGTH 40,
             line     TYPE i,
             column   TYPE int2,
             kind     TYPE sci_errc,
             comments TYPE t_comments,
             stack    TYPE t_stack,
             info1    TYPE string,
             info2    TYPE string,
             info3    TYPE string,
             info4    TYPE string,
           END OF t_info.
    TYPES t_infos TYPE STANDARD TABLE OF t_info WITH DEFAULT KEY.

    DATA no_suppress TYPE abap_bool.

  PROTECTED SECTION.
    DATA infos TYPE t_infos.
    DATA ref_check TYPE REF TO cl_abap_comp_procs.

    METHODS analyze_start
      IMPORTING
        p_ref_check TYPE REF TO cl_abap_comp_procs.

    METHODS analyze_proc
      IMPORTING
        p_proc    TYPE t_proc_entry
        p_collect TYPE t_collect.

    METHODS add_info
      IMPORTING
        p_kind  TYPE sci_errc
        p_stmt  TYPE t_stmt
        p_proc  TYPE t_proc_entry
        p_stack TYPE t_stack
        p_info1 TYPE csequence OPTIONAL
        p_info2 TYPE csequence OPTIONAL
        p_info3 TYPE csequence OPTIONAL
        p_info4 TYPE csequence OPTIONAL.

    METHODS is_testing_method
      IMPORTING
        p_proc_id       TYPE t_proc_id
      RETURNING
        VALUE(p_result) TYPE abap_bool.

  PRIVATE SECTION.
ENDCLASS.

CLASS cl_ci_test_abap_comp_procs IMPLEMENTATION.

  METHOD analyze_start.
    RETURN. " todo, implement method
  ENDMETHOD.

  METHOD analyze_proc.
    RETURN. " redefined in subclasses
  ENDMETHOD.

  METHOD add_info.
    DATA ls_info LIKE LINE OF infos.

    ls_info-program  = p_proc-proc_id-program.
    ls_info-include  = p_stmt-include.
    ls_info-line     = p_stmt-line.
    ls_info-column   = p_stmt-column.
    ls_info-kind     = p_kind.
    ls_info-comments = p_stmt-comments.
    ls_info-stack    = p_stack.
    ls_info-info1    = p_info1.
    ls_info-info2    = p_info2.
    ls_info-info3    = p_info3.
    ls_info-info4    = p_info4.
    APPEND ls_info TO infos.
  ENDMETHOD.

  METHOD is_testing_method.
    RETURN. " todo, implement method
  ENDMETHOD.

ENDCLASS.
