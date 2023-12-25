"""
$TYPEDSIGNATURES

Ref: Zhu et al 2023, MNRAS 519, 4479-4498
"""
function density(R, z, Σ₀, R_d, z_d, ::MilkyWayDiscs)
    return Σ₀ / 2 / z_d * exp(-abs(z)/z_d - R/R_d)
end