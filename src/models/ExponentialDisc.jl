"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct ExponentialDisc <: GalacticModel
    Σ₀
    R_d
    z_d
end

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
    Σ₀
    R_d
    z_d
    "associated scalelength of the central hole"
    R_m
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::ExponentialDiscWithHole, R, z)
    return model.Σ₀ / 2 / model.z_d * exp(-model.R_m/R - R/model.R_d) * sech(z/2/model.z_d)^2
end