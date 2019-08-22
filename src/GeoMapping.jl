module GeoMapping

if VERSION < v"0.7.0-beta.0"
    using Compat
end

export distance, azimuth, reckon

"""
    d = distance(lat1,lon1,lat2,lon2)

Compute the great-circle distance between the points (`lat1`,`lon1`) and (`lat2`,`lon2`).
The units of all input and output parameters are degrees.
"""
function distance(lat1,lon1,lat2,lon2)
    #https://en.wikipedia.org/w/index.php?title=Great-circle_distance&oldid=749078136#Computational_formulas

    Δλ = π/180 * (lon2 - lon1)
    ϕ1 = π/180 * lat1
    ϕ2 = π/180 * lat2

    cosΔσ = sin(ϕ1)*sin(ϕ2) + cos(ϕ1)*cos(ϕ2)*cos(Δλ)

    eins = one(cosΔσ)
    cosΔσ = max(min(cosΔσ,eins),-eins)
    Δσ = acos(cosΔσ)
    return 180/π * Δσ
end

"""
    az = azimuth(lat1,lon1,lat2,lon2)

Compute azimuth, i.e. the angle between the line segment defined by the points (`lat1`,`lon1`) and (`lat2`,`lon2`)
and the North.
The units of all input and output parameters are degrees.
"""
function azimuth(lat1,lon1,lat2,lon2)
    # https://en.wikipedia.org/w/index.php?title=Azimuth&oldid=750059816#Calculating_azimuth

    Δλ = π/180 * (lon2 - lon1)
    ϕ1 = π/180 * lat1
    ϕ2 = π/180 * lat2

    α = atan(sin(Δλ), cos(ϕ1)*tan(ϕ2) - sin(ϕ1)*cos(Δλ))
    return 180/π * α
end

# Base on reckon from myself
# https://sourceforge.net/p/octave/mapping/ci/3f19801d4b93d3b3923df9fa62d268660e5cb4fa/tree/inst/reckon.m
# relicenced to LGPL-v3

"""
    lato,lono = reckon(lat,lon,range,azimuth)

Compute the coordinates of the end-point of a displacement on a
sphere. `lat`,`lon` are the coordinates of the starting point, `range`
is the covered distance of the displacements along a great circle and
`azimuth` is the direction of the displacement relative to the North.
The units of all input and output parameters are degrees.
This function can also be used to define a spherical coordinate system
with rotated poles.
"""
function reckon(lat,lon,range,azimuth)

    # convert to radian
    d = π/180

    lat = lat*d
    lon = lon*d
    range = range*d
    azimuth = azimuth*d

    tmp = sin.(lat).*cos.(range) + cos.(lat).*sin.(range).*cos.(azimuth)

    # clip tmp to -1 and 1
    eins = one(eltype(tmp))
    tmp = max.(min.(tmp,eins),-eins)

    lato = pi/2 .- acos.(tmp)

    cos_gamma = (cos.(range) - sin.(lato).*sin.(lat))./(cos.(lato).*cos.(lat))
    sin_gamma = sin.(azimuth).*sin.(range)./cos.(lato)

    gamma = atan.(sin_gamma,cos_gamma)

    lono = lon .+ gamma

    # bring the lono in the interval [-pi pi[

    lono = mod.(lono .+ pi,2*pi) .- pi

    # convert to degrees

    lono = lono/d
    lato = lato/d

    return lato,lono
end




end
