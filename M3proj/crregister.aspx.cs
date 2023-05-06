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
    public partial class ClubRepresentativeRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String name = crname.Text;
            String cnamev = cname.Text;
            String rusername = uname.Text;
            String rpass = password.Text;


            SqlCommand addRepresentativeProc = new SqlCommand("addRepresentative", conn);
            addRepresentativeProc.CommandType = CommandType.StoredProcedure;
            addRepresentativeProc.Parameters.Add(new SqlParameter("@rname", name));
            addRepresentativeProc.Parameters.Add(new SqlParameter("@cname", cnamev));
            addRepresentativeProc.Parameters.Add(new SqlParameter("@uname", rusername));
            addRepresentativeProc.Parameters.Add(new SqlParameter("@pass", rpass));

            conn.Open();
            addRepresentativeProc.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }


    }
}