subroutine exact

use arrays
use global_parameters


implicit none

phi_exact = 0.50d0*amplitude*exp( -(x - x0 - t)**2/sigma**2 ) & 
          + 0.50d0*amplitude*exp( -(x - x0 + t)**2/sigma**2 )

error_phi = phi_exact - phi


end subroutine exact
