select r."Id" as "IdRota", r."NmRota", r."IdCadastroTransportadora", rm."IdCadastroMotorista", rg."IdCadastroGerenciadora", rv."IdCadastroVeiculo" 
from "Rota" r
inner join "RotaGerenciadora" rg on r."Id" = rg."IdRota"
inner join "RotaMotorista" rm on r."Id" = rm."IdRota"
inner join "RotaVeiculo" rv ON r."Id" = rv."IdRota"
order by r."Id" asc;