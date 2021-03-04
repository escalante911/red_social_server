defmodule ZoneSocial.User do

# Se ejecuta una sola vez al incicio de los procesos guardando el retorno en una variable conn
def conec() do
  {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
  conn
end

# Inserta un usuario a la base de datos
def insert_user(conn, nombre, usuario) do
  data = %{name: nombre, user: usuario}
  result = Mongo.insert_one!(conn, "user", data)
  Map.put(data, :id, result.inserted_id)
end

# Consulta todos los usuarios de la base de datos
# def consulta_users(conn) do
#   result = Mongo.find(conn, "user", %{})
#   result |> Enum.to_list() |> IO.inspect
# end

# def consulta_user(conn, nombre) do
#   result = Mongo.find(conn, "user", %{"name": nombre})
#   result |> Enum.to_list() |> IO.inspect
#   data = %{name: "Jose", user: "jose01"}
# end

def consulta_users(conn) do
  map1 = %{name: "Jose", user: "jose01"}
  map2 = %{name: "Jose", user: "jose01"}
  map3 = %{name: "Jose", user: "jose01"}
  data = Map.put(map1, map2)
end

def consulta_user(conn, nombre) do
  data = %{id: "1", name: "Jose", user: "jose01"}
end



end
