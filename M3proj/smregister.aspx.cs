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
    public partial class smregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerm(object sender, EventArgs e)
        {

            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String name = smname.Text;
            String username = uname.Text;
            String pass = password.Text;
            String sname = stname.Text;

            SqlCommand
            addStadiumManagerProc = new SqlCommand("addStadiumManager", conn);
            addStadiumManagerProc.CommandType = CommandType.StoredProcedure;
            addStadiumManagerProc.Parameters.Add(new SqlParameter("@name", name));
            addStadiumManagerProc.Parameters.Add(new SqlParameter("@stadiumName", sname));
            addStadiumManagerProc.Parameters.Add(new SqlParameter("@username", username));
            addStadiumManagerProc.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            addStadiumManagerProc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}