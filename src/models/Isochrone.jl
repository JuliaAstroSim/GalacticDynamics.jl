"""
$(TYPEDSIGNATURES)
"""
function potential(r, b, M, G, ::Isochrone)
    return -G*M/(b+sqrt(b^2+r^2))
end

"""
$(TYPEDSIGNATURES)
"""
function density(r, b, G, M, ::Isochrone)
    a = sqrt(b^2+r^2)
    return M * (3*(b+z) * a^2 - r^2 * (b+3a)) / (4π * (b+a)^3 * a^3)
end

"""
$(TYPEDSIGNATURES)
"""
function velocity_circular(r, b, G, M, ::Isochrone)
    return sqrt((G*M*r^2)/(a*(b+a)^2))
end