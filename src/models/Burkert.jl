"""
$(TYPEDSIGNATURES)
"""
function density(r, ρ₀, r₀, ::Burkert)
    return ρ₀ / (1+r/r₀) / (1+(r/r₀)^2)
end