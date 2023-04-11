-- Vehicles where vin makes sense and user make != decoded make
select
    q.agyName
    , q.vehStateAbbrev
    , q.vehID
    , vd.vinStatus
    , json_value(vd.decodedVINData, '$."Error Code"') as [error]
    , json_value(vd.decodedVINData, '$."Vehicle Type"') as [type]
    , q.vehType as fastType
    , json_value(vd.decodedVINData, '$."Manufacturer Name"') as manName
    , json_value(vd.decodedVINData, '$."Drive Type"') as drive
    , json_value(vd.decodedVINData, '$."Gross Vehicle Weight Rating"') as gvwr
    , json_value(vd.decodedVINData, '$."Body Class"') as body
    , json_value(vd.decodedVINData, '$."Model"') as model
    , q.vehModel as fastModel
    , json_value(vd.decodedVINData, '$."Model Year"') as modelYear
    , q.vehModelYear as fastModelYear
    , json_value(vd.decodedVINData, '$."Make"') as make
    , q.vehMake as fastMake
    , json_value(vd.decodedVINData, '$."Fuel Type - Primary"') as ftp
    , json_value(vd.decodedVINData, '$."Fuel Type - Secondary"') as fts
    , json_value(vd.decodedVINData, '$."Bus Type"') as bt
    , json_value(vd.decodedVINData, '$."Other Bus Info"') as obi
from
    dbo.vldVehicleVINData as vd
    inner join dbo.usv_QueryBuilder_vldVehicles as q
        on vd.vrID = q.vehRowID
where 0=0
    and vd.vinStatus > 1
    and q.vehMake <> json_value(vd.decodedVINData, '$."Make"')
;

-- Vehicles where decode is successful and vin does not make sense
select
    q.agyName
    , q.vehStateAbbrev
    , q.vehID
    , vd.vinStatus
    , json_value(vd.decodedVINData, '$."Error Code"') as [error]
    , json_value(vd.decodedVINData, '$."Vehicle Type"') as [type]
    , q.vehType as fastType
    , json_value(vd.decodedVINData, '$."Manufacturer Name"') as manName
    , json_value(vd.decodedVINData, '$."Drive Type"') as drive
    , json_value(vd.decodedVINData, '$."Gross Vehicle Weight Rating"') as gvwr
    , json_value(vd.decodedVINData, '$."Body Class"') as body
    , json_value(vd.decodedVINData, '$."Model"') as model
    , q.vehModel as fastModel
    , json_value(vd.decodedVINData, '$."Model Year"') as modelYear
    , q.vehModelYear as fastModelYear
    , json_value(vd.decodedVINData, '$."Make"') as make
    , q.vehMake as fastMake
    , json_value(vd.decodedVINData, '$."Fuel Type - Primary"') as ftp
    , json_value(vd.decodedVINData, '$."Fuel Type - Secondary"') as fts
    , json_value(vd.decodedVINData, '$."Bus Type"') as bt
    , json_value(vd.decodedVINData, '$."Other Bus Info"') as obi
from
    dbo.vldVehicleVINData as vd
    inner join dbo.usv_QueryBuilder_vldVehicles as q
        on vd.vrID = q.vehRowID
where 0=0
    and vd.vinStatus <= 1
    and left(json_value(vd.decodedVINData, '$."Error Code"'), 1) = 0
;

-- Vehicles where decode is successful and user make != decoded make
select
    q.agyName
    , q.vehStateAbbrev
    , q.vehID
    , vd.vinStatus
    , json_value(vd.decodedVINData, '$."Error Code"') as [error]
    , json_value(vd.decodedVINData, '$."Vehicle Type"') as [type]
    , q.vehType as fastType
    , json_value(vd.decodedVINData, '$."Manufacturer Name"') as manName
    , json_value(vd.decodedVINData, '$."Drive Type"') as drive
    , json_value(vd.decodedVINData, '$."Gross Vehicle Weight Rating"') as gvwr
    , json_value(vd.decodedVINData, '$."Body Class"') as body
    , json_value(vd.decodedVINData, '$."Model"') as model
    , q.vehModel as fastModel
    , json_value(vd.decodedVINData, '$."Model Year"') as modelYear
    , q.vehModelYear as fastModelYear
    , json_value(vd.decodedVINData, '$."Make"') as make
    , q.vehMake as fastMake
    , json_value(vd.decodedVINData, '$."Fuel Type - Primary"') as ftp
    , json_value(vd.decodedVINData, '$."Fuel Type - Secondary"') as fts
    , json_value(vd.decodedVINData, '$."Bus Type"') as bt
    , json_value(vd.decodedVINData, '$."Other Bus Info"') as obi
from
    dbo.vldVehicleVINData as vd
    inner join dbo.usv_QueryBuilder_vldVehicles as q
        on vd.vrID = q.vehRowID
where 0=0
    and left(json_value(vd.decodedVINData, '$."Error Code"'), 1) = 0
    and q.vehMake <> json_value(vd.decodedVINData, '$."Make"')
;

-- Vehicles where primary fuel type is electric
select
    q.agyName
    , q.vehStateAbbrev
    , q.vehID
    , vd.vinStatus
    , json_value(vd.decodedVINData, '$."Error Code"') as [error]
    , json_value(vd.decodedVINData, '$."Vehicle Type"') as [type]
    , q.vehType as fastType
    , json_value(vd.decodedVINData, '$."Manufacturer Name"') as manName
    , json_value(vd.decodedVINData, '$."Drive Type"') as drive
    , json_value(vd.decodedVINData, '$."Gross Vehicle Weight Rating"') as gvwr
    , json_value(vd.decodedVINData, '$."Body Class"') as body
    , json_value(vd.decodedVINData, '$."Model"') as model
    , q.vehModel as fastModel
    , json_value(vd.decodedVINData, '$."Model Year"') as modelYear
    , q.vehModelYear as fastModelYear
    , json_value(vd.decodedVINData, '$."Make"') as make
    , q.vehMake as fastMake
    , json_value(vd.decodedVINData, '$."Fuel Type - Primary"') as ftp
    , json_value(vd.decodedVINData, '$."Fuel Type - Secondary"') as fts
    , json_value(vd.decodedVINData, '$."Bus Type"') as bt
    , json_value(vd.decodedVINData, '$."Other Bus Info"') as obi
from
    dbo.vldVehicleVINData as vd
    inner join dbo.usv_QueryBuilder_vldVehicles as q
        on vd.vrID = q.vehRowID
where 0=0
    and json_value(vd.decodedVINData, '$."Fuel Type - Primary"') = 'Electric'
;
