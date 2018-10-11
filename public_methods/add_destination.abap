**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD add_destination.

  DATA: ol_recipient  TYPE REF TO if_recipient_bcs.

  TRY.

      CALL METHOD cl_cam_address_bcs=>create_internet_address
        EXPORTING
          i_address_string = ex_recipient
        RECEIVING
          result           = ol_recipient.

    CATCH cx_address_bcs.
      RAISE er_create_address.
  ENDTRY.

  TRY.

      CALL METHOD o_send_request->add_recipient
        EXPORTING
          i_recipient  = ol_recipient
          i_express    = abap_true
          i_copy       = ex_copy
          i_blind_copy = ex_blind_copy.

    CATCH cx_send_req_bcs.
      RAISE er_recipient.
  ENDTRY.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
