function mass_interior(r, a, ρ₀, ::NFW)
    return 4π*ρ₀*a^3 * (ln(1+r/a) - (r/a)/(1+r/a))
end

function potential(r, a, ρ₀, G, ::NFW)
    return -4π*G*ρ₀*a^2 * ln(1+a/r)*a/r
end