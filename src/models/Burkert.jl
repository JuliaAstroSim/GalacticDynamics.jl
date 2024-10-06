struct Burkert <: GalacticModel
    ρ₀
    r₀
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Burkert, r)
    return model.ρ₀ / (1+r/model.r₀) / (1+(r/model.r₀)^2)
end