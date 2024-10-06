struct Zhao <: GalacticModel
    ρ₀_halo
    r_halo
    α
    β
    γ
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Zhao, r)
    return model.ρ₀_halo / (r/model.r_halo)^model.γ * (1 + (r/model.r_halo)^model.α)^((model.γ-model.β)/model.α)
end