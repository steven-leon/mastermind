#Gestionará la lógica del jugador que intenta adivinar el código
class CodeBreaker
  COLORS = %w[rojo azul amarillo verde].freeze
  CODE_LENGTH = 4

  def make_guess
    loop do
      print "Ingresa tu intento con 4 colores separados por espacio (rojo, azul, amarillo, verde): "
      input = gets.chomp.downcase.split
    #   gets: Captura la entrada del teclado (incluyendo el salto de línea al presionar Enter).

    #  .chomp: Elimina el salto de línea final (\n).

    # .downcase: Convierte toda la entrada a minúsculas (para hacer la validación insensible a mayúsculas).

    # .split: Divide la entrada en un array usando espacios como separadores.
    # Ejemplo: Si el jugador escribe Rojo Azul VERDE amarillo, se convierte en ["rojo", "azul", "verde", "amarillo"].

      if input.length == CODE_LENGTH && input.all? { |color| COLORS.include?(color) }
      # input.length == CODE_LENGTH: Verifica que el array tenga exactamente 4 elementos.

      # input.all? { ... }: Verifica que todos los elementos del array input estén incluidos en COLORS.
        return input # Devuelve la entrada válida
      else
        puts "Entrada inválida. Solo puedes usar: #{COLORS.join(', ')}. Inténtalo de nuevo."
        # puts: Muestra un mensaje en la consola con salto de línea.

        # COLORS.join(', '): Convierte el array COLORS en un string separado por comas (ejemplo: "rojo, azul, amarillo, verde").
      end
    end
  end
end
