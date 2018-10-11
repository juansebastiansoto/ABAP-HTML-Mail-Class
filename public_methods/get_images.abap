**************************************************************************
*   Method attributes.                                                   *
**************************************************************************
Instantiation: Public
**************************************************************************

METHOD get_images.

  DATA: ol_mr_api  TYPE REF TO if_mr_api.

  DATA: wl_entry  TYPE LINE OF zbctt0001,
        wl_images TYPE LINE OF zbctt0002.

  DATA: vl_icono      TYPE xstring,
        vl_punto      TYPE i.

  ol_mr_api = cl_mime_repository_api=>if_mr_api~get_api( ).

  LOOP AT im_entry INTO wl_entry WHERE zzurl IS NOT INITIAL. " Recorro las entradas donde la URL haya sido cargada

    CLEAR wl_images.

    CALL METHOD ol_mr_api->get
      EXPORTING
        i_url              = wl_entry-zzurl
      IMPORTING
        e_content          = vl_icono
      EXCEPTIONS
        parameter_missing  = 1
        error_occured      = 2
        not_found          = 3
        permission_failure = 4
        OTHERS             = 5.

    CALL METHOD cl_bcs_convert=>xstring_to_solix
      EXPORTING
        iv_xstring = vl_icono
      RECEIVING
        et_solix   = wl_images-zzimage.

    wl_images-zzurl   = wl_entry-zzurl.
    wl_images-zzalias = wl_entry-zzalias.

    FIND FIRST OCCURRENCE OF '.' IN wl_images-zzurl MATCH OFFSET vl_punto.
    vl_punto = vl_punto + 1.
    wl_images-zzextension = wl_entry-zzurl+vl_punto(3).

    APPEND wl_images TO re_images.

  ENDLOOP.

ENDMETHOD.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
