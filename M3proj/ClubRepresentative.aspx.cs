using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Xml.Linq;
using System.Net.NetworkInformation;

namespace M3proj
{
    public partial class ClubRepresentative : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        


        protected void viewupcomingm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String currusername = Session["username"].ToString();

            using (SqlConnection connection = new SqlConnection(sonnStr))
            {
                connection.Open();


                string query = "SELECT club_ID FROM ClubRepresentative WHERE username = @username ";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", currusername);


                SqlDataReader reader = command.ExecuteReader();
                int clubid = 0;

                if (reader.Read())
                {
                    clubid = reader.GetInt32(0);  // retrieve the value as an integer
                    
                          
                }

                reader.Close();

                string query2 = "SELECT name FROM Club WHERE club_ID = @id";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.AddWithValue("@id", clubid);


                SqlDataReader reader2 = command2.ExecuteReader();
                
                string clubname = "";
                if (reader2.Read())
                {
                   // clubnameint = reader2.GetInt32(0);  // retrieve the value as an integer
                    clubname = reader2.GetString(0);  // convert the integer to a string
                }
                reader2.Close();


                String cnamev = clubname;


                SqlCommand upcomingMatchesOfClubfun = new SqlCommand("SELECT * FROM upcomingMatchesOfClub(@name)", conn);
                upcomingMatchesOfClubfun.CommandType = CommandType.Text;
                upcomingMatchesOfClubfun.Parameters.AddWithValue("@name", cnamev);

                conn.Open();
                SqlDataReader rdr = upcomingMatchesOfClubfun.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String coursename = rdr.GetString(rdr.GetOrdinal("host_club_name"));
                    String coursename2 = rdr.GetString(rdr.GetOrdinal("guest_club_name"));
                    String coursename3 = rdr.GetDateTime(rdr.GetOrdinal("start_time")).ToString();
                    String coursename5 = rdr.GetDateTime(rdr.GetOrdinal("end_time")).ToString();
                    String coursename4 = "";
                    if (!rdr.IsDBNull(rdr.GetOrdinal("stadium_name")))
                    {
                        coursename4 = rdr.GetString(rdr.GetOrdinal("stadium_name"));
                        // do something with coursename4
                    }

                    //host guest w endtime

                    Label name = new Label();
                    name.Text = coursename + " vs ";

                    Label name2 = new Label();
                    name2.Text = coursename2 + " ";

                    Label name3 = new Label();
                    name3.Text = coursename3 + " ";

                    Label name5 = new Label();
                    name5.Text = coursename5 + " ";

                    Label name4 = new Label();
                    name4.Text = coursename4 + " ";

                    form1.Controls.Add(name);
                    form1.Controls.Add(name2);
                    form1.Controls.Add(name3);
                    form1.Controls.Add(name5);
                    form1.Controls.Add(name4);
                }


            }




        }

        protected void viewstadiumm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String dateTime = password3.Text + " " + password5.Text;


            SqlCommand viewAvailableStadiumsOnfun = new SqlCommand("SELECT * FROM viewAvailableStadiumsOn(@time)", conn);
            viewAvailableStadiumsOnfun.CommandType = CommandType.Text;
            viewAvailableStadiumsOnfun.Parameters.AddWithValue("@time", dateTime);


            conn.Open();
            SqlDataReader rdr = viewAvailableStadiumsOnfun.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String coursename = rdr.GetString(rdr.GetOrdinal("name"));
                String coursename2 = rdr.GetInt32(rdr.GetOrdinal("capacity")).ToString();
                String coursename3 = rdr.GetString(rdr.GetOrdinal("location"));



                Label name = new Label();
                name.Text = coursename + " ";

                Label name2 = new Label();
                name2.Text = coursename2 + " ";

                Label name3 = new Label();
                name3.Text = coursename3 + " ";



                form1.Controls.Add(name);
                form1.Controls.Add(name2);
                form1.Controls.Add(name3);

            }

        }

        protected void sendrequestm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String currusername = Session["username"].ToString();
            

            using (SqlConnection connection = new SqlConnection(sonnStr))
            {
                connection.Open();

                

                string query = "SELECT club_ID FROM ClubRepresentative WHERE username = @username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", currusername);

                

                SqlDataReader reader = command.ExecuteReader();
                int clubid = 0;

                if (reader.Read())
                {
                    clubid = reader.GetInt32(0);  // retrieve the value as an integer


                }

                reader.Close();

               

                string query2 = "SELECT name FROM Club WHERE club_ID = @id";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.AddWithValue("@id", clubid);


                SqlDataReader reader2 = command2.ExecuteReader();
                int clubnameint = 0;
                string clubname = "";
                if (reader2.Read())
                {
                   // clubnameint = reader2.GetInt32(0);  // retrieve the value as an integer
                    clubname = reader2.GetString(0);  // convert the integer to a string
                }
                reader2.Close();


                String cnamev = clubname;

             

                String snametmp = sname.Text;
                String dateTime = password6.Text + " " + password7.Text;


                SqlCommand addhostreqproc = new SqlCommand("addHostRequest", conn);
                addhostreqproc.CommandType = CommandType.StoredProcedure;
                addhostreqproc.Parameters.Add(new SqlParameter("@clubName", cnamev));
                addhostreqproc.Parameters.Add(new SqlParameter("@stadiumName", snametmp));
                addhostreqproc.Parameters.Add(new SqlParameter("@time", dateTime));


                conn.Open();
                addhostreqproc.ExecuteNonQuery();
                conn.Close();

            }

        }

        protected void viewclubinfom(object sender, EventArgs e)
        {

            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String currusername = Session["username"].ToString();

            using (SqlConnection connection = new SqlConnection(sonnStr))
            {
                connection.Open();



                string query = "SELECT club_ID FROM ClubRepresentative WHERE username = @username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", currusername);



                SqlDataReader reader = command.ExecuteReader();
                int clubid = 0;

                if (reader.Read())
                {
                    clubid = reader.GetInt32(0);  // retrieve the value as an integer


                }

                reader.Close();



                string query2 = "SELECT * FROM Club WHERE club_ID = @id";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.AddWithValue("@id", clubid);

                conn.Open();
                SqlDataReader rdr = command2.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String coursename2 = rdr.GetInt32(rdr.GetOrdinal("Club_ID")).ToString();
                    String coursename = rdr.GetString(rdr.GetOrdinal("name"));
                    String coursename3 = rdr.GetString(rdr.GetOrdinal("location"));



                    Label name = new Label();
                    name.Text = coursename2 + " ";

                    Label name2 = new Label();
                    name2.Text = coursename + " ";

                    Label name3 = new Label();
                    name3.Text = coursename3 + " ";



                    form1.Controls.Add(name);
                    form1.Controls.Add(name2);
                    form1.Controls.Add(name3);

                }


            }    }
    }
}