"""
$(TYPEDSIGNATURES)
"""
function potential(r, b, M, G, ::Plummer)
    return -(G*M)/sqrt(r^2+b^2)
end

"""
$(TYPEDSIGNATURES)
"""
function density(r, b, M, ::Plummer)
    return 3*M/(4π*b^3)/(1+r^2/b^2)^2.5
end