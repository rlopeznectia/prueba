/****************************
  Desarrollado por: Nectia
  Autor: Rodrigo López (RL)
  Proyecto: Sodexo AGIL
  Descripción: Clase Modelo para ejecución de consultas SOQL y operaciones DML
 
  ---------------------------------------------------------------------------------
  No. Fecha                Autor                     Descripción
  ------ ---------- ---------------------------------------------------------------
  1.0 08-04-2021            RL                   Creación de Clase.
  1234556789
  ESTO ES UNA PRUEBA
 *****************************/

public class SDXAGIL_ConsultasSOQL  {
	
	public SDXAGIL_ConsultasSOQL(){
	}

	//SOQL Query para buscar los datos de Contrato
	public Contract buscarDatosContrato(String idContrato){
		try{
			Contract datosContrato = [SELECT Id, Name, 
									  Account.SDX_Tipo_de_documento__c, Account.SDX_Numero_de_documento__c,
									  Account.Name, Account.SDX_Nombre_Comercial__c,
									  Account.Parent.Name, Account.Phone,
									  SBQQ__Opportunity__r.Email_Pedidos__c,  Account.Correo_Facturacion__c,
									  Account.Correo_Facturacion_Adicional__c, Owner.SDX_DNI__c,
									  CustomerSignedDate, 
									  Status, Respuesta_Exitosa_de_Integracion__c
									  FROM Contract
									  WHERE Id = :idContrato];
			return datosContrato;
		}catch(Exception ex){
			return null;
		}
	}

	//Retorna datos del Endpoint, Usuario, Password y Tipo para el consumo de datos del Token
	Public API_SodexoAgil__mdt buscarDatosTokenApiSodexoAgil(String nombreMdt){
		API_SodexoAgil__mdt apiSodexoAgil;
		apiSodexoAgil = [SELECT url_token__c, username_token__c, 
						password_token__c, tipo_token__c 
						FROM API_SodexoAgil__mdt 
						WHERE DeveloperName =: nombreMdt];
		return apiSodexoAgil;
	}

	//Retorna datos del Endpoint y Tipo para el servicio Client/Registrar
	public API_SodexoAgil__mdt buscarDatosClientRegistrarApiSodexoAgil(String nombreMdt){
		API_SodexoAgil__mdt apiSodexoAgil;
		apiSodexoAgil = [SELECT url_client_registrar__c, tipo_client_registrar__c 
						FROM API_SodexoAgil__mdt 
						WHERE DeveloperName =: nombreMdt];
		return apiSodexoAgil;
	}

	//Retorna datos del Endpoint y Tipo para el servicio Product/Lista
	public API_SodexoAgil__mdt buscarDatosProductListaApiSodexoAgil(String nombreMdt){
		API_SodexoAgil__mdt apiSodexoAgil;
		apiSodexoAgil = [SELECT url_product_lista__c, tipo_product_lista__c 
						FROM API_SodexoAgil__mdt 
						WHERE DeveloperName =: nombreMdt];
		return apiSodexoAgil;
	}

	//Actualiza registro de Contrato indicando que no hubo respuesta exitosa del servicio.
	//Se agrega también el error de la llamada
	public void guardarRespuestaErronea(Contract datosContrato, String mensaje){
		datosContrato.Respuesta_Exitosa_de_Integracion__c = false;
		datosContrato.Mensaje_de_Integracion__c = mensaje;
		update datosContrato;
	}

	//Actualiza registro de Contrato indicando que la respuesta fue exitosa.
	public void guardarRespuestaExitosa(Contract datosContrato){
		datosContrato.Respuesta_Exitosa_de_Integracion__c = true;
		datosContrato.Status = 'In Approval Process';
		datosContrato.Mensaje_de_Integracion__c = '';
		update datosContrato;
	}
}