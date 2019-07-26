# THE REPOSITORY
# Simula um Banco de Dados. Ele guardará os "modelitos" (nesse caso,
# as tasks) que criamos e manipulamos.

class TaskRepository
  def initialize
    # A melhor coisa para guardarmos múltiplos itens (lembrando de suas
    # respectivas posições é uma array)! É aqui que guardaremos as
    # tasks
    @repo = []
  end

  # O repositório não é responsável por criar um modelo. Ele apenas
  # recebe o comando para guardá-lo.
  def insert(task)
    @repo << task # task é uma instância do tipo "Task"
  end

  # Método para listarmos todas as tasks que temos guardado.
  # Melhor do que 'attr_reader' pois podemos restringir o que realmente
  # retornaremos (por exemplo, retornar somente aqueles que não estiverem
  # concluídos). Quanto mais controlado o acesso, mais seguro.
  # (OBS.: nesse caso em específico, já que não temos restrições,
  # 'attr_reader' poderia ser utilizado)
  def list_all
    @repo
  end

  # Método para recuperarmos uma task específica, dado o índice dela.
  # Pode ser substituido por list_all[ind] aonde for usada, mas criar um
  # método 'find' deixa o mesmo mais verboso e intuitivo
  def find(ind)
    @repo[ind]
  end

  # Método para deletarmos uma task do repositório, dado o índice dela.
  # Esse método deve ser pensado com cuidado (em outros casos), uma vez
  # que deletar algo é permanente e, portanto, um tanto perigoso.
  # (Exemplo: podemos fazer list_all.delete_at(ind), o que é uma falha.
  # Como resolver isso...?)
  def delete(ind)
    @repo.delete_at(ind)
  end

end
