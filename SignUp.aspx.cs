using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;

namespace Grocery_Demo
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=DESKTOP-3RIA5FI; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("MatchTokenNumber", con);
            cmd.Parameters.AddWithValue("@TokenNo", TextBox6.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();
            if (read.HasRows == false)
            {
                Label7.Text = "Invalid Token Number";
                con.Close();
            }
            
            else
            { 
            string CS1;
            CS1 = "data source=DESKTOP-3RIA5FI; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con1 = new SqlConnection(CS1);
            SqlCommand cmd1 = new SqlCommand("AdminRegistration", con1);
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
            con1.Open();
            cmd1.Parameters.AddWithValue("@AdministratorName", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@AdministratorUsername", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@AdministratorPassword", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@AdministratorPhoneNo", TextBox4.Text);
            cmd1.Parameters.AddWithValue("@AdministratorEmail", TextBox5.Text);
            cmd1.Parameters.AddWithValue("@GroceryBranchName", DropDownList1.SelectedValue);
            cmd1.ExecuteNonQuery();
            MessageBox("You are registered successfully");
            Session["UsernameAdmin"] = TextBox2.Text;
            Session["PasswordAdmin"] = TextBox3.Text;
            Session["BranchAdmin"] = DropDownList1.SelectedValue;
            Response.Redirect("AdminHomepage.aspx");
            con1.Close();
            }
        }

        public void MessageBox(string message)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('" + message + "')</script>");
        }
    }
}