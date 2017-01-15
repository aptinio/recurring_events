defmodule RecurringEvents.DateTest do
  use ExUnit.Case
  doctest RecurringEvents

  alias RecurringEvents.Date

  @date ~N[2017-01-30 10:00:00]

  test "can shift date by N days" do
    assert ~N[2017-01-31 10:00:00] ==
      Date.shift_date(@date, 1, :days)
    assert ~N[2017-02-01 10:00:00] ==
      Date.shift_date(@date, 2, :days)
    assert ~N[2018-01-30 10:00:00] ==
      Date.shift_date(@date, 365, :days)
  end

  test "can shift date by N months" do
    assert ~N[2017-02-28 10:00:00] ==
      Date.shift_date(@date, 1, :months)
    assert ~N[2017-03-30 10:00:00] ==
      Date.shift_date(@date, 2, :months)
    assert ~N[2017-06-30 10:00:00] ==
      Date.shift_date(@date, 5, :months)
    assert ~N[2018-04-30 10:00:00] ==
      Date.shift_date(@date, 15, :months)
  end

  test "can shift date by -N months" do
    assert ~N[2016-12-30 10:00:00] ==
      Date.shift_date(@date, -1, :months)
    assert ~N[2016-11-30 10:00:00] ==
      Date.shift_date(@date, -2, :months)
    assert ~N[2016-08-30 10:00:00] ==
      Date.shift_date(@date, -5, :months)
    assert ~N[2015-10-30 10:00:00] ==
      Date.shift_date(@date, -15, :months)
  end

  test "can shift date by N years" do
    assert %{@date | year: 2018} ==
      Date.shift_date(@date, 1, :years)
    assert %{@date | year: 2019} ==
      Date.shift_date(@date, 2, :years)
    assert %{@date | year: 2012} ==
      Date.shift_date(@date, -5, :years)
    assert %{@date | year: 2032} ==
      Date.shift_date(@date, 15, :years)
  end
end
