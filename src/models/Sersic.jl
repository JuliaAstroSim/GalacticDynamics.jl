"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct SersicIntensity <: SersicModel
    I_e
    R_e
    n
end

function intensity(model::SersicIntensity, R)
    return model.I_e * exp(-b_n(model.n) * ((R / model.R_e)^(1/model.n) - 1))
end


"""
$(TYPEDEF)
$(TYPEDFIELDS)
"""
struct SersicDensity <: SersicModel
    rho_0
    R_e
    n
end

"""
$(TYPEDSIGNATURES)
"""
function density(model::SersicDensity, R)
    # @assert 0.6 <= model.n <= 10
    # r = R / model.R_e
    # @assert 1e-2 <= r <= 1e3
    # return model.rho_0 * r^(-p_n(model.n)) * exp(-b_n(model.n) * r^(1/model.n))
    return model.rho_0 * exp(-b_n(model.n) * ((R/model.R_e)^(1/model.n) - 1))
end

"""
$(TYPEDSIGNATURES)
Ref: https://en.wikipedia.org/w/index.php?title=S%C3%A9rsic_profile&oldid=1234980354
"""
function b_n(n)
    @assert n >= 0.36
    return 2*n - 1/3 + 4/(405*n) + 46/(25515*n^2) + 131/(1148175*n^3) - 2194697/(30690717750*n^4)
end

"""
$(TYPEDSIGNATURES)
Ref: Terzić, B. & Graham, A. W. Density-potential pairs for spherical stellar systems with Sérsic light profiles and (optional) power-law cores. MNRAS 362, 197–212 (2005).
"""
function p_n(n)
    return 1 - 0.6097/n + 0.05563/n^2
end
