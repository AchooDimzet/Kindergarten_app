using Kindergarten_app.Classes;
using Kindergarten_app.Pages;
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

namespace Kindergarten_app
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            AppData.MainFrame = FrameOnPage;
            AppData.MainFrame.Navigate(new LoginPage());
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            AppData.MainFrame.GoBack();
        }

        private void FrameOnPage_ContentRendered(object sender, EventArgs e)
        {
            if ((FrameOnPage.Content as Page) is LoginPage)
                UpBar.Visibility = Visibility.Collapsed;
            else
            {
                TbName.Text = AppData.UserName;
                UpBar.Visibility = Visibility.Visible;
            }
        }
    }
}
