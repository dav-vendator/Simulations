# The Lorentz Attractor
> The Lorenz attractor is an attractor that arises in a simplified system of equations describing the two-dimensional flow of fluid of uniform depth , with an imposed temperature difference , under gravity , with buoyancy , thermal diffusivity , and kinematic viscosity.

## Formulae
<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/5f993e17e16f1c3ea4ad7031353c61164a226bb8"></img>
- Let 
   - σ (sigma) = 10
   - ρ (rho) = 28
   - β (beta) = 2.66667 (8.0 / 3.0)
   - dx/dt => Change in value of x with time.
   - dy/dt => Change in value of y with time.
   - dz/dt => Change in value of z with time (in case of 3D).
   - dt => Change in time.
- Then we can solve for values of x, y and z to draw figure at.
   - dx = (sigma*(y-x) )* dt
   - dy = (x*(rho-z)-y) * dt
   - dz = (x*y - beta*z)*dt
   Hence
      - x = x + dx
      - y = y + dy
      - z = z + dz

## Important points:
> In the code I am keeping an ArrayList for storing vertices ( [x,y,z] ), In every draw loop's iteration, I am drawing the whole figure from start to end which produces nice contunity effects else it would only have been drawing points.

## Demo:
<img src="https://j.gifs.com/nr9XqP.gif"></img>
