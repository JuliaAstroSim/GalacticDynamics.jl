"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Hernquist <: GalacticModel
    "central density"
    ρ₀
    "scale radius"
    r_s
end
scale_radius(model::Hernquist) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::Hernquist, r)
    return model.ρ₀ / (r/model.r_s) / (1+r/model.r_s)^3
end

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::Hernquist, r)
    return 4π*model.ρ₀*model.r_s^3 * 0.5*(r/model.r_s)^2 / (1+r/model.r_s)^2
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::Hernquist, G, r)
    return -4π*G*model.ρ₀*model.r_s^2 / 2 / (1+r/model.r_s)
end