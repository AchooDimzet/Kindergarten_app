using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Kindergarten_app.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddWorkerWindow.xaml
    /// </summary>
    public partial class AddWorkerWindow : Window
    {
        byte[] _image = null;
        private Workers currentWorker;
        public AddWorkerWindow()
        {
            InitializeComponent();
            CbRole.ItemsSource = AppData.Context.Roles.ToList();
            CbGender.ItemsSource = AppData.Context.Genders.ToList();
        }

        public AddWorkerWindow(Workers workers)
        {
            InitializeComponent();
            currentWorker = workers;

            TbFirstName.Text = workers.First_name;
            TbLastName.Text = workers.Last_name;
            TbPatronymic.Text = workers.Patronimyc;
            TbPhone.Text = workers.Phone;
            TbAdress.Text = workers.Adress;
            DateBirth.SelectedDate = workers.DateOfBirth;
            TbPassport.Text = workers.PassportNumber;
            CbRole.SelectedItem = workers.RoleId;
            CbGender.SelectedItem = workers.Gender;
            TbLogin.Text = workers.Login;
            TbPassword.Password = workers.Password;

            _image = workers.Photo;

            Image.DataContext = _image;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (currentWorker == null)
            {
                AppData.Context.Workers.Add(new Workers()
                {
                    First_name = TbFirstName.Text,
                    Last_name = TbLastName.Text,
                    Patronimyc = TbPatronymic.Text,
                    Phone = TbPhone.Text,
                    Adress = TbAdress.Text,
                    DateOfBirth = DateBirth.SelectedDate.Value,
                    PassportNumber = TbPassport.Text,
                    RoleId = CbRole.SelectedIndex + 1,
                    Login = TbLogin.Text,
                    Password = TbPassword.Password,
                    Gender = CbGender.SelectedIndex + 1,
                    
                    Photo = _image,
                    IsValid = true
                });
                AppData.Context.SaveChanges();
                this.Close();
            }
            else
            {
                currentWorker.First_name = TbFirstName.Text;
                currentWorker.Last_name = TbLastName.Text;
                currentWorker.Patronimyc = TbPatronymic.Text;
                currentWorker.Phone = TbPhone.Text;
                currentWorker.Adress = TbAdress.Text;
                currentWorker.DateOfBirth = DateBirth.SelectedDate.Value;
                currentWorker.PassportNumber = TbPassport.Text;
                currentWorker.RoleId = CbRole.SelectedIndex + 1;
                currentWorker.Login = TbLogin.Text;
                currentWorker.Password = TbPassword.Password;
                currentWorker.Gender = CbGender.SelectedIndex + 1;

                currentWorker.Photo = _image;
                currentWorker.IsValid = true;
                AppData.Context.SaveChanges();
                this.Close();
            }
        }

        private void BtnAddPhoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Images |*.png; *.jpg";
            if (ofd.ShowDialog() == true)
            {
                _image = File.ReadAllBytes(ofd.FileName);
                Image.DataContext = _image;
            }
        }
    }
}
