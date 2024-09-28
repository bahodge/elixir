import Config

config :chat, remote_supervisor: fn receipient -> {Chat.TaskSupervisor, recipient} end
