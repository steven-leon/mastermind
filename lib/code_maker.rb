#Contendrá la lógica para el creador del código, como generar un código secreto.

class CodeMaker
    COLORS = %w[rojo azul amarillo verde].freeze # Solo 4 colores permitidos
    #%w[...] es una forma corta en Ruby de escribir arrays de strings sin comillas ni comas.

    #.freeze hace que el array no se pueda modificar en tiempo de ejecución (buena práctica para constantes).
    CODE_LENGTH = 4 #Las constantes se escriben con mayusculas

    attr_reader :secret_code
    #Esto crea automáticamente un método de solo lectura llamado secret_code,Cuando decimos que un atributo es de solo lectura,
    #  significa que puedes ver o acceder al valor de ese atributo desde fuera de la clase, pero no modificarlo directamente.
    #  Esto es muy útil para mantener la integridad de los datos.

    def initialize #Es el constructor de la clase(CodeMaker)
      @secret_code = Array.new(CODE_LENGTH) { COLORS.sample }
    end

  #   Array.new(CODE_LENGTH): Crea un array de tamaño 4.

  #   { COLORS.sample }: Bloque que se ejecuta para cada posición del array, seleccionando un color al azar de COLORS.

  #  Resultado: @secret_code es un array de 4 elementos aleatorios (ejemplo: ["rojo", "verde", "azul", "amarillo"]).

    def give_feedback(guess)
      exact_matches = guess.each_index.count { |i| guess[i] == @secret_code[i] } #cuenta los valores que si coinciden en la misma posición
      color_matches = (guess & @secret_code).sum { |color| [guess.count(color), @secret_code.count(color)].min } - exact_matches
      { exact: exact_matches, color: color_matches }
    end

    # exact: Número de colores en la posición correcta.

    # color: Número de colores correctos pero en posición incorrecta.
end
