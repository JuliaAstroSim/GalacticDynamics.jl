"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct BetaModel <: GalacticModel
    β
    "central density"
    ρ₀
    "scale radius"
    r_s
end
scale_radius(model::BetaModel) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::BetaModel, r)
    return model.ρ₀ / (1+(r/model.r_s)^2)^(1.5*model.β)
end