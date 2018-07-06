using GeoMapping

if VERSION >= v"0.7.0-beta.0"
    using Test
else
    using Base.Test
end

@test azimuth(0,0,1,0) ≈ 0;
@test azimuth(0,0,0,1) ≈ 90;


@test distance(0,0,1,0) ≈ 1;
@test distance(0,0,90,0) ≈ 90;
@test distance(0,0,0,180) ≈ 180;
@test distance(0,0,0,270) ≈ 90;
@test distance(1,2,3,4) ≈ 2.82749366820155;

@test distance(43.016666412353515625,3.3333332538604736328125,43.016666412353515625,3.3333332538604736328125) ≈ 0


lato,lono = reckon(30,-80,20,40);
@test lato ≈ 44.16661401448592
@test lono ≈ -62.15251496909770

lato,lono = reckon(-30,80,[5, 10],[40, 45]);
@test lato ≈ [-26.12155703039504, -22.70996703614572]
@test lono ≈ [83.57732793979254,  87.64920016442251]

lato,lono = reckon([-30, 31],[80, 81],[5, 10],[40, 45]);
@test lato ≈ [-26.12155703039504,  37.76782079033356]
@test lono ≈ [83.57732793979254,  89.93590456974810]

