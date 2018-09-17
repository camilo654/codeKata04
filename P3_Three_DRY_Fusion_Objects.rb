class Archivo
  def initialize(archivo)
    @archivo = archivo
  end

  attr_accessor :archivo

  def lineas
    arrayLineas = Array.new
    File.open( archivo, 'r') do |f1|
      f1.gets #Descarto linea de encabezados
      while linea = f1.gets
        arrayLineas << linea if linea.strip[0] != "-" && !linea.strip.empty?
      end
    end
    arrayLineas
  end
end

class Procesador
  def encontrarMenor array, posValor1, posValor2, posIndiceARetornar
    linea1 = array.shift.split(" ")
    menor = linea1[posIndiceARetornar]
    valorMenor = (linea1[posValor1].to_f - linea1[posValor2].to_f).abs

    array.each do |linea|
      datos = linea.split(" ")
      resta = (datos[posValor1].to_f - datos[posValor2].to_f).abs
      if resta < valorMenor
        valorMenor = resta
        menor = datos[posIndiceARetornar]
      end
    end
    menor
  end
end

archivo = Archivo.new('weather.dat')
procesador = Procesador.new()
menor = procesador.encontrarMenor archivo.lineas, 1, 2, 0
puts "El día con la menor diferencia de temperatura es el #{menor}"
archivo.archivo = 'football.txt'
menor = procesador.encontrarMenor archivo.lineas, 6, 8, 1
puts "El equipo con la menor diferencia entre goles a favor y en contra es el #{menor}"
