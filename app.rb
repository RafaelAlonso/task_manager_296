# Via de regra: se você escreveu o nome da classe no arquivo (ex.: Task),
# você precisa importar o arquivo aonde a classe foi definida.
require_relative 'task_controller'
require_relative 'task_repository'
require_relative 'router'

# Cria os objetos necessários para começar a executar o programa
task_repository = TaskRepository.new
task_controller = TaskController.new(task_repository)
router          = Router.new(task_controller)

# Limpa a tela
print `clear`

# Executa o loop principal (localizado no router)
router.run
