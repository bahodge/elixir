defmodule SimpleQueue.Application do
  use Application

  def start(_type, _args) do
    options = [
      name: SimpleQueue.Supervisor,
      strategy: :one_for_one
    ]

    DynamicSupervisor.start_link(options)
    # children = [
    #   {SimpleQueue, [1, 2, 3]}
    # ]
    #
    # opts = [strategy: :one_for_one, name: SimpleQueue.Supervisor]
    # Supervisor.start_link(children, opts)
  end
end
