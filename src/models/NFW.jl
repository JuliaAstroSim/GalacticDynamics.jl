struct NFW <: NFWModel
    a
    ρ₀
end

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::NFW, r)
    return 4π*model.ρ₀*model.a^3 * (ln(1+r/model.a) - (r/model.a)/(1+r/model.a))
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::NFW, G, r)
    return -4π*G*model.ρ₀*model.a^2 * ln(1+model.a/r)*model.a/r
end


struct gNFW <: NFWModel
    β
    ρ₀
    r₀
end

"""
$(TYPEDSIGNATURES)

generalized NFW
"""
function density(model::gNFW, r)
    return model.ρ₀ / (r/model.r₀)^model.β / (1+r/model.r₀)^(3-model.β)
end


struct cNFW <: NFWModel
    b
    ρ₀
    r₀
end

"""
$(TYPEDSIGNATURES)

cored NFW
"""
function density(model::cNFW, r)
    return model.b*model.ρ₀ / (1+model.b*r/model.r₀) / (1+r/model.r₀)^2
end