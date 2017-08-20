defmodule Alice.Handlers.Reddit do
  @moduledoc """
  Alice does Reddit
  """
  use Alice.Router

  route   ~r<\breddit me (/?r/)?(.*)\z>,    :random_image_from_subreddit
  command ~r<\breddit( me)? (/?r/)?(.*)\z>, :random_image_from_subreddit

  @doc "`reddit me ____` - gets a random image from your specified subreddit"
  def random_image_from_subreddit(conn) do
    conn
    |> get_term()
    |> get_post()
    |> build_reply()
    |> reply(conn)
  end

  defp get_term(conn) do
    conn
    |> Alice.Conn.last_capture()
    |> String.downcase()
    |> String.replace(~r/[_\s]+/, "")
    |> String.trim()
  end

  defp get_post(name) do
    name
    |> Readit.Sub.new()
    |> Readit.Sub.hot()
    |> Enum.filter(&Readit.Post.image?/1)
    |> Enum.random()
  end

  defp build_reply(post) do
    ["> *#{post.title} • /r/#{post.subreddit}*",
     "> #{post.score} points and #{post.num_comments} comments so far on reddit",
     "> #{post.url}"]
    |> Enum.join("\n")
  end
end
