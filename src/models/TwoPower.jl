"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct TwoPower <: GalacticModel
    "central density"
    ρ₀
    "scale radius"
    r_s
    α
    β
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::TwoPower, r)
    return model.ρ₀ / (r/model.r_s)^model.α / (1+r/model.r_s)^(model.β-model.α)
end