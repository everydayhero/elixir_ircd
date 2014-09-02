defmodule ElixirIrcd do
  def main(args) do
    args |> parse_args |> ElixirIrcd.Server.process
  end

  def parse_args(args) do
    options = OptionParser.parse(
      args,
      strict: [port: :integer],
      aliases: [p: :port]
    )

    case options do
      { [ port: port], _, _} -> port
      _                      -> 6667
    end
  end
end
