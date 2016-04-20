defmodule Alice.Handlers.Reddit do
  use Alice.Router

  route   ~r<\breddit me (/?r/)?(.*)\z>,    :random_image_from_subreddit
  command ~r<\breddit( me)? (/?r/)?(.*)\z>, :random_image_from_subreddit

  @doc "`reddit me ____` - gets a random image from your specified subreddit"
  def random_image_from_subreddit(conn) do
    conn
    |> get_term
    |> Readit.random_image_from_sub
    |> reply(conn)
  end

  defp get_term(conn) do
    conn
    |> Alice.Conn.last_capture
    |> String.downcase
    |> String.replace(~r/[_\s]+/, "")
    |> String.strip
  end
end
