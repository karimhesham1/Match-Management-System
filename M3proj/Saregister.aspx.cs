using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3proj
{
    public partial class Saregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String name = saname.Text;
            String rusername = uname.Text;
            String rpass = password.Text;


            SqlCommand addAssociationManagerProc = new SqlCommand("addAssociationManager", conn);
            addAssociationManagerProc.CommandType = CommandType.StoredProcedure;
            addAssociationManagerProc.Parameters.Add(new SqlParameter("@name", name));
            addAssociationManagerProc.Parameters.Add(new SqlParameter("@userName", rusername));
            addAssociationManagerProc.Parameters.Add(new SqlParameter("@password", rpass));

            conn.Open();
            addAssociationManagerProc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");

        }
    }
}