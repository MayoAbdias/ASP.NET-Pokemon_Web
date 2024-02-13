using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Services
{
    public static class Seguridad
    {
        public static bool sesionActiva(object user)
        {
            //                Si es distinto de null lo transformo en un trainee si no queda null
            Trainee trainee = user != null ? (Trainee)user : null;
            if (trainee != null && trainee.Id != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
               
        }
        public static bool EsAdmin(object user)
        {
            Trainee trainee = user != null ? (Trainee)user : null;
            return trainee != null ? trainee.Admin : false;
        }
    }
}
