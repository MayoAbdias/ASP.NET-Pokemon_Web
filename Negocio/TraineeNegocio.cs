using Dominio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class TraineeNegocio
    {
        public void Actualizar(Trainee user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update USERS set nombre = @nombre, apellido = @apellido, imagenPerfil = @imagenPerfil, fechaNacimiento = @fecha Where id = @Id");
                datos.setearParametro("@id", user.Id);
                datos.setearParametro("@nombre",user.Nombre);
                datos.setearParametro("@apellido",user.Apellido);
                datos.setearParametro("fecha", user.FechaNacimiento);
                datos.setearParametro("@imagenPerfil", user.ImagenPerfil != null ? user.ImagenPerfil : "");

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int insetarNuevo(Trainee nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();

                
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public bool login(Trainee trainee)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("Select id, email, pass, admin, imagenPerfil,nombre, apellido, fechaNacimiento From USERS Where email = @email AND pass = @pass");
                datos.setearParametro("@email", trainee.Email);
                datos.setearParametro("@pass", trainee.Pass);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    trainee.Id = (int)datos.Lector["id"];
                    trainee.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        trainee.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        trainee.Apellido = (string)datos.Lector["apellido"];
                    if (!(datos.Lector["fechaNacimiento"] is DBNull))
                        trainee.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());                    
                    if(!(datos.Lector["imagenPerfil"] is DBNull))                    
                        trainee.ImagenPerfil = (string)datos.Lector["imagenPerfil"];                    
                       
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }
    }
}
