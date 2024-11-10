"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Burkert <: GalacticModel
    "central density"
    ρ₀
    "scale radius"
    r₀
end
scale_radius(model::Burkert) = model.r₀

"""
$(TYPEDSIGNATURES)
"""
function density(model::Burkert, r)
    return model.ρ₀ / (1+r/model.r₀) / (1+(r/model.r₀)^2)
end