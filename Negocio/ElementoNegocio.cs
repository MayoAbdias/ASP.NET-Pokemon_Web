﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ElementoNegocio
    {
        public List<Elemento> listar() 
		{ 

			List<Elemento> lista = new List<Elemento>();
			AccesoDatos datos = new AccesoDatos();	
        
			try
			{
				datos.setearConsulta("Select id, Descripcion from ELEMENTOS");
				datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
					Elemento aux = new Elemento();
					aux.Id = (int)datos.Lector["id"];
					aux.Descripcion = (string)datos.Lector["Descripcion"];

					lista.Add(aux);
                }

                return lista;
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
