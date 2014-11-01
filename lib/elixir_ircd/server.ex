defmodule ElixirIrcd.Server do
  def process(port) do
    IO.puts "Listening on port #{port}"
    tcp_options = [:list, {:packet, 0}, {:active, false}, {:reuseaddr, true}]
    {:ok, listen_socket} = :gen_tcp.listen(port, tcp_options)
    do_listen(listen_socket)
  end

  defp do_listen(listen_socket) do
    {:ok, socket} = :gen_tcp.accept(listen_socket)
    spawn(fn() -> do_server(socket) end)
    do_listen(listen_socket)
  end

  defp do_server(socket) do
    :gen_tcp.send(socket, "NOTICE * :*** Checking Ident\n")
    do_listen_client(socket)
  end

  defp do_listen_client(socket) do
    case :gen_tcp.recv(socket, 0, 10000) do
      {:ok, data} ->
        IO.inspect data
        do_listen_client(socket)
      {:error, :closed} ->
        IO.puts "socket closed"
        :ok
      {:error, :timeout} ->
        :gen_tcp.close(socket)
    end
  end
end
