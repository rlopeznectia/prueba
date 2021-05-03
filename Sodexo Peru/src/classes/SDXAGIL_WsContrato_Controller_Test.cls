/****************************
  Desarrollado por: Nectia
  Autor: Rodrigo López (RL)
  Proyecto: Sodexo AGIL
  Descripción: Clase Test de SDXAGIL_WsContrato_Controller y SDXAGIL_ClientRegistrarResp_JSON
 
  ---------------------------------------------------------------------------------
  No. Fecha                Autor                     Descripción
  ------ ---------- ---------------------------------------------------------------
  1.0 14-03-2021            RL                   Creación de Clase.
 *****************************/

@isTest
public class SDXAGIL_WsContrato_Controller_Test  {
	@TestSetup 
	static void setup(){
		Account cuenta = new Account(
		  Name = 'ARSD',								// Razón Social
		  NumberOfEmployees = 44,                       // Empleados
		  SDX_Tipo_de_documento__c = 'RUC',             // Tipo de documento
		  SDX_Numero_de_documento__c = '11111111113',   // Número de documento
		  SDX_Tipo_Administracion__c = 'Individual',    // Tipo Administración
		  Industry = 'Other',                           // Sector
		  SDX_Tipo_de_mercado__c = 'Libre'				// Tipo de mercado
		);
		insert cuenta;

		Contract sobj = new Contract(
		  StartDate = Date.valueOf('2021-04-06'),       // Fecha de inicio del contrato
		  AccountId = cuenta.Id,                        // Razón Social
		  Status = 'En Creación',                       // Estado
		  Complejo__c = false,                          // Complejo
		  Envia_Correo_Onboarding__c = false,           // Envia Correo Onboarding
		  OnBoarding_Exitoso__c = false,                // OnBoarding Exitoso
		  Excepcion__c = false,                         // Excepción
		  Documentacion_Entregada__c = false,           // Documentación Entregada
		  Excepcion_regularizada__c = false,            // Excepción regularizada
		  Kit_Enviaddo__c = false,                      // Kit Enviaddo
		  Encuesta_Enviada__c = false					// Encuesta enviada
		);
		insert sobj;
	}

	//Test de Error - Error 001
	static testmethod void WsContrato_Controller_Test1() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		Test.setMock(HttpCalloutMock.class, new SDXAGIL_MockHttpResponseGenerator());
				
		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error al Obtener Token
	static testmethod void WsContrato_Controller_Test2() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		Test.setMock(HttpCalloutMock.class, new SDXAGIL_MockHttpResponseTokenError());
				
		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error al Obtener datos del Contrato
	static testmethod void WsContrato_Controller_Test3() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('test', null);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error al Obtener datos del Contrato
	static testmethod void WsContrato_Controller_Test4() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		Test.setMock(HttpCalloutMock.class, new SDXAGIL_MockHttpResponseEx());

		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error - Código 400
	static testmethod void WsContrato_Controller_Test5() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		Test.setMock(HttpCalloutMock.class, new SDXAGIL_MockHttpResponseError());

		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error - Código 400
	static testmethod void WsContrato_Controller_Test6() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		
		Test.setMock(HttpCalloutMock.class, new SDXAGIL_MockHttpResponseToken());

		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error - Enviando Contrato en estado previo a "En Creación"
	static testmethod void WsContrato_Controller_Test7() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		cont.Status = 'Draft';
		update cont;
		
		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == false, true);

		Test.stopTest();
	}

	//Test de Error - No Reenviar Contrato ya enviado"
	static testmethod void WsContrato_Controller_Test8() {
		Test.startTest();

		Contract cont = [SELECT Id, Name, Respuesta_Exitosa_de_Integracion__c FROM Contract WHERE Account.Name = 'ARSD'];
		cont.Status = 'In Approval Process';
		cont.Respuesta_Exitosa_de_Integracion__c = true;
		update cont;
		
		PageReference pref = Page.SDXAGIL_WsContrato;
		Test.setCurrentPage(pref);
		pref.getParameters().put('id', cont.Id);
		ApexPages.StandardController apst=new ApexPages.StandardController(cont);
		SDXAGIL_WsContrato_Controller wsContrato = new SDXAGIL_WsContrato_Controller(apst);
		wsContrato.guardarRespuesta();
		wsContrato.redirect();

		wsContrato = new SDXAGIL_WsContrato_Controller(apst);

		System.assert(cont.Respuesta_Exitosa_de_Integracion__c == true, true);

		Test.stopTest();
	}
}