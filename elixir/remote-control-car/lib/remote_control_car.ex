defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance} = _remote_car) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery} = _remote_car)
      when battery === 0 do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery} = _remote_car) do
    "Battery at #{battery}%"
  end

  def drive(
        %RemoteControlCar{battery_percentage: battery} =
          remote_car
      )
      when battery === 0 do
    remote_car
  end

  def drive(
        %RemoteControlCar{battery_percentage: battery, distance_driven_in_meters: distance} =
          remote_car
      ) do
    %{
      remote_car
      | distance_driven_in_meters: distance + 20,
        battery_percentage: battery - 1
    }
  end
end
