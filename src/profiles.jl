function density(r, a, ρ₀, α, β, ::TwoPower)
    return ρ₀ / (r/a)^α / (1+r/a)^(β-α)
end