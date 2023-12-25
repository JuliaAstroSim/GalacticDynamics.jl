"""
$(TYPEDSIGNATURES)

Ref: Zhu et al 2023, MNRAS 519, 4479-4498

Returns profiles `(ρ_bulge(R,z), ρ_discs(R,z), ρ_gas(R,z), ρ_halo(r))`
"""
function milkyway_zhu2023how()
    C = Constant(uAstro)

    ρ_bulge = (R,z)->density(R, z, 0.5, 9.5e10u"Msun/kpc^3", 0.075u"kpc", C.G, 2.1u"kpc", MilkyWayBulge())

    # stellar discs
    ρ_discs = (R,z)->density(R, z, 1003.12u"Msun/pc^2", 2.42u"kpc", 0.3u"kpc", MilkyWayDiscs())+
                     density(R, z,  167.93u"Msun/pc^2", 3.17u"kpc", 0.9u"kpc", MilkyWayDiscs())

    ρ_gas = (R,z)->density(R, z,   53.1u"Msun/pc^2", 7.0u"kpc", 0.085u"kpc",  4.0u"kpc", MilkyWayGases())+
                   density(R, z, 2179.5u"Msun/pc^2", 1.5u"kpc", 0.045u"kpc", 12.0u"kpc", MilkyWayGases())

    ρ_halo = (r)->density(r, 1.55e7u"Msun/kpc^3", 11.75u"kpc", 1.19, 2.95, 0.95, Zhao())
    
    return ρ_bulge, ρ_discs, ρ_gas, ρ_halo
end