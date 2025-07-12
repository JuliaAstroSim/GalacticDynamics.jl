module GalacticDynamics

using DocStringExtensions
using PrecompileTools
using Unitful, UnitfulAstro
using DifferentialEquations
using SpecialFunctions
using PhysicalParticles

import Base: length, iterate

export PointMass, Plummer, Isochrone, Jaffe, Hernquist, NFW, cNFW, gNFW, TwoPower, Kuzmin, Zhao, ZhaoQ
export MigamotoNagai, Logarithmic
export ExponentialDisc, ExponentialDiscWithHole
export Burkert, BetaModel
export SersicIntensity, SersicDensity, SersicDeprojectedDensity, Sersic_3D_central_density, Sersic_3D_total_mass
export IsothermalSingular, IsothermalNonsingular, IsothermalModified
export Bulge

export scale_radius
export density, potential, mass_interior
export velocity_circular, velocity_escape, frequency_circular
export milkyway_zhu2023how
export Poisson_radial, solve_Poisson
export mass_profile
export rotation_curve

include("Traits.jl")

include("models/PointMass.jl")
include("models/Plummer.jl")
include("models/Isochrone.jl")
include("models/Jaffe.jl")
include("models/Hernquist.jl")
include("models/NFW.jl")
include("models/Kuzmin.jl")
include("models/Logarithmic.jl")
include("models/Zhao.jl")
include("models/Burkert.jl")
include("models/BetaModel.jl")
include("models/Sersic.jl")
include("models/Isothermal.jl")
include("models/TwoPower.jl")
include("models/Bulge.jl")
include("models/ExponentialDisc.jl")

include("galaxies/MilkyWay.jl")
include("galaxies/M31.jl")

include("equations/Equations.jl")

include("params/milkyway_zhu2023how.jl")

include("precompile.jl")

end # module GalacticDynamics
