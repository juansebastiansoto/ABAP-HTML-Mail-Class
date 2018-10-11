**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD get_destinations.

  TRY.

      CALL METHOD o_send_request->recipients
        RECEIVING
          result = im_recipients.

    CATCH cx_send_req_bcs.
      RAISE er_recipient_err.
  ENDTRY.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
