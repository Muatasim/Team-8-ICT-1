using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Grocery_Demo
{
    public partial class AdminViewProducts : System.Web.UI.Page
    {
        int PageSize = 10;

        protected void Page_Load(object sender, EventArgs e)
        {
                           
            if (Session["UsernameAdmin"] != null && Session["PasswordAdmin"] != null && Session["BranchAdmin"] != null)
            {
                string username = Session["UsernameAdmin"].ToString();
                string password = Session["PasswordAdmin"].ToString();
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
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
            {
                if (!Page.IsPostBack)
                    DisplayProducts(1, PageSize);
            }

        }

        SqlDataAdapter da;
        DataSet ds = new DataSet();

        private void DisplayProducts(int PageIndex, int PageSize)
        {

            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("AdminViewProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulatePager(recordCount, PageIndex);
                }
            }


        }

        protected void lnkbtn_PageIndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayProducts(PageIndex, PageSize);
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater1.DataSource = pages;
            Repeater1.DataBind();

            Repeater1.Visible = true;
            Repeater2.Visible = false;
            Repeater3.Visible = false;
            Repeater4.Visible = false;
            Repeater5.Visible = false;
        }
                
        
                   
        protected void Search_Product(object sender, EventArgs e)
        {
            int PageIndex = 1;
            DisplaySearch(PageIndex, PageSize);
        }
      
        private void DisplaySearch(int PageIndex, int PageSize)
        {

            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("AdminSearchProduct", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text + "%");
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                        con.Close();
                    }

               
                  
                    else
                    {
                        Label3.Text = " Couldn't find your product";
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        ds.Clear();
                        con.Close();
                    }

                    

                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulateSearchPager(recordCount, PageIndex);
                }
            }
        }

        protected void lnkbtn_PageSearchIndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplaySearch(PageIndex, PageSize);
        }

        private void PopulateSearchPager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater2.DataSource = pages;
            Repeater2.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = true;
            Repeater3.Visible = false;
            Repeater4.Visible = false;
            Repeater5.Visible = false;
        }


        protected void View_Option1(object sender, EventArgs e)
        {
            int PageIndex = 1;
            DisplayViewOption1(PageIndex, PageSize);
        }

        private void DisplayViewOption1(int PageIndex, int PageSize)
        {
            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("AdminViewOption1", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                        con.Close();
                    }

                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulateViewOption1Pager(recordCount, PageIndex);
                }
            }
        }

        protected void lnkbtn_ViewOption1IndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayViewOption1(PageIndex, PageSize);
        }

        private void PopulateViewOption1Pager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater3.DataSource = pages;
            Repeater3.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = false;
            Repeater3.Visible = true;
            Repeater4.Visible = false;
            Repeater5.Visible = false;
        }

        protected void View_Option2(object sender, EventArgs e)
        {
            int PageIndex = 1;
            DisplayViewOption2(PageIndex, PageSize);
        }

        protected void DisplayViewOption2(int PageIndex, int PageSize)
        {
            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("AdminViewOption2", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@GroceryBranchName", DropDownList2.SelectedValue);
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Open();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                        con.Close();
                    }

                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulateViewOption2Pager(recordCount, PageIndex);

                }

            }

        }

        protected void lnkbtn_ViewOption2IndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayViewOption2(PageIndex, PageSize);
        }

        private void PopulateViewOption2Pager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater4.DataSource = pages;
            Repeater4.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = false;
            Repeater3.Visible = false;
            Repeater4.Visible = true;
            Repeater5.Visible = false;
        }



        protected void View_Option3(object sender, EventArgs e)
        {
         int PageIndex = 1;
         DisplayViewOption3(PageIndex, PageSize);
        }

        protected void DisplayViewOption3(int PageIndex, int PageSize)
        {
            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("AdminViewOption3", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList3.SelectedValue);
                    cmd.Parameters.AddWithValue("@GroceryBranchName", DropDownList4.SelectedValue);
                    cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Open();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                        con.Close();
                    }

                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulateViewOption3Pager(recordCount, PageIndex);

                }
            }
        }

        protected void lnkbtn_ViewOption3IndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayViewOption3(PageIndex, PageSize);
        }

        private void PopulateViewOption3Pager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater5.DataSource = pages;
            Repeater5.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = false;
            Repeater3.Visible = false;
            Repeater4.Visible = false;
            Repeater5.Visible = true;
        }


    }
    }


