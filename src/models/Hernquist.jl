"""
$(TYPEDSIGNATURES)
"""
function mass_interior(r, a, ρ₀, ::Hernquist)
    return 4π*ρ₀*a^3 * 0.5*(r/a)^2 / (1+r/a)^2
end

"""
$(TYPEDSIGNATURES)
"""
function potential(r, a, ρ₀, G, ::Hernquist)
    return -4π*G*ρ₀*a^2 / 2 / (1+r/a)
end