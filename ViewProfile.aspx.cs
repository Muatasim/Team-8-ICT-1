using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Grocery_Demo
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("ViewProfile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            if (Session["UsernameAdmin"] != null)
            {
              string UsernameAdmin = Session["UsernameAdmin"].ToString();
              cmd.Parameters.AddWithValue("@AdministratorUsername", UsernameAdmin);
            }

            else
            {
                Response.Redirect("SignIn.aspx");
            }

            Label1.Text = Session["BranchAdmin"].ToString();
            Label2.Text = Session["UsernameAdmin"].ToString();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();


            Label3.Text = (string)read["Administrator_Name"];
            Label4.Text = (string)read["Administrator_Username"];
            Label5.Text = (string)read["Administrator_Password"];
            Label6.Text = (string)read["Administrator_Phone_No"];
            Label7.Text = (string)read["Administrator_Email"];

            con.Close();
         
        }
    }
}