using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;


namespace Grocery_Demo
{
    public partial class Promotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            AntiForgery.Validate();

            string filters = "*.jpg;*.png;*.gif;*.jpeg";
            string Path = ConfigurationManager.AppSettings["FilePath"].ToString();

            List<String> images = new List<string>();

            foreach (string filter in filters.Split(';'))
            {
                FileInfo[] fit = new DirectoryInfo(this.Server.MapPath(Path)).GetFiles(filter);
                foreach (FileInfo fi in fit)
                {
                    images.Add(String.Format(Path + "/{0}", fi));
                }
            }

            RepeaterImages.DataSource = images;
            RepeaterImages.DataBind();
        }
    }
}