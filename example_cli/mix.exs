defmodule MyApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_app,
      version: "0.0.1",
      escript: escript()
    ]
  end

  def escript do
    [main_module: MyApp.CLI]
  end
end
