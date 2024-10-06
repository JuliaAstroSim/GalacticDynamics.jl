struct TwoPower <: GalacticModel
    ρ₀
    a
    α
    β
end

function density(model::TwoPower, r)
    return model.ρ₀ / (r/model.a)^model.α / (1+r/model.a)^(model.β-model.α)
end