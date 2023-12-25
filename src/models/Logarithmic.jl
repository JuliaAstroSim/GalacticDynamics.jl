"""
$(TYPEDSIGNATURES)
"""
function potential(R, z, v0, Rc, q_phi, C, ::Logarithmic)
    return 0.5*v0^2*ln(Rc^2 + R^2 + z^2/q_phi^2) + C
end

"""
$(TYPEDSIGNATURES)
"""
function density(R, z, v0, Rc, q_phi, G, ::Logarithmic)
    return v0^2/(4π*G*q_phi^2) * ((2*q_phi^2 + 1)*Rc^2 + R^2 + (2-q_phi^-2)*z^2) / (Rc^2 + R^2 + z^2*q_phi^-2)^2
end
