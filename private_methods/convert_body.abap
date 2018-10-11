**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Private
**************************************************************************

METHOD convert_body.

  DATA: vl_xlength TYPE i.

  CALL FUNCTION 'SCMS_STRING_TO_XSTRING'
    EXPORTING
      text   = ex_body
    IMPORTING
      buffer = im_xbody
    EXCEPTIONS
      failed = 1
      OTHERS = 2.

  IF sy-subrc <> 0.
    RAISE er_conv_xstring.
  ENDIF.

  vl_xlength = XSTRLEN( im_xbody ).
  im_xlength = vl_xlength.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
