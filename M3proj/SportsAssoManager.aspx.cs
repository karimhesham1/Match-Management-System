using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace M3proj
{
    public partial class SportsAssoManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void addmatchm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String hostclub = hclubname.Text;
            String guestclub = password0.Text;
            String start = password3.Text + " " + password5.Text;
            String end = password6.Text + " " + password7.Text;
            


            SqlCommand addNewMatchproc = new SqlCommand("addNewMatch", conn);
            addNewMatchproc.CommandType = CommandType.StoredProcedure;
            addNewMatchproc.Parameters.Add(new SqlParameter("@hname", hostclub));
            addNewMatchproc.Parameters.Add(new SqlParameter("@gname", guestclub));
            addNewMatchproc.Parameters.Add(new SqlParameter("@start", start));
            addNewMatchproc.Parameters.Add(new SqlParameter("@end", end));

            conn.Open();
            addNewMatchproc.ExecuteNonQuery();
            conn.Close();

        }

        protected void deletematchm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String hostclub = hclubname.Text;
            String guestclub = password0.Text;
            String start = password3.Text + " " + password5.Text;
            String end = password6.Text + " " + password7.Text;


            SqlCommand deleteMatchproc = new SqlCommand("deleteMatch", conn);
            deleteMatchproc.CommandType = CommandType.StoredProcedure;
            deleteMatchproc.Parameters.Add(new SqlParameter("@hname", hostclub));
            deleteMatchproc.Parameters.Add(new SqlParameter("@gname", guestclub));
            deleteMatchproc.Parameters.Add(new SqlParameter("@start", start));
            deleteMatchproc.Parameters.Add(new SqlParameter("@end", end));


            conn.Open();
            deleteMatchproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void viewupcomingm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            SqlCommand allMatchesview = new SqlCommand("SELECT * FROM allMatches WHERE start_time > CURRENT_TIMESTAMP", conn);
            allMatchesview.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = allMatchesview.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                Label newline = new Label();
                newline.Text = Environment.NewLine;
                form1.Controls.Add(newline);

                String coursename = rdr.GetString(rdr.GetOrdinal("host_club"));
                String coursename2 = rdr.GetString(rdr.GetOrdinal("guest_club"));
                String coursename3 = rdr.GetDateTime(rdr.GetOrdinal("start_time")).ToString();
                String coursename4 = rdr.GetDateTime(rdr.GetOrdinal("end_time")).ToString();
                //String coursename4 = rdr.GetString(rdr.GetOrdinal("stadium_name"));

                //host guest w endtime

                Label name = new Label();
                name.Text = coursename + " vs ";

                Label name2 = new Label();
                name2.Text = coursename2 + "  ";

                Label name3 = new Label();
                name3.Text = coursename3 + "  ";

                Label name4 = new Label();
                name4.Text = coursename4 + "  ";

                

                Label space = new Label();
                space.Text = "**** ";

                form1.Controls.Add(name);
                form1.Controls.Add(space);
                form1.Controls.Add(name2);
                form1.Controls.Add(space);
                form1.Controls.Add(name3);
                form1.Controls.Add(space);
                form1.Controls.Add(name4);
                form1.Controls.Add(space);
                
            }

        }

        protected void alreadyplayedm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            SqlCommand allMatchesview = new SqlCommand("SELECT * FROM allMatches WHERE start_time < CURRENT_TIMESTAMP", conn);
            allMatchesview.CommandType = CommandType.Text;

            conn.Open();
            SqlDataReader rdr = allMatchesview.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String coursename = rdr.GetString(rdr.GetOrdinal("host_club"));
                String coursename2 = rdr.GetString(rdr.GetOrdinal("guest_club"));
                String coursename3 = rdr.GetDateTime(rdr.GetOrdinal("start_time")).ToString();
                String coursename4 = rdr.GetDateTime(rdr.GetOrdinal("end_time")).ToString();
                //String coursename4 = rdr.GetString(rdr.GetOrdinal("stadium_name"));

                //host guest w endtime

                Label name = new Label();
                name.Text = coursename + " vs ";

                Label name2 = new Label();
                name2.Text = coursename2 + " ";

                Label name3 = new Label();
                name3.Text = coursename3 + " ";

                Label name4 = new Label();
                name4.Text = coursename4 + "  ";

                Label space = new Label();
                space.Text = "**** ";

                form1.Controls.Add(name);

                form1.Controls.Add(name2);

                form1.Controls.Add(name3);

                form1.Controls.Add(name4);
                form1.Controls.Add(space);
            }
        }

        protected void nevermatchedm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            SqlCommand clubsnevermatchedview = new SqlCommand("SELECT * FROM clubsNeverMatched", conn);
            clubsnevermatchedview.CommandType = CommandType.Text;
            conn.Open();
            SqlDataReader rdr = clubsnevermatchedview.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String coursename = rdr.GetString(rdr.GetOrdinal("first_club_name"));
                String coursename2 = rdr.GetString(rdr.GetOrdinal("second_club_name"));
               

                Label name = new Label();
                name.Text = coursename + " vs ";

                Label name2 = new Label();
                name2.Text = coursename2 + " ";


                Label space = new Label();
                space.Text = "**** ";

                form1.Controls.Add(name);
                form1.Controls.Add(name2);
                form1.Controls.Add(space);
                

            }
        }
    }
}