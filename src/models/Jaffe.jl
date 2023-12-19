function mass_interior(r, a, ρ₀, ::Jaffe)
    return 4π*ρ₀*a^3 * (r/a) / (1+r/a)
end

function potential(r, a, ρ₀, G, ::Jaffe)
    return -4π*G*ρ₀*a^2 * ln(1+a/r)
end