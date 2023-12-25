"""
$(TYPEDSIGNATURES)
"""
function potential(R, z, a, b, M, G, ::MigamotoNagai)
    return -G*M/sqrt(R^2 + (a + sqrt(z^2 + b^2))^2)
end

"""
$(TYPEDSIGNATURES)
"""
function density(R, z, a, b, M, ::MigamotoNagai)
    return b^2*M / (4π) * (a*R^2 + (a+3*sqrt(z^2+b^2))*(a+sqrt(z^2+b^2))^2) / ((R^2+(a+sqrt(z^2+b^2))^2)^2.5 * (z^2+b^2)^1.5)
end