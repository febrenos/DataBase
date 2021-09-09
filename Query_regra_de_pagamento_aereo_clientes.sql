select distinct 
IsNull(cl.display_name, cl.company_name) Cliente, 
CASE  pr.is_default WHEN 1 THEN 'Sim' ELSE 'Não' END [Regra Padrão] , 
CASE pr.employees WHEN 1 THEN 'Sim' ELSE 'Não' END [Funcionário],
CASE pr.outsourced WHEN 1 THEN 'Sim' ELSE 'Não' END [Terceirizado],
b.name Filial, 
d.name Departamento, 
ct.name [Centro de Custo],
tr.code [Motivos de viagem], 
CASE 
WHEN cpc.payment_method_type = 1 THEN 'Direto'
WHEN cpc.payment_method_type = 2 THEN 'Faturado'
WHEN cpc.payment_method_type = 3 THEN 'Cartão de Crédito'
WHEN cpc.payment_method_type = 4 THEN 'Cartão Manual'
WHEN cpc.payment_method_type = 5 THEN 'Cartão da Agência'
WHEN cpc.payment_method_type = 6 THEN 'Cartão do Viajante'
WHEN cpc.payment_method_type = 6 THEN 'Cartão da Agência para o Cliente'
WHEN cpc.payment_method_type = 6 THEN 'Cartão Virtual'
ELSE 'Cartão de Crédito' END [Forma de pagamento], 
CASE cpp.is_international WHEN 1 THEN 'Sim' ELSE 'Não' END [Internacional],
cc.last_digits [Final Cartão]
from clients cl
inner join clients_settings cs on cs.settings_id = cl.client_settings_id
inner join clients_settings_purchase_areas csp on csp.purchase_area_id = cs.purchase_area_id
inner join payment_rules pr on pr.purchase_area_id = csp.purchase_area_id
inner join client_payment_products cpp on cpp.payment_rule_id = pr.payment_rule_id
inner join client_payment_configurations cpc on cpc.payment_product_id = cpp.payment_product_id
left join credit_cards cc on cc.credit_card_id = cpc.credit_card_id
left join payment_rule_branches prb on prb.payment_rule_id = pr.payment_rule_id
left join branches b on b.branch_id = prb.branch_id
left join payment_rule_departments prd on prd.payment_rule_id = pr.payment_rule_id
left join departments d on d.department_id = prd.department_id
left join payment_rule_cost_centers prc on prc.payment_rule_id = pr.payment_rule_id
left join cost_centers ct on ct.cost_center_id = prc.cost_center_id
left join payment_rule_trip_reasons prtr on prtr.payment_rule_id = pr.payment_rule_id
left join trips_reasons tr on tr.trip_reason_id = prtr.trip_reason_id
where cl.travel_agency_id = '2FB0EE32-9A46-4009-96DB-F174B3CB8400' and cl.enabled = 1 and cl.excluded = 0 and cpp.product_type = 'F' 
order by 1,2 desc,3,4,5,6,7,8,9,10,11




