"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Jaffe <: GalacticModel
    "central density"
    ρ₀
    "scale radius"
    r_s
end
scale_radius(model::Jaffe) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::Jaffe, r)
    return 4π*model.ρ₀*model.r_s^3 * (r/model.r_s) / (1+r/model.r_s)
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::Jaffe, G, r)
    return -4π*G*model.ρ₀*model.r_s^2 * ln(1+model.r_s/r)
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Jaffe, r)
    return model.ρ₀ / (4π) / (r/model.r_s)^2 / (r/model.r_s + 1)^2
end