struct Isochrone <: GalacticModel
    M
    b
end

"""
$(TYPEDSIGNATURES)
"""
function potential(model::Isochrone, G, r)
    return -G*model.M/(model.b+sqrt(model.b^2+r^2))
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Isochrone, G, r)
    a = sqrt(model.b^2+r^2)
    return model.M * (3*(model.b+z) * a^2 - r^2 * (model.b+3a)) / (4π * (model.b+a)^3 * a^3)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_circular(model::Isochrone, G, r)
    a = sqrt(model.b^2+r^2)
    return sqrt((G*model.M*r^2)/(a*(model.b+a)^2))
end