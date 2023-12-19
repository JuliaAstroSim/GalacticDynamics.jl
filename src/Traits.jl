abstract type GalacticModel end
struct PointMass <: GalacticModel end
struct Plummer <: GalacticModel end
struct Isochrone <: GalacticModel end
struct Jaffe <: GalacticModel end
struct Hernquist <: GalacticModel end
struct NFW <: GalacticModel end
struct TwoPower <: GalacticModel end