#Include 'Protheus.ch'
#Include 'TBICONN.ch'

User Function fTelaCli()

Local oBtnInc := oButton1:= oButton2:= Nil
Local oCodigo,oGNome,oLoja,oSay1,oSay2,oSay4,oSLoja
Local ogCodigo,oGet1,oGet3
Local oGroup1, oGroup2
Local oRadMenu1

Local oFont1 := TFont():New("Arial Narrow",,018,,.F.,,,,,.F.,.F.)
Local oFontOb := TFont():New("Arial Narrow",,018,,.T.,,,,,.F.,.F.)

LOCAL cCodigo   := ""
LOCAL cLoja     := ""
LOCAL cNome     := ""
LOCAL cFantazia := ""
LOCAL cNPJ      := ""
LOCAL nBloq     := ""    

Static oDlg

If Select("SX2") = 0
	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA1' MODULO "FAT"
	lCon := .T.
EndIf	

cCodigo   := CriaVar("A1_COD"   ,.F.)
cLoja     := CriaVar("A1_LOJA"  ,.F.)
cNome     := CriaVar("A1_NOME"  ,.F.)
cFantazia := CriaVar("A1_NREDUZ",.F.)
cNPJ      := CriaVar("A1_CGC"   ,.F.)
nBloq     := 1

  DEFINE MSDIALOG oDlg TITLE "Cliente" FROM 000, 000  TO 250, 500 COLORS 0, 16777215 PIXEL

    @ 000, 001 GROUP oGroup1 TO 091, 247 OF oDlg COLOR 0, 16777215 PIXEL
	    
	    @ 007, 005 SAY   oCodigo PROMPT "Codigo:" SIZE 032, 014 OF oGroup1 FONT oFontOb COLORS 255, 16777215 PIXEL
	    @ 007, 031 MSGET ogCodigo VAR cCodigo    SIZE 038, 012 OF oGroup1 COLORS 0, 16777215 FONT oFont1 F3 "SB1" PIXEL
	    
	    @ 007, 073 SAY   oSLoja PROMPT "Loja:" SIZE 017, 010 OF oGroup1 FONT oFontOb COLORS 255, 16777215 PIXEL
	    @ 007, 091 MSGET oLoja  VAR cLoja      SIZE 020, 012 OF oGroup1 COLORS 0, 16777215 FONT oFont1 F3 "SB1" PIXEL
	   
	    @ 008, 121 SAY   oSay1 PROMPT "Nome:" SIZE 020, 010 OF oGroup1 FONT oFont1 COLORS 0, 16777215 PIXEL
	    @ 007, 143 MSGET oGNome VAR cNome    SIZE 098, 012 OF oGroup1 COLORS 0, 16777215 FONT oFont1 PIXEL
	    
	    @ 029, 005 SAY oSay2 PROMPT "Fantazia:" SIZE 032, 010 OF oGroup1 FONT oFont1 COLORS 0, 16777215 PIXEL
	    @ 027, 031 MSGET oGet1 VAR   cFantazia        SIZE 098, 012 OF oGroup1 COLORS 0, 16777215 FONT oFont1 PIXEL
	    
	    @ 046, 005 SAY oSay4 PROMPT "CNPJ:" SIZE 032, 010 OF oGroup1 FONT oFont1 COLORS 0, 16777215 PIXEL
	    @ 046, 031 MSGET oGet3 VAR cNPJ    SIZE 098, 010 OF oGroup1 COLORS 0, 16777215 FONT oFont1 PIXEL
	    
	    @ 026, 139 GROUP oGroup2 TO 066, 201 PROMPT "Bloqueado" OF oDlg COLOR 255, 16777215 PIXEL
	    @ 035, 150 RADIO oRadMenu1 VAR nBloq ITEMS "SIM","NAO" SIZE 037, 019 OF oGroup2 COLOR 0, 16777215 PIXEL

    @ 096, 012 BUTTON oBtnInc PROMPT "Incluir" SIZE 045, 020 OF oDlg FONT oFont1 PIXEL
    @ 096, 092 BUTTON oButton1 PROMPT "Alterar" SIZE 045, 020 OF oDlg FONT oFont1 PIXEL
    @ 097, 172 BUTTON oButton2 PROMPT "Excluir" SIZE 045, 020 OF oDlg FONT oFont1 PIXEL

  ACTIVATE MSDIALOG oDlg CENTERED
                                   
Return

