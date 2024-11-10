"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Bulge <: GalacticModel
    q
    "central density"
    ρ₀_b
    "scale radius"
    r_s
    α
    "cut radius"
    r_cut
end
scale_radius(model::Bulge) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::Bulge, R, z)
    r_c = sqrt(R^2 + z^2/model.q^2) # cylinkrical coordinates
    return model.ρ₀_b / (1+r_c/model.r_s)^model.α * exp(-(r_c/model.r_cut)^2)
end