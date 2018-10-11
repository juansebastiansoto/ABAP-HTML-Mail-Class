**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD conver_otf_solix_tab.

  DATA: lt_dummy   TYPE STANDARD TABLE OF tline,
        lv_xstring TYPE xstring.

  CALL FUNCTION 'CONVERT_OTF'
    EXPORTING
      format        = 'PDF'
      max_linewidth = 132
    IMPORTING
      bin_filesize  = ex_size
      bin_file      = lv_xstring
    TABLES
      otf           = im_otf
      lines         = lt_dummy.

  ex_solix_tab = cl_bcs_convert=>xstring_to_solix( lv_xstring ).

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
