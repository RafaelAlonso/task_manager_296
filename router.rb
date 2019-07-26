# THE ROUTER
# Não mencionado propriamente em aula, ele serve simplesmente para:
# - Mostrar as opções de ação do usuário
# - Pedir ao controller executar a ação que o usúario requisitou
# - Manter o programa rodando (loop) enquanto o usuário não decidir sair

class Router

  # O controller nos é passado (app passa ao Router na hora de criá-lo)
  def initialize(task_controller)
    @task_controller = task_controller
  end

  # Loop principal
  def run
    # imprime uma mensagem de boas vindas
    puts 'Bem vindo ao Task Manager!!!'
    puts 'O que gostaria de fazer hoje?'

    # Variável para guardar a escolha do usuário
    opt = nil
    while opt != 0

      # =========================== Opções ===========================
      puts "\nPossíveis ações"
      puts '1 - Listar todas as tarefas'
      puts '2 - Criar uma nova tarefa'
      puts '3 - Marcar uma tarefa como feita'
      puts '4 - Deletar uma tarefa'
      puts '0 - Sair'
      # ==============================================================

      # Recupera a escolha do usuário
      opt = gets.chomp.to_i

      # Limpa a tela
      print `clear`

      # Baseado na ação do usuário, pede para o controller executar algo
      case opt
        when 1
          @task_controller.listar
        when 2
          @task_controller.criar
        when 3
          @task_controller.fazer
        when 4
          @task_controller.remover
        when 0
          break
        else
          # Se o usuário não digitou algo válido, imprime mensagem de erro
          puts "Não entendir"
      end
    end

  end
end

