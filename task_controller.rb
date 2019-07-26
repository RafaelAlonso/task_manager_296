# THE CONTROLLER (aka BIG BOSS)
# Ele é o que coordena toda nossa aplicação. Ativado pelo router, ele
# é o responsável por criar "modelitos" (nesse caso, tasks) e pedir para
# o repositório armazená-los, recuperar um ou vários itens do repositório,
# pedir para o repositório deletar um item específico e manipular as tasks.
# A "única coisa" que o controller não faz é se comunicar diretamente com
# o usuário (utilizando a view para isso)!!

# Via de regra: se você escreveu o nome da classe no arquivo (ex.: Task),
# você precisa importar o arquivo aonde a classe foi definida.
require_relative 'task'
require_relative 'task_view'

class TaskController

  # Nós recebemos o repositório (do app). Nós criamos a view
  def initialize(repository)
    @task_repo = repository

    # usei 'TaskView', então preciso importar
    @task_view = TaskView.new
  end

  # ========================== CRUD ===============================
  # CREATE => criar uma nova task e pede pro repositório guardar
  def criar
    # 1. pega a descrição que a view retornou
    desc = @task_view.pegar_desc

    # 2. cria a task (usei 'Task', então preciso importar)
    task = Task.new(desc)

    # pede para o repositório guardar a task
    @task_repo.insert(task)
  end

  # READ => pegar todos os tasks do repositório
  def listar
    # 1. recupera todas as tasks do repositório
    tarefas = @task_repo.list_all # array de tasks

    # 2. envia a array obtida para a view mostrar ao usuário
    @task_view.mostrar_tarefas(tarefas)
  end

  # UPDATE => marcar se o task foi feito ou não
  def fazer
    # 1. lista as tarefas
    listar

    # 2. pega o índice que a view retornou
    indice = @task_view.pegar_ind('marcar como feita')

    # 3. pede para o repositório retornar a task específica daquele indice
    task_especifico = @task_repo.find(indice)

    # 4. marco a task como feita
    task_especifico.mark_as_done!
  end

  # DELETE => deletar um task
  def remover
    # 1. lista as tarefas
    listar

    # 2. pega o índice que a view retornou
    indice = @task_view.pegar_ind('remover')

    # 3. pede para o repositório deletar a task daquele índice
    @task_repo.delete(indice)
  end
end
