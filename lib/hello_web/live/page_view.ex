defmodule HelloWeb.LivePageView do
  require Logger
  use Phoenix.LiveView

  alias Hello.Flows
  alias Hello.Flows.Pin

  def render(assigns), do: HelloWeb.PageView.render("index.html", assigns)

  def mount(_session, socket) do
    {:ok,
     assign(
       socket,
       %{
         step: "msisdn",
         changeset: Flows.pin_changeset(%Pin{})
       }
     )}
  end

  def handle_event("validate", %{"pin" => pin_params, "step" => step}, socket) do
    case step do
      "msisdn" ->
        changeset =
          %Pin{}
          |> Flows.pin_msisdn_changeset(pin_params)
          |> Map.put(:action, :insert)

        {:noreply, assign(socket, %{step: "msisdn", changeset: changeset})}

      "pin" ->
        changeset =
          %Pin{}
          |> Flows.pin_changeset(pin_params)
          |> Map.put(:action, :insert)

        {:noreply, assign(socket, %{step: "pin", changeset: changeset})}
    end
  end

  def handle_event("save", %{"pin" => pin_params}, socket) do
    case Flows.create_pin(pin_params) do
      {:ok, _pin} ->
        {:noreply, assign(socket, step: "tq")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("submit_msisdn", _params, socket) do
    {:noreply, assign(socket, step: "pin")}
  end
end
