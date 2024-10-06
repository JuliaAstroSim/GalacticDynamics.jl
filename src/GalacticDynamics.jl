module GalacticDynamics

using DocStringExtensions
using PrecompileTools
using Unitful, UnitfulAstro
using PhysicalParticles

import Base: length, iterate

export PointMass, Plummer, Isochrone, Jaffe, Hernquist, NFW, TwoPower, Kuzmin, Zhao,
    MigamotoNagai, Logarithmic,
    ExponentialDisc, ExponentialDiscWithHole,
    Burkert, BetaModel, cNFW,
    SersicModel, SersicIntensity, SersicDensity,
    IsothermalSingular, IsothermalNonSingular
export MilkyWayBulge, MilkyWayDiscs, MilkyWayGases
export density, potential, mass_interior
export velocity_circular, velocity_escape, frequency_circular
export milkyway_zhu2023how

include("Traits.jl")

include("profiles.jl")
include("models/PointMass.jl")
include("models/Plummer.jl")
include("models/Isochrone.jl")
include("models/Jaffe.jl")
include("models/Hernquist.jl")
include("models/NFW.jl")
include("models/Kuzmin.jl")
include("models/Logarithmic.jl")
include("models/Zhao.jl")
include("models/MigamotoNagai.jl")
include("models/Burkert.jl")
include("models/BetaModel.jl")
include("models/Sersic.jl")
include("models/Isothermal.jl")
include("models/TwoPower.jl")
include("models/ExponentialDisc.jl")

include("galaxies/MilkyWay.jl")
include("galaxies/M31.jl")

include("params/milkyway_zhu2023how.jl")

include("precompile.jl")

end # module GalacticDynamics
