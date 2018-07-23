defmodule TestList do
    @moduledoc """
    Módulo realizado por Daniel Sebastián Torres Vargas para solucionar el 2do punto de la prueba
    backend senior para Liftit
    
    ## Examples

      iex(25)> TestList.list2map([["2018-12-01","AM","ID123",5000],-12-01","PM","ID545",3000],["2018-12-02","AM","ID545",7000]])
      %{
        "2018-12-01" => %{"AM" => 12000, "PM" => 3000},
        "2018-12-02" => %{"AM" => 7000}
        }
    """

    @doc """
    Convierte una lista en un mapa. 
    La lista esperada debe contener una o más listas con 4 campos [date, meridian, id, value]
    """
    def list2map(list_of_lists) do
        list2map(list_of_lists, %{})
    end

    defp list2map([head | tail], map) do
        [date, meridian, id, value] = head
        map = case Map.has_key?(map, date) do
            :true -> 
                map2 = Map.get(map, date)
                #IO.inspect(map2)
                map2 = case Map.has_key?(map2, meridian)do
                    :true -> 
                        inside_value = Map.get(map2, meridian)
                        map2 = Map.put(map2, meridian, inside_value + value)
                        #IO.inspect(map2)
                        map2
                    :false -> Map.put(map2, meridian, value)
                end
                Map.put(map, date, map2)
            :false -> map = Map.put(map, date, %{meridian => value})
        end
        list2map(tail, map)
    end

    defp list2map([], map) do
        map
    end
end