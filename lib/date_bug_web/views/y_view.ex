defmodule DateBugWeb.YView do
  use DateBugWeb, :view
  alias DateBugWeb.YView

  def render("index.json", %{z: z}) do
    %{data: render_many(z, YView, "y.json")}
  end

  def render("show.json", %{y: y}) do
    %{data: render_one(y, YView, "y.json")}
  end

  def render("y.json", %{y: y}) do
    %{id: y.id,
      date: y.date}
  end
end
