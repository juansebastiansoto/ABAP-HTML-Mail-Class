# ABAP-HTML Mail Class
Class to send mail in HTML format

## How to use it:

### 1.- Create the instance with `CONSTRUCTOR`

_Create the instance to send the mail_

#### INPUT
* `EX_SENDER`: Mail address sender
* `EX_SUBJECT`: Mail Subject
* `EX_BODY`: Body (HTML Content)
* `EX_OBJ_TP`: Attachment Type
* `EX_ATTACH_HEX`: Attachments in SOLIX Table format [Optional]

#### OUTPUT
* `ZCL_MAIL_HTML` object instance

### 2.- Add an attachment with `ADD_ATTACHMENT` [Optional]

_Add an attachment to the mail_

#### INPUT
* `IM_TYPE`: Attachment Type
* `IM_SUBJECT`: Attachment Description
* `IM_CONTENT`: Attachment content in raw from
* `IM_ATTACHMENT_HEADER`: Attachment header name
* `IM_ATTACHMENT_SIZE`: Attachment size. Use when send raw format

### 3.- Add mail destination

#### `ADD_DESTINATION` Method 

_Add an e-mail address as destination_

#### INPUT 
* `EX_RECIPIENT`: E-mail destination address
* `EX_COPY`: Set as copy
* `EX_BLIND_COPY`: Set as blind copy

#### `ADD_DESTINATION_MAILLIST` Method

_Add a mail list as destination_

#### INPUT 
* `PV_DLINAME`: Distribution mail list name

### 3.- Send the e-mail with the `SEND` method

_Send the e-mail_

## Optional methods

### `GET_DESTINATIONS`

_Get the destinatation list_

#### OUTPUT
* `IM_RECIPIENTS`: Destinatation list

### `CONVER_OTF_SOLIX_TAB`

_Convert an OTF table (Forms) to `SOLIX_TAB` to attach this_

#### INPUT 
* `IM_OTF`: OTF Content

#### OUTPUT
* `EX_SOLIX_TAB`: SOLIX_TAB Filled
* `EX_SIZE`: Binary Size

### `GET_IMAGES`

_Get images from the SAP Mime Repository_

#### INPUT 
* `IM_ENTRY`: Image list

ZBCTT0001 Content:

* ZZALIAS = File name in HTML code

* ZZURL = Url in the SAP Mime Repository

#### OUTPUT
* `RE_IMAGES`: Table ready to attach file with `ADD_ATTACHMENT` method