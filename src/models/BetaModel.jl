struct BetaModel <: GalacticModel
    β
    ρ₀
    r₀
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::BetaModel, r)
    return model.ρ₀ / (1+(r/model.r₀)^2)^(1.5*model.β)
end