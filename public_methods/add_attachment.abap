**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD add_attachment.

  TRY.
      CALL METHOD o_document->add_attachment
        EXPORTING
          i_attachment_type    = im_type
          i_attachment_subject = im_subject
          i_att_content_hex    = im_content
          i_attachment_header  = im_attachment_header       "OP0001
          i_attachment_size    = im_attachment_size.
    CATCH cx_document_bcs.

  ENDTRY.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
