defmodule PhoenixBlog.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use PhoenixBlog.ConnCase

      use Hound.Helpers
      hound_session()
    end
  end
end
