**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD constructor.

  DATA: vl_mailtext    TYPE solix_tab,
        vl_xbody       TYPE xstring,
        vl_xlength     TYPE so_obj_len,
        vl_subject     TYPE string.

  DATA: ol_sender_id   TYPE REF TO if_sender_bcs.

  TRY.

      CALL METHOD cl_bcs=>create_persistent
        RECEIVING
          result = o_send_request.

    CATCH cx_send_req_bcs.
      RAISE er_persistent.
  ENDTRY.

  CALL METHOD me->convert_body
    EXPORTING
      ex_body    = ex_body
    IMPORTING
      im_xbody   = vl_xbody
      im_xlength = vl_xlength.

  vl_mailtext = cl_document_bcs=>xstring_to_solix( vl_xbody ).

  TRY.
      CALL METHOD cl_document_bcs=>create_document
        EXPORTING
          i_type    = ex_obj_tp
          i_subject = ex_subject
          i_length  = vl_xlength
          i_hex     = vl_mailtext
        RECEIVING
          result    = o_document.

    CATCH cx_document_bcs.
      RAISE er_document.
  ENDTRY.

  IF ex_attach_hex IS NOT INITIAL.

    TRY.
        CALL METHOD o_document->add_attachment
          EXPORTING
            i_attachment_type    = 'PDF'
            i_attachment_subject = 'PDF attachment'
            i_att_content_hex    = ex_attach_hex.

      CATCH cx_document_bcs .
        RAISE er_attachment.
    ENDTRY.

  ENDIF.

  TRY.

      CALL METHOD o_send_request->set_document
        EXPORTING
          i_document = o_document.

    CATCH cx_send_req_bcs.
      RAISE er_set_document.
  ENDTRY.

  TRY.

      CALL METHOD cl_cam_address_bcs=>create_internet_address
        EXPORTING
          i_address_string = ex_sender
        RECEIVING
          result           = ol_sender_id.

    CATCH cx_address_bcs.
      RAISE er_create_address.
  ENDTRY.

  TRY.

      CALL METHOD o_send_request->set_sender
        EXPORTING
          i_sender = ol_sender_id.

    CATCH cx_send_req_bcs.
      RAISE er_set_sender.
  ENDTRY.

  vl_subject = ex_subject.

  TRY.

      CALL METHOD o_send_request->set_message_subject
        EXPORTING
          ip_subject = vl_subject.

    CATCH cx_send_req_bcs .
      RAISE er_set_subject.
  ENDTRY.

  TRY.

      CALL METHOD o_send_request->set_status_attributes
        EXPORTING
          i_requested_status = 'E'
          i_status_mail      = 'E'.

    CATCH cx_send_req_bcs .
      RAISE er_set_attributes.
  ENDTRY.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
