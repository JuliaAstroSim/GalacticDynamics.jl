"""
$(TYPEDSIGNATURES)
"""
function mass_interior(r, a, ρ₀, ::Jaffe)
    return 4π*ρ₀*a^3 * (r/a) / (1+r/a)
end

"""
$(TYPEDSIGNATURES)
"""
function potential(r, a, ρ₀, G, ::Jaffe)
    return -4π*G*ρ₀*a^2 * ln(1+a/r)
end

"""
$(TYPEDSIGNATURES)
"""
function density(r, a, ρ₀, ::Jaffe)
    return ρ₀ / (r/a)^2 / (r/a + 1)^2
end