var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "GeoMapping",
    "title": "GeoMapping",
    "category": "page",
    "text": ""
},

{
    "location": "#GeoMapping.azimuth-NTuple{4,Any}",
    "page": "GeoMapping",
    "title": "GeoMapping.azimuth",
    "category": "method",
    "text": "az = azimuth(lat1,lon1,lat2,lon2)\n\nCompute azimuth, i.e. the angle between the line segment defined by the points (lat1,lon1) and (lat2,lon2) and the North. The units of all input and output parameters are degrees.\n\n\n\n\n\n"
},

{
    "location": "#GeoMapping.distance-NTuple{4,Any}",
    "page": "GeoMapping",
    "title": "GeoMapping.distance",
    "category": "method",
    "text": "d = distance(lat1,lon1,lat2,lon2)\n\nCompute the great-circle distance between the points (lat1,lon1) and (lat2,lon2). The units of all input and output parameters are degrees.\n\n\n\n\n\n"
},

{
    "location": "#GeoMapping.reckon-NTuple{4,Any}",
    "page": "GeoMapping",
    "title": "GeoMapping.reckon",
    "category": "method",
    "text": "lato,lono = reckon(lat,lon,range,azimuth)\n\nCompute the coordinates of the end-point of a displacement on a sphere. lat,lon are the coordinates of the starting point, range is the covered distance of the displacements along a great circle and azimuth is the direction of the displacement relative to the North. The units of all input and output parameters are degrees. This function can also be used to define a spherical coordinate system with rotated poles.\n\n\n\n\n\n"
},

{
    "location": "#GeoMapping-1",
    "page": "GeoMapping",
    "title": "GeoMapping",
    "category": "section",
    "text": "GeoMapping Julia package repo.Modules = [GeoMapping]"
},

]}
