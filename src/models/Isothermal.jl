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
function density(model::IsothermalSingular, r, G)
    return model.sigma^2 / (2π * G * r^2)
end

"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct IsothermalNonsingular <: GalacticModel
    rho0
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