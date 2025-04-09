#Este archivo manejará las reglas del juego, como comprobar las conjeturas, dar pistas, y determinar si alguien ganó o perdió
class GameLogic
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @max_attempts = 12
    # Se usa @max_attempts como variable de instancia para que su valor (12 intentos),
    # sea accesible en todos los métodos de la clase (como play) y persista durante la vida del objeto.
  end

  def play
    puts 'Bienvenido a Mastermind! Adivina el código secreto.'
    @max_attempts.times do |attempt|
      #@max_attempts es una variable de instancia que vale 12.

      # El método times en Ruby ejecuta un bloque de código N veces (en este caso, 12 veces).

      # Ejemplo: Si @max_attempts = 3, el bloque se ejecutaría 3 veces: 3.times { |i| puts i } # Imprime 0, 1, 2
      guess = @code_breaker.make_guess
      feedback = @code_maker.give_feedback(guess)
      puts "Intento ##{attempt + 1}: #{guess.join(', ')}" #attempt + 1, se pone asi ya que attempt empieza en 0, por eso se le suma 1, para que empiece en 1
      puts "Exactos: #{feedback[:exact]}, Correctos pero en posición incorrecta: #{feedback[:color]}"

      if feedback[:exact] == CodeMaker::CODE_LENGTH
        # CodeMaker::CODE_LENGTH: Accede a la constante CODE_LENGTH de la clase CodeMaker (valor 4).

        # Condición: Si las coincidencias exactas son 4 (código adivinado), muestra un mensaje de victoria y termina el método con return.
        puts '¡Felicidades! Has adivinado el código.'
        return
      end
    end
    puts "¡Perdiste! El código era: #{@code_maker.secret_code.join(', ')}"
  end
end
