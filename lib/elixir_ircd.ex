defmodule ElixirIrcd do
  def main(args) do
    args |> parse_args |> process
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

  def process(port) do
    IO.puts "Listening on port #{port}"
  end
end
