"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct NFW <: NFWModel
    "central density"
    ρ₀
    "scale radius"
    r_s
end
scale_radius(model::NFW) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::NFW, r)
    return model.ρ₀ / (r/model.r_s) / (1 + r/model.r_s)^2
end

"""
$(TYPEDSIGNATURES)
"""
function mass_interior(model::NFW, r)
    return 4π*model.ρ₀*model.r_s^3 * (ln(1+r/model.r_s) - (r/model.r_s)/(1+r/model.r_s))
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::NFW, G, r)
    return -4π*G*model.ρ₀*model.r_s^2 * ln(1+model.r_s/r)*model.r_s/r
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
    r_s
end

"""
$(TYPEDSIGNATURES)

generalized NFW
"""
function density(model::gNFW, r)
    return model.ρ₀ / (r/model.r_s)^model.β / (1+r/model.r_s)^(3-model.β)
end


"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct cNFW <: NFWModel
    b
    "central density"
    ρ₀
    "scale radius"
    r_s
end

"""
$(TYPEDSIGNATURES)

cored NFW
"""
function density(model::cNFW, r)
    return model.b*model.ρ₀ / (1+model.b*r/model.r_s) / (1+r/model.r_s)^2
end