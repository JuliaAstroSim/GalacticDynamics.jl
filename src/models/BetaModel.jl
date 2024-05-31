"""
$(TYPEDSIGNATURES)
"""
function density(r, β, ρ₀, r₀, ::BetaModel)
    return ρ₀ / (1+(r/r₀)^2)^(1.5*β)
end