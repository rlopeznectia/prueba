/****************************
  Desarrollado por: Nectia
  Autor: Rodrigo López (RL)
  Proyecto: Sodexo AGIL
  Descripción: Clase para "Helper" para apoyo a Clases de Integración
 
  ---------------------------------------------------------------------------------
  No. Fecha                Autor                     Descripción
  ------ ---------- ---------------------------------------------------------------
  1.0 08-04-2021            RL                   Creación de Clase.
 *****************************/

public class SDXAGIL_Helper_Class  {

	public SDXAGIL_Helper_Class(){
	}

	//Método para armar estructura JSON de consumo de servicio login
	public String armarJsonToken(String username, String password){
		String jsonString = '';
		jsonString = '{\n';
		jsonString += '	"Username": "'+username+'",\n';
		jsonString += '	"Password": "'+password+'"\n';
		jsonString += '}';
		return jsonString;
	}

	//Método para armar estructura JSON de consumo de servicio Client/Registrar
	public String armarJsonServicioClientRegistrar(String token, Contract datosContrato){
		String jsonString = '';
		jsonString = '{\n';
		jsonString += '   "TipoDocumento":"2502",\n';
		jsonString += '   "NumeroDocumento":"20507852549",\n';
		jsonString += '   "RazonSocial":"Sodexo Pass Peru SAC",\n';
		jsonString += '   "NombreComercial":"Sodexo Beneficios e Incentivos",\n';
		jsonString += '   "GrupoEmpresarial":null,\n';
		jsonString += '   "Telefono":"946138857",\n';
		jsonString += '   "Correo":{\n';
		jsonString += '      "Pedido":"freddy.llerena@sodexo.com",\n';
		jsonString += '      "Facturacion":"freddy.llerena@sodexo.com",\n';
		jsonString += '      "FacturacionAlterno":"freddy.llerena@sodexo.com"\n';
		jsonString += '   },\n';
		jsonString += '   "Ubicacion":{\n';
		jsonString += '      "Departamento":"LIMA",\n';
		jsonString += '      "Provincia":"LIMA",\n';
		jsonString += '      "Distrito":"SAN BORJA",\n';
		jsonString += '      "Direccion":"Calle domenico morelli 110"\n';
		jsonString += '   },\n';
		jsonString += '   "EsInternacional":"S",\n';
		jsonString += '   "EjecutivoComercialDNI":"42167535",\n';
		jsonString += '   "Contrato":{\n';
		jsonString += '      "IdProducto":67,\n';
		jsonString += '      "MesesVigenciaPlastico":3,\n';
		jsonString += '      "FechaFirma":"01/01/2019",\n';
		jsonString += '      "Acuerdos":{\n';
		jsonString += '         "ComisionPedido":0.0,\n';
		jsonString += '         "ComisionContrato":0.0,\n';
		jsonString += '         "CostoEmision":0.0,\n';
		jsonString += '         "CostoAdicionales":0.0,\n';
		jsonString += '         "CostoEnvioPedidoLima":0.0,\n';
		jsonString += '         "CostoEnvioPedidoProvincia":0.0,\n';
		jsonString += '         "CostoRenovacion":0.0,\n';
		jsonString += '         "CostoTrasladoSaldo":0.0,\n';
		jsonString += '         "CostoReposicion":0.0,\n';
		jsonString += '         "CostoEnvioReposicionLima":0.0,\n';
		jsonString += '         "CostoEnvioReposicionProvincia":0.0\n';
		jsonString += '      }\n';
		jsonString += '   },\n';
		jsonString += '   "NombreUsuario":"Susan.Fortuna"\n';
		jsonString += '}\n';
		return jsonString;
	}
}