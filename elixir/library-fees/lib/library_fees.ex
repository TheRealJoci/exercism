defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    noon = Time.new!(12, 00, 00, 00)
    checkout_time = NaiveDateTime.to_time(datetime)

    if Time.compare(noon, checkout_time) === :gt, do: true, else: false
  end

  def return_date(checkout_datetime) do
    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(if before_noon?(checkout_datetime), do: 28, else: 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    return_date = NaiveDateTime.to_date(actual_return_datetime)

    if Date.compare(planned_return_date, return_date) === :gt do
      0
    else
      Date.diff(return_date, planned_return_date)
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() === 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return = datetime_from_string(return)

    amount_days_late =
      checkout
      |> datetime_from_string()
      |> return_date()
      |> days_late(return)

    IO.puts(amount_days_late)

    if amount_days_late > 0 do
      discount = if monday?(return), do: 0.5, else: 1
      trunc(amount_days_late * rate * discount)
    else
      0
    end
  end
end
