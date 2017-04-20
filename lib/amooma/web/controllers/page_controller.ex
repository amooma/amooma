defmodule Amooma.Web.PageController do
  use Amooma.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
