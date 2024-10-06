struct Bulge <: GalacticModel
    q
    ρ₀_b
    r₀
    α
    r_cut
end

function density(model::Bulge, R, z)
    r_c = sqrt(R^2 + z^2/model.q^2) # cylinkrical coordinates
    return model.ρ₀_b / (1+r_c/model.r₀)^model.α * exp(-(r_c/model.r_cut)^2)
end