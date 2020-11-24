class Alumno {
  var nombre: String?
  var edad:  Int?
  var promedio: Double?
  var beca: Bool?

  init(name: String?, age: Int?, average: Double?, scholarship: Bool){
    nombre = name
    edad = age
    promedio = average
    beca = scholarship
  }
  func MostrarDatos(){
    print("Nombre: \(nombre!)\nEdad: \(edad!)\nPromedio: \(promedio!)\nBeca: \(beca!)")
  }
}
//--------------------------------------------------------
//-------------------REGISTRO DE ALUMNOS-----------------
var alumnos : [Alumno] = []
var tiene_beca = false

print("¿ Cuantos Alumnos quieres ingresar ?")
let num_alumnos = (Int(readLine()!))!
for index in 1...num_alumnos{
  print("-----------REGISTRANDO ALUMNO \(index) de \(num_alumnos)---------")
  print("Ingresa el Nombre del Alumno") 
  let nombre = readLine()
  print("Ingresa la Edad del Alumno \(nombre!)") 
  let edad = readLine()
  print("Ingresa el Promedio del Alumno \(nombre!)") 
  let promedio = readLine()
  print("El Alumno \(nombre!) cuenta con beca(si/no)") 
  var beca = readLine()

  while true{
    if beca == "si" {
      tiene_beca = true
      break
    }
    else if beca == "no"{
      tiene_beca = false
      break
    }
    else{
      print("Ingresa solo si o no")
      beca = readLine()
    }
  }
  let alumno1=Alumno(name: nombre, age: Int(edad!), average: Double(promedio!), scholarship: tiene_beca)
  alumnos.append(alumno1)
  print("\n")
}
//----------------------------------------------------------

//-------------FUNCIONES------------------------------------
func MonstrarBase(){
  for element in alumnos{
    element.MostrarDatos()
    print("\n")
  }
}

func PromedioAlto(){
	alumnos.sort(by: {$0.promedio! > $1.promedio!})
	for element in alumnos{
		if (element.promedio == alumnos[0].promedio){
			element.MostrarDatos()
			print("\n")
		}
	}
}

func PromedioBajo(){
	alumnos.sort(by: {$0.promedio! < $1.promedio!})
	for element in alumnos{
		if (element.promedio == alumnos[0].promedio){
			element.MostrarDatos()	
			print("\n")		
		}
	}	
}

func TieneBeca(){
  alumnos.sort(by: {$0.nombre! < $1.nombre!})
	for element in alumnos{
		if (element.beca != false){
			element.MostrarDatos()
			print("\n")
		}
	}
}

//-------------SIN ORDENAR--------------------------------------------
print("SIN ORDERNAR\n")
MonstrarBase()
//-------------ORDENADA POR NOMBRE------------------------------------
print("ORDENADA\n")
alumnos.sort(by: {$0.nombre! < $1.nombre!})
MonstrarBase()
//--------------------------------------------------------------------
//-------------PROMEDIOS Y BECA---------------------------------------
print("-----EL PROMEDIO MÁS ALTO ES-----\n")
PromedioAlto()
print("-----EL PROMEDIO MÁS BAJO ES-----\n")
PromedioBajo()
print("-----ALUMNOS CON BECA-----\n")
TieneBeca()