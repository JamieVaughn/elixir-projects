require Application

defmodule Endpoint do
  # First, we should start `inets` application.
  # `httpc` is part of it:
  Application.ensure_all_started(:inets)

  # We should start `ssl` application also for secure requests,
  Application.ensure_all_started(:ssl)

  # Now we can make request:
  {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, _body}} =
    :httpc.request(:get, {'http://google.com', []}, [], [])

  # `httpc` will follow redirect from `http` to `https` without
  # additional config.
end
