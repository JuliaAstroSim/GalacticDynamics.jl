"""
$(TYPEDSIGNATURES)

a must ≥ 0
"""
function potential(R, z, a, M, G, ::Kuzmin)
    return -G*M/sqrt(R^2 + (a + abs(z))^2)
end

"""
$(TYPEDSIGNATURES)

a must ≥ 0
"""
function density_surface(R, a, M, ::Kuzmin)
    return a*M / (2π * (R^2+a^2)^1.5)
end