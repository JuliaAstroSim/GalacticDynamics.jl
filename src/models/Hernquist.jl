struct Hernquist <: GalacticModel
    a
    ρ₀
end

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::Hernquist, r)
    return 4π*model.ρ₀*model.a^3 * 0.5*(r/model.a)^2 / (1+r/model.a)^2
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::Hernquist, G, r)
    return -4π*G*model.ρ₀*model.a^2 / 2 / (1+r/model.a)
end