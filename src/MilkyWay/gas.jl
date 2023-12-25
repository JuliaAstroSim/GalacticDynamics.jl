"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498

- `R_m`: associated scalelength of the central hole
"""
function density(R, z, Σ₀, R_d, z_d, R_m, ::MilkyWayGases)
    return Σ₀ / 2 / z_d * exp(-R_m/R - R/R_d) * sech(z/2/z_d)^2
end