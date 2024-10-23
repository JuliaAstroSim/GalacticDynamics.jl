"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct NFW <: NFWModel
    "central density"
    ρ₀
    "scale radius"
    a
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::NFW, r)
    return model.ρ₀ / (r/model.a) / (1 + r/model.a)^2
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


"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct gNFW <: NFWModel
    "shape parameter"
    β
    "central density"
    ρ₀
    "scale radius"
    r₀
end

"""
$(TYPEDSIGNATURES)

generalized NFW
"""
function density(model::gNFW, r)
    return model.ρ₀ / (r/model.r₀)^model.β / (1+r/model.r₀)^(3-model.β)
end


"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
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