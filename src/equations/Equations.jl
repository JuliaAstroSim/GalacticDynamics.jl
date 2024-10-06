function Poisson_radial(ddu, du, u, p, r)
	rho = p
    ddu[1] = -2/r*du[1] + 4π * rho(r)
end

function solve_Poisson(model;
    rMin = 0,
    rMax = 5,
)
    
end

function mass_profile(model;
    rMin = 0,
    rMax = 5,
)
    
end

function rotation_curve(model;
    rMin = 0,
    rMax = 0,    
)
    
end