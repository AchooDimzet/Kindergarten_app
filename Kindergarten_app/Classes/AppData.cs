using Kindergarten_app.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Kindergarten_app.Classes
{
    public class AppData
    {
        public static Frame MainFrame;
        public static Kindergarten_dbEntities Context = new Kindergarten_dbEntities();
        public static int UserId;
        public static string UserName;
    }
}
