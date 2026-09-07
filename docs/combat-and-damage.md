# Combat And Damage

`scr_damage` centralizes damage application. It checks whether a target exists, respects invincibility frames, subtracts health, applies knockback, plays feedback, and handles death behavior.

A damageable object must initialize the fields the system needs, such as health, invincibility timers, previous position, and knockback values.

## Capability Contracts

A capability contract is a promise that an object has certain fields or callbacks. It is safer to define that promise clearly than to guess whether an object supports it.

Some older damage code uses reflective checks and player-specific state callbacks. Treat those as legacy behavior until the complete target hierarchy is reviewed.

Weapons create projectiles or traps. Projectiles usually own their lifetime and collision behavior, while weapons decide what to create and when.
