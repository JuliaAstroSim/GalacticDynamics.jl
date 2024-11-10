"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct ExponentialDisc <: GalacticModel
    "central surface density"
    Σ₀
    "scale radius"
    R_d
    "scale height"
    z_d
end
scale_radius(model::ExponentialDisc) = model.R_d

"""
$(TYPEDSIGNATURES)
"""
function density(model::ExponentialDisc, R, z)
    return model.Σ₀ / 2 / model.z_d * exp(-abs(z)/model.z_d - R/model.R_d)
end


"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct ExponentialDiscWithHole <: GalacticModel
    "central surface density"
    Σ₀
    "scale radius"
    R_d
    "scale height"
    z_d
    "associated scalelength of the central hole"
    R_m
end
scale_radius(model::ExponentialDiscWithHole) = model.R_d

"""
$(TYPEDSIGNATURES)
"""
function density(model::ExponentialDiscWithHole, R, z)
    return model.Σ₀ / 2 / model.z_d * exp(-model.R_m/R - R/model.R_d) * sech(z/2/model.z_d)^2
end