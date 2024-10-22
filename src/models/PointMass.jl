"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct PointMass <: GalacticModel
    M
end


"""
$(TYPEDSIGNATURES)
"""
function potential(model::PointMass, G, r)
    return -G*model.M/r
end

"""
$(TYPEDSIGNATURES)
"""
function frequency_circular(model::PointMass, G, r)
    return sqrt(G*model.M/r^3)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_escape(model::PointMass, G, r)
    return sqrt(2*G*model.M/r)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_circular(model::PointMass, G, r)
    return sqrt(G*model.M/r)
end