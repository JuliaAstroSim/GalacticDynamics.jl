"""
$(TYPEDEF)
$(TYPEDFIELDS)

Sersic profile of surface intensity
"""
struct SersicIntensity <: SersicModel
    "central surface intensity"
    I_e
    "scale radius (actually is the half-light radius R_e)"
    r_s
    "Sersic index"
    n
end

scale_radius(model::SersicIntensity) = model.r_s

function intensity(model::SersicIntensity, R)
    return model.I_e * exp(-b_n(model.n) * ((R / model.r_s)^(1/model.n) - 1))
end


"""
$(TYPEDEF)
$(TYPEDFIELDS)

Sersic profile of surface density
"""
struct SersicDensity <: SersicModel
    "central density"
    ρ₀
    "scale radius (actually is the half-light radius R_e)"
    r_s
    "Sersic index"
    n
end

scale_radius(model::SersicDensity) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::SersicDensity, R)
    return model.ρ₀ * exp(-b_n(model.n) * ((R/model.r_s)^(1/model.n) - 1))
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
$(TYPEDEF)
$(TYPEDFIELDS)

Sersic profile of deprojected 3D density

### Ref: Prugniel, P. & Simien, F. The fundamental plane of early-type galaxies: non-homology of the spatial structure. Astron. Astrophys. 321, 111–122 (1997).
n1 = 0.594
n2 = 0.055

### Ref: Lima Neto, G. B., Gerbal, D. & Marquez, I. The specific entropy of elliptical galaxies: an explanation for profile-shape distance indicators? Mon. Not. R. Astron. Soc. 309, 481–495 (1999).
n1 = 0.6097
n2 = 0.05463
"""
struct SersicDeprojectedDensity <: SersicModel
    "central density"
    ρ₀
    "scale radius (actually is the half-light radius R_e)"
    r_s
    "Sersic index"
    n
    n1
    n2
end

scale_radius(model::SersicDeprojectedDensity) = model.r_s

"""
$(TYPEDSIGNATURES)
"""
function density(model::SersicDeprojectedDensity, r)
    return model.ρ₀ * (r/model.r_s)^(-p_n(model.n, model.n1, model.n2)) * exp(-b_n(model.n) * (r/model.r_s)^(1/model.n))
end

"""
$(TYPEDSIGNATURES)
`p(n) = 1 - n1/n + n2/n^2`

### Ref: Prugniel, P. & Simien, F. The fundamental plane of early-type galaxies: non-homology of the spatial structure. Astron. Astrophys. 321, 111–122 (1997).
p(n) = 1 - 0.594/n + 0.055/n^2

### Ref: Lima Neto, G. B., Gerbal, D. & Marquez, I. The specific entropy of elliptical galaxies: an explanation for profile-shape distance indicators? Mon. Not. R. Astron. Soc. 309, 481–495 (1999).
p(n) = 1 - 0.6097/n + 0.05463/n^2
"""
function p_n(n, n1, n2)
    return 1 - n1/n + n2/n^2
end

function Sersic_3D_central_density(M_tot, R_e, n, n1, n2)
    p_index = (3 - p_n(n, n1, n2)) * n
    return M_tot / (4π * R_e^3 * (n * gamma(p_index)) / b_n(n)^p_index)
end

function Sersic_3D_total_mass(rho0, R_e, n, n1, n2)
    p_index = (3 - p_n(n, n1, n2)) * n
    return 4π * rho0 * R_e^3 * (n * gamma(p_index)) / b_n(n)^p_index
end