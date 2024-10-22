"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct Logarithmic <: GalacticModel
    v0
    Rc
    q_phi
end

"""
$(TYPEDSIGNATURES)

The constant is omitted
"""
function potential(model::Logarithmic, R, z)
    return 0.5*model.v0^2*ln(model.Rc^2 + R^2 + z^2/model.q_phi^2)
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Logarithmic, G, R, z)
    return model.v0^2/(4π*G*model.q_phi^2) * ((2*model.q_phi^2 + 1)*model.Rc^2 + R^2 + (2-model.q_phi^-2)*z^2) / (model.Rc^2 + R^2 + z^2*model.q_phi^-2)^2
end
