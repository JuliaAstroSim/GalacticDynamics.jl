"""
$(TYPEDSIGNATURES)
"""
function mass_interior(r, a, ρ₀, ::NFW)
    return 4π*ρ₀*a^3 * (ln(1+r/a) - (r/a)/(1+r/a))
end

"""
$(TYPEDSIGNATURES)
"""
function potential(r, a, ρ₀, G, ::NFW)
    return -4π*G*ρ₀*a^2 * ln(1+a/r)*a/r
end

"""
$(TYPEDSIGNATURES)

generalized NFW
"""
function density(r, β, ρ₀, r₀, ::NFW)
    return ρ₀ / (r/r₀)^β / (1+r/r₀)^(3-β)
end

"""
$(TYPEDSIGNATURES)

cored NFW
"""
function density(r, b, ρ₀, r₀, ::cNFW)
    return b*ρ₀ / (1+b*r/r₀) / (1+r/r₀)^2
end