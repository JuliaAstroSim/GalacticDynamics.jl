"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Kuzmin <: GalacticModel
    M
    a
end

"""
$(TYPEDSIGNATURES)

a must ≥ 0
"""
function potential(model::Kuzmin, G, R, z)
    return -G*model.M/sqrt(R^2 + (model.a + abs(z))^2)
end

"""
$(TYPEDSIGNATURES)

a must ≥ 0
"""
function density_surface(model::Kuzmin, R)
    return model.a*model.M / (2π * (R^2+model.a^2)^1.5)
end