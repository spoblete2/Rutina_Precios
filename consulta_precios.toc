program define consulta_precios 
// Programa de Consulta de precios
// Unidad de Evaluaciones Económicas - Departamento ETESA-SBE - Ministerio de Salud
// Versión 1.0 Noviembre de 2020
		quietly {
		clear
		cd "/Users/user/Desktop/Home Office/Chilecompra"
		use `1'
		gen C1 = 1 if regexm(lower(nombreroductogenerico), "`2'")
		gen C2 = 1 if regexm(lower(especificacioncomprador), "`2'")
		gen C3 = 1 if regexm(lower(especificacionproveedor), "`2'")
		keep if C2 == 1 | C3 == 1
		export excel using "`1'-`2'", sheetreplace firstrow(variables)
		}
		display "El archivo xls con su consulta fue generado"
end
