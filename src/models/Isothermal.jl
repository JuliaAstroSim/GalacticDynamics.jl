"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct IsothermalSingular <: GalacticModel
    sigma
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::IsothermalSingular)
    
end

"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct IsothermalNonsingular <: GalacticModel
    sigma
end

"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct IsothermalModified <: GalacticModel
    rho_0
    r_c
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::IsothermalModified, r)
    return model.rho_0 / (1 + r^2 / model.r_c^2)
end