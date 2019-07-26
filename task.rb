# THE MODEL
# Ele é a base da nossa aplicação. Tudo que fizermos será baseado nele

class Task
  attr_reader :done, :desc

  def initialize(desc)
    @desc = desc
    @done = false
  end

  def mark_as_done!
    @done = true
  end

end
