"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Jaffe <: GalacticModel
    a
    ρ₀
end

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::Jaffe, r)
    return 4π*model.ρ₀*model.a^3 * (r/model.a) / (1+r/model.a)
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::Jaffe, G, r)
    return -4π*G*model.ρ₀*model.a^2 * ln(1+model.a/r)
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Jaffe, r)
    return model.ρ₀ / (r/model.a)^2 / (r/model.a + 1)^2
end