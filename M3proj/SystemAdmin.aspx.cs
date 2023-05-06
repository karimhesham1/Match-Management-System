using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3proj
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addclubm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String name = cname.Text;
            String loca = loc.Text;

            SqlCommand addClubPro = new SqlCommand("addClub", conn);
            addClubPro.CommandType = CommandType.StoredProcedure;
            addClubPro.Parameters.Add(new SqlParameter("@name", name));
            addClubPro.Parameters.Add(new SqlParameter("@location", loca));

            conn.Open();
            addClubPro.ExecuteNonQuery();
            conn.Close();

            Response.Write("Success");
          
        }

       

        protected void deleteclubm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String c2name = cname2.Text;
            SqlCommand deletClubPro = new SqlCommand("deleteClub", conn);
            deletClubPro.CommandType = CommandType.StoredProcedure;
            deletClubPro.Parameters.Add(new SqlParameter("@sname", c2name));

            conn.Open();
            deletClubPro.ExecuteNonQuery();
            conn.Close();
            Response.Write("Success");
           
        }

        protected void addstadiumm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String stadiumName = sname.Text;
            String stadiumLoc = sloc.Text;
            String stadiumCap = scap.Text;
            SqlCommand addStadiumPro = new SqlCommand("addStadium", conn);
            addStadiumPro.CommandType = CommandType.StoredProcedure;
            addStadiumPro.Parameters.Add(new SqlParameter("@name", stadiumName));
            addStadiumPro.Parameters.Add(new SqlParameter("@location", stadiumLoc));
            addStadiumPro.Parameters.Add(new SqlParameter("@capacity", stadiumCap));

            conn.Open();
            addStadiumPro.ExecuteNonQuery();
            conn.Close();
            Response.Write("Success");

        }

        protected void deletestadiumm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String stadiumName2 = ssname.Text;
            SqlCommand deleteStadiumPro = new SqlCommand("deleteStadium", conn);
            deleteStadiumPro.CommandType = CommandType.StoredProcedure;
            deleteStadiumPro.Parameters.Add(new SqlParameter("@name", stadiumName2));

            conn.Open();
            deleteStadiumPro.ExecuteNonQuery();
            conn.Close();
            Response.Write("Success");

        }

        protected void blockfanm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String nationalID = nid.Text;
            SqlCommand blockFanPro = new SqlCommand("blockFan", conn);
            blockFanPro.CommandType = CommandType.StoredProcedure;
            blockFanPro.Parameters.Add(new SqlParameter("@nationalID", nationalID));

            conn.Open();
            blockFanPro.ExecuteNonQuery();
            conn.Close();
            Response.Write("Success");

        }


    }
}