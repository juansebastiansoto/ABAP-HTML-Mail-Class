**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD add_destination_maillist.

  DATA: ol_distributionlist_bcs TYPE REF TO cl_distributionlist_bcs.

  ol_distributionlist_bcs = cl_distributionlist_bcs=>getu_persistent(
          i_dliname = pv_dliname
          i_private = abap_false ).

  CALL METHOD o_send_request->add_recipient
    EXPORTING
      i_recipient = ol_distributionlist_bcs
      i_copy      = abap_true.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
