"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498
"""
function density(R, z, q, ρ₀_b, r₀, α, r_cut, ::MilkyWayBulge)
    r_c = sqrt(R^2 + z^2/q^2) # cylinkrical coordinates
    return ρ₀_b / (1+r_c/r₀)^α * exp(-(r_c/r_cut)^2)
end

"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498
"""
function density(R, z, Σ₀, R_d, z_d, ::MilkyWayDiscs)
    return Σ₀ / 2 / z_d * exp(-abs(z)/z_d - R/R_d)
end

"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498

- `R_m`: associated scalelength of the central hole
"""
function density(R, z, Σ₀, R_d, z_d, R_m, ::MilkyWayGases)
    return Σ₀ / 2 / z_d * exp(-R_m/R - R/R_d) * sech(z/2/z_d)^2
end

