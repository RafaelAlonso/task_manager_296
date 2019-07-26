# THE VIEW
# - Responsável por duas coisas: puts & gets.
# - Não tem acesso ao modelo (portanto não pode criar)
# - Não tem acesso ao repositório (portanto não pode ler, inserir ou remover)
# - Não tem acesso ao controller (não pode mandar ele fazer coisas)
# - Só trabalha com aquilo que lhe for enviado (via parâmetros)

class TaskView

  # (OBS.: não precisamos inicializar nada!)

  # Método para pegar a descrição da tarefa
  def pegar_desc
    # 1. Explica pro usuário o que esperamos que ele retorne
    puts 'Qual é a descrição da sua tarefa?'

    # 2. Recupera a informação do usuário (com gets.chomp)
    desc = gets.chomp

    # 3. Retorna a informação obtida a quem chamou o método (o controller)
    return desc
  end

  # Método para mostrar as tarefas
  # Não tendo acesso a nada, só o que podemos fazer na View é esperar que
  # algo (aka o Controller) nos passe aquilo que precisamos para funcionar
  # (nesse caso, uma array com as tasks)
  def mostrar_tarefas(tarefas)
    # Como usamos o índice para manipular tarefas, queremos mostrar os mesmos
    # ao usuário para ajudá-lo. Então...
    # Para cada uma das tarefas passadas (com o índice)
    tarefas.each_with_index do |tarefa, ind|
      # se a tarefa em questão foi feita, guarda '[X]'. Se não, guarda '[ ]'
      feita = tarefa.done ? '[X]' : '[ ]'

      # imprime na tela o índice da tarefa, a caixa sinalizando se foi feita
      # ou não e a descrição da mesma
      puts "#{ind} - #{feita} #{tarefa.desc}"
    end
  end

  # Método para pegar o índice da tarefa
  def pegar_ind(action)
    # ==================== Bônus: refatoramento ninja ======================
    # Como podemos usar esse método para obter o índice da tarefa que
    # queremos marcar como feita OU remover, podemos dinamizar nossa UX
    # esperando um parâmetro que guardará a diferença na frase de explicação
    # ======================================================================

    # 1. Explica pro usuário o que esperamos que ele retorne, baseado no
    # parâmetro que for passado
    puts "Qual é o índice da tarefa que deseja #{action}?"

    # 2. Recupera a informação do usuário (com gets.chomp)
    indice = gets.chomp.to_i

    # 3. Retorna a informação obtida a quem chamou o método (o controller)
    return indice
  end
end
