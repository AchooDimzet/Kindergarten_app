using Kindergarten_app.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kindergarten_app.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminMenuPage.xaml
    /// </summary>
    public partial class AdminMenuPage : Page
    {
        public AdminMenuPage()
        {
            InitializeComponent();
        }

        private void BtnLessons_Click(object sender, RoutedEventArgs e)
        {
            AppData.MainFrame.Navigate(new PrivateLessonsPage());
        }

        private void BtnParents_Click(object sender, RoutedEventArgs e)
        {
            AppData.MainFrame.Navigate(new ParentsPage());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            AppData.MainFrame.Navigate(new WorkersPage());
        }

        private void BtnKids_Click(object sender, RoutedEventArgs e)
        {
            AppData.MainFrame.Navigate(new KidsPage());
        }
    }
}
