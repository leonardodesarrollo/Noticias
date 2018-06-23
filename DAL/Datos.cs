using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;

namespace DAL
{
    
    public class Datos
    {
        Database db = DatabaseFactory.CreateDatabase();


        public DataSet getBuscarAlerta()
        {
            DbCommand cmd = db.GetStoredProcCommand("stp_BuscarAlerta");

            //db.AddInParameter(cmd, "@idUsuario", DbType.String, user.IdUsuario);
            //if (user.Rut == string.Empty)
            //{
            //    db.AddInParameter(cmd, "@rut", DbType.String, null);
            //}
            //else
            //{
            //    db.AddInParameter(cmd, "@rut", DbType.String, user.Rut);
            //}
            

            try
            {
                return db.ExecuteDataSet(cmd);
            }
            catch (SqlException ex)
            {
                throw new Exception("No se pudo buscar las busquedas, " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo buscar las busquedas, " + ex.Message, ex);
            }
        }

    }
}
