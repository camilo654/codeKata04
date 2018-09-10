#Objects
class Archivo
  def initialize(archivo)
    @archivo = archivo
  end

  attr_accessor :archivo

  def lineas
    arrayLineas = Array.new
    File.open( archivo, 'r') do |f1|
      f1.gets #Descarto linea de encabezados, porque no me interesa
      #arrayLineas.push(f1.gets)
      while linea = f1.gets
        if linea.strip[0] != "-" && !linea.strip.empty?
          arrayLineas << linea
        end
      end
    end
    arrayLineas
  end
end

class Procesador
  def encontrarMenor array, posValor1, posValor2, posValorARetornar
    array
    array.shift
    array[0]
    linea1 = array[0].split(" ")
    array.shift
    menorInicial = linea1[posValorARetornar]
    valorMenorInicial = (linea1[posValor1].to_f - linea1[posValor2].to_f).abs
    menor = menorInicial
    valorMenor = valorMenorInicial

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
archivo.lineas
puts procesador.encontrarMenor archivo.lineas, 6, 8, 1
