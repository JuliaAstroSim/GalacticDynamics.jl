"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498
"""
function density(R, z, q, ρ₀_b, r₀, α, r_cut, ::MilkyWayBulge)
    r_c = sqrt(R^2 + z^2/q^2) # cylinkrical coordinates
    return ρ₀_b / (1+r_c/r₀)^α * exp(-(r_c/r_cut)^2)
end