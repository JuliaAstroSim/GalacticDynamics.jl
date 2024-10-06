struct Plummer <: GalacticModel
    M
    b
end


"""
$(TYPEDSIGNATURES)
"""
function potential(model::Plummer, G, r)
    return -(G*model.M)/sqrt(r^2 + model.b^2)
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::Plummer, r)
    return 3*model.M/(4π*model.b^3)/(1 + r^2/model.b^2)^2.5
end