defmodule YearInProgress.CLI do
  @moduledoc false

  @diff NaiveDateTime.diff(NaiveDateTime.utc_now(), %{
          NaiveDateTime.utc_now()
          | month: 1,
            day: 1,
            hour: 0,
            minute: 0,
            second: 1
        })

  def main(_args) do
    day = (@diff / 60 / 60 / 24) |> Float.floor() |> Kernel.trunc()

    ordinal_of_day =
      if rem(day, 100) > 10 && rem(day, 100) < 20 do
        "th"
      else
        case rem(day, 10) do
          1 -> "st"
          2 -> "nd"
          3 -> "rd"
          _ -> "th"
        end
      end

    IO.puts("Hello from " <> to_string(day) <> ordinal_of_day <> " day of year!")

    draw()
  end

  def draw do
    calc()
    |> progress_bar()
  end

  defp calc do
    (100 / 31_536_000 * @diff)
    |> Float.round(1)
  end

  defp progress_bar(percentage) do
    format = [
      bar: " ",
      blank: "•",
      left: "",
      right: "",
      bar_color: [IO.ANSI.green(), IO.ANSI.green_background()],
      blank_color: [IO.ANSI.red(), IO.ANSI.red_background()]
    ]

    ProgressBar.render(percentage, 100, format)
  end
end
