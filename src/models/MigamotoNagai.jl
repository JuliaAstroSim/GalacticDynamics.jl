"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct MigamotoNagai <: GalacticModel
    M
    a
    b
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::::MigamotoNagai, G, R, z)
    return -G*model.M/sqrt(R^2 + (model.a + sqrt(z^2 + model.b^2))^2)
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::::MigamotoNagai, R, z)
    return model.b^2*model.M / (4π) * (model.a*R^2 + (model.a+3*sqrt(z^2+model.b^2))*(model.a+sqrt(z^2+model.b^2))^2) / ((R^2+(model.a+sqrt(z^2+model.b^2))^2)^2.5 * (z^2+model.b^2)^1.5)
end