"""
$(TYPEDSIGNATURES)
"""
function potential(r, M, G, ::PointMass)
    return -G*M/r
end

"""
$(TYPEDSIGNATURES)
"""
function frequency_circular(r, M, G, ::PointMass)
    return sqrt(G*M/r^3)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_escape(r, M, G, ::PointMass)
    return sqrt(2*G*M/r)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_circular(r, M, G, ::PointMass)
    return sqrt(G*M/r)
end