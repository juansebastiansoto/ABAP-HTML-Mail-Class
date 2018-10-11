**************************************************************************
*   Class attributes.                                                    *
**************************************************************************
Instantiation: Public
Message class:
State: Implemented
Final Indicator: X
R/3 Release: 700

**************************************************************************
*   Public section of class.                                             *
**************************************************************************
class ZCL_MAIL_HTML definition
  public
  final
  create public .

*"* public components of class ZCL_MAIL_HTML
*"* do not include other source files here!!
public section.
  type-pools ABAP .

  methods ADD_ATTACHMENT
    importing
      IM_TYPE type SOODK-OBJTP
      IM_SUBJECT type SOOD-OBJDES
      IM_CONTENT type SOLIX_TAB
      IM_ATTACHMENT_HEADER type SOLI_TAB optional
      IM_ATTACHMENT_SIZE type SOOD-OBJLEN optional .
  methods ADD_DESTINATION
    importing
      EX_RECIPIENT type AD_SMTPADR
      EX_COPY type OS_BOOLEAN default ''
      EX_BLIND_COPY type OS_BOOLEAN default ''
    exceptions
      ER_CREATE_ADDRESS
      ER_RECIPIENT .
  methods ADD_DESTINATION_MAILLIST
    importing
      PV_DLINAME type SO_DLI_NAM
    raising
      CX_ADDRESS_BCS .
  methods CONSTRUCTOR
    importing
      EX_SENDER type AD_SMTPADR
      EX_SUBJECT type SO_OBJ_DES
      EX_BODY type STRING
      EX_OBJ_TP type SO_OBJ_TP
      EX_ATTACH_HEX type SOLIX_TAB optional
    exceptions
      ER_PERSISTENT
      ER_DOCUMENT
      ER_SET_DOCUMENT
      ER_CREATE_ADDRESS
      ER_SET_SENDER
      ER_SET_SUBJECT
      ER_SET_ATTRIBUTES
      ER_ATTACHMENT .
  class-methods CONVER_OTF_SOLIX_TAB
    importing
      IM_OTF type TSFOTF
    exporting
      EX_SOLIX_TAB type SOLIX_TAB
      EX_SIZE type INT4 .
  methods GET_DESTINATIONS
    returning
      value(IM_RECIPIENTS) type BCSY_RE
    exceptions
      ER_RECIPIENT_ERR .
  class-methods GET_IMAGES
    importing
      IM_ENTRY type ZBCTT0001
    returning
      value(RE_IMAGES) type ZBCTT0002 .
  methods SEND
    exceptions
      ER_SENDING
      ER_IMMEDIATELY .

**************************************************************************
*   Private section of class.                                            *
**************************************************************************
*"* private components of class ZCL_MAIL_HTML
*"* do not include other source files here!!
private section.

  methods CONVERT_BODY
    importing
      EX_BODY type STRING
    exporting
      IM_XBODY type XSTRING
      IM_XLENGTH type SO_OBJ_LEN
    exceptions
      ER_CONV_XSTRING .

**************************************************************************
*   Protected section of class.                                          *
**************************************************************************
*"* protected components of class ZCL_MAIL_HTML
*"* do not include other source files here!!
protected section.

  data O_SEND_REQUEST type ref to CL_BCS .
  data O_DOCUMENT type ref to CL_DOCUMENT_BCS .

**************************************************************************
*   Types section of class.                                              *
**************************************************************************
*"* dummy include to reduce generation dependencies between
*"* class ZCL_MAIL_HTML and it's users.
*"* touched if any type reference has been changed

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2018. Sap Release 700
