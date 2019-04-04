defmodule Hello.FlowsTest do
  use Hello.DataCase

  alias Hello.Flows

  describe "pin" do
    alias Hello.Flows.Pin

    @valid_attrs %{msisdn: "some msisdn", pin: "some pin"}
    @update_attrs %{msisdn: "some updated msisdn", pin: "some updated pin"}
    @invalid_attrs %{msisdn: nil, pin: nil}

    def pin_fixture(attrs \\ %{}) do
      {:ok, pin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Flows.create_pin()

      pin
    end

    test "list_pin/0 returns all pin" do
      pin = pin_fixture()
      assert Flows.list_pin() == [pin]
    end

    test "get_pin!/1 returns the pin with given id" do
      pin = pin_fixture()
      assert Flows.get_pin!(pin.id) == pin
    end

    test "create_pin/1 with valid data creates a pin" do
      assert {:ok, %Pin{} = pin} = Flows.create_pin(@valid_attrs)
      assert pin.msisdn == "some msisdn"
      assert pin.pin == "some pin"
    end

    test "create_pin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Flows.create_pin(@invalid_attrs)
    end

    test "update_pin/2 with valid data updates the pin" do
      pin = pin_fixture()
      assert {:ok, %Pin{} = pin} = Flows.update_pin(pin, @update_attrs)
      assert pin.msisdn == "some updated msisdn"
      assert pin.pin == "some updated pin"
    end

    test "update_pin/2 with invalid data returns error changeset" do
      pin = pin_fixture()
      assert {:error, %Ecto.Changeset{}} = Flows.update_pin(pin, @invalid_attrs)
      assert pin == Flows.get_pin!(pin.id)
    end

    test "delete_pin/1 deletes the pin" do
      pin = pin_fixture()
      assert {:ok, %Pin{}} = Flows.delete_pin(pin)
      assert_raise Ecto.NoResultsError, fn -> Flows.get_pin!(pin.id) end
    end

    test "change_pin/1 returns a pin changeset" do
      pin = pin_fixture()
      assert %Ecto.Changeset{} = Flows.change_pin(pin)
    end
  end
end
