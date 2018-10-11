**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD send.

  DATA: vl_result TYPE os_boolean.

  TRY.

      CALL METHOD o_send_request->set_send_immediately
        EXPORTING
          i_send_immediately = abap_true.

    CATCH cx_send_req_bcs .
      RAISE er_immediately.
  ENDTRY.

  TRY.

      CALL METHOD o_send_request->send
        RECEIVING
          result = vl_result.

      COMMIT WORK AND WAIT.

    CATCH cx_send_req_bcs.
      RAISE er_sending.
  ENDTRY.

  IF vl_result = abap_true.
    CLEAR o_send_request.
  ELSE.
    RAISE er_sending.
  ENDIF.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
