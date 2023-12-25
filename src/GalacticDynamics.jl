module GalacticDynamics

using DocStringExtensions
using PrecompileTools
using Unitful, UnitfulAstro
using PhysicalParticles

export PointMass, Plummer, Isochrone, Jaffe, Hernquist, NFW, TwoPower, Kuzmin, Zhao,
    MigamotoNagai, Logarithmic, MestelDisk, ExponentialDisk, ThickDisk
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

include("MilkyWay/MilkyWay.jl")

include("params/milkyway_zhu2023how.jl")

include("precompile.jl")

end # module GalacticDynamics
