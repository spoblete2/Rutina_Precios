// Programa de consulta de precios de medicamentos desde base de datos de Mercado Publico
// Unidad de Evaluaciones Económicas - Departamento ETESA-SBE - Ministerio de Salud
// Versión 1.0 Enero de 2021

// Definir previamente directorio de trabajo (ejemplo: cd "/Users/user/Desktop/Home Office/Chilecompra")
// En dicho directorio deben estar alojados los archivos descargados y procesados desde Datos Abiertos

program define consulta_precios 
		quietly {
		clear all
		use mercado_publico_red
		gen C2 = 1 if regexm(lower(especificacioncomprador), "`1'")
		gen C3 = 1 if regexm(lower(especificacionproveedor), "`1'")
		keep if C2 == 1 | C3 == 1
		drop if fecha_archivo < tm(`2') | fecha_archivo > tm(`3')
		keep if estado == "Aceptada"
		drop C2 C3
		export excel using "`1'", sheetreplace firstrow(variables)
		}
		display "El archivo xls con su consulta fue generado"
end
