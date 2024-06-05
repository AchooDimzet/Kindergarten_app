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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                    var user = AppData.Context.Workers.FirstOrDefault(p => p.Login == TbLogin.Text && p.Password == TbPassword.Password);
                    if (user != null)
                    {
                        AppData.UserId = user.Id;
                        AppData.UserName = user.FullName;
                        AppData.MainFrame.Navigate(new AdminMenuPage());
                    }
                    else
                        MessageBox.Show("Неверный логин или пароль");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка соединения с БД");
            }
        }
    }
}
