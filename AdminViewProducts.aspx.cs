using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Grocery_Demo
{
    public partial class AdminViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsernameAdmin"] != null && Session["PasswordAdmin"] != null && Session["BranchAdmin"] != null)
            {
                string username = Session["UsernameAdmin"].ToString();
                string password = Session["PasswordAdmin"].ToString();
                string branch = Session["BranchAdmin"].ToString();
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminValidation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AdministratorUsername", username);
                cmd.Parameters.AddWithValue("@AdministratorPassword", password);
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                if (read.HasRows == false)
                {
                    Response.Redirect("SignIn.aspx");
                }
                con.Close();
            }

            else
            {
                Response.Redirect("SignIn.aspx");
            }

            Label1.Text = Session["BranchAdmin"].ToString();
            Label2.Text = Session["UsernameAdmin"].ToString();
            DisplayProducts();
        }

       private void DisplayProducts()
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("AdminViewProducts", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }

        protected void Search_Product(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("AdminSearchProduct", con);
            cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text + "%");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();
            if (read.HasRows == false)
            {
                Label3.Text = "Couldn't find your product";
                con.Close();
            }
        }

        protected void View_Option1(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("AdminViewOption1", con);
            cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList1.SelectedValue);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();
            con.Close();            
        }

        protected void View_Option2(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("AdminViewOption2", con);
            cmd.Parameters.AddWithValue("@GroceryBranchName", DropDownList2.SelectedValue);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();
            con.Close();
        }

        protected void View_Option3(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("AdminViewOption3", con);
            cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList3.SelectedValue);
            cmd.Parameters.AddWithValue("@GroceryBranchName", DropDownList4.SelectedValue);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();
            con.Close();
        }
    }
}