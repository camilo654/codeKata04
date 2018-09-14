class Archivo
  def initialize(archivo)
    @archivo = archivo
  end

  attr_accessor :archivo

  def lineas
    arrayLineas = Array.new
    File.open( archivo, 'r') do |f1|
      f1.gets #Descarto linea de encabezados, porque no me interesa
      while linea = f1.gets
        arrayLineas << linea if linea.strip[0] != "-" && !linea.strip.empty?
      end
    end
    arrayLineas
  end
end

class Procesador
  def encontrarMenor array, posValor1, posValor2, posValorARetornar
    linea1 = array[0].split(" ")
    array.shift
    menor = linea1[posValorARetornar]
    valorMenor = (linea1[posValor1].to_f - linea1[posValor2].to_f).abs

    array.each do |linea|
      datos = linea.split(" ")
      resta = (datos[posValor1].to_f - datos[posValor2].to_f).abs
      if resta < valorMenor
        valorMenor = resta
        menor = datos[posValorARetornar]
      end
    end
    menor
  end
end

archivo = Archivo.new('weather.dat')
procesador = Procesador.new()
puts procesador.encontrarMenor archivo.lineas, 1, 2, 0
archivo.archivo = 'football.txt'
puts procesador.encontrarMenor archivo.lineas, 6, 8, 1
