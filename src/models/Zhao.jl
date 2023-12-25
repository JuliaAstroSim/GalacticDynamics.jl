"""
$(TYPEDSIGNATURES)
"""
function density(r, ρ₀_h, r_h, α, β, γ, ::Zhao)
    return ρ₀_h / (r/r_h)^γ * (1 + (r/r_h)^α)^((γ-β)/α)
end