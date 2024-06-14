using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
using System.Windows.Shapes;

namespace Kindergarten_app.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddParentWindow.xaml
    /// </summary>
    public partial class AddParentWindow : Window
    {
        byte[] _image = null;
        private Parent currentParent;
        public AddParentWindow()
        {
            InitializeComponent();
            CbGender.ItemsSource = AppData.Context.Genders.ToList();
        }
        public AddParentWindow(Parent parent)
        {

            InitializeComponent();
            CbGender.ItemsSource = AppData.Context.Genders.ToList();
            currentParent = parent;

            TbFirstName.Text = parent.First_name;
            TbLastName.Text = parent.Last_name;
            TbPatronymic.Text = parent.Patronimyc;
            TbPhone.Text = parent.Phone;
            TbAdress.Text = parent.Adress;
            DateBirth.SelectedDate = parent.DateOfBirth;
            TbPassport.Text = parent.PassportNumber;
            CbGender.SelectedItem = parent.Gender;

            _image = parent.Photo;

            Image.DataContext = _image;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (currentParent == null)
                {
                    AppData.Context.Parent.Add(new Parent()
                    {
                        First_name = TbFirstName.Text,
                        Last_name = TbLastName.Text,
                        Patronimyc = TbPatronymic.Text,
                        Phone = TbPhone.Text,
                        Adress = TbAdress.Text,
                        DateOfBirth = DateBirth.SelectedDate.Value,
                        PassportNumber = TbPassport.Text,
                        Gender = CbGender.SelectedIndex + 1,

                        Photo = _image,
                        IsValid = true
                    });
                    AppData.Context.SaveChanges();
                    this.Close();
                }
                else
                {
                    currentParent.First_name = TbFirstName.Text;
                    currentParent.Last_name = TbLastName.Text;
                    currentParent.Patronimyc = TbPatronymic.Text;
                    currentParent.Phone = TbPhone.Text;
                    currentParent.Adress = TbAdress.Text;
                    currentParent.DateOfBirth = DateBirth.SelectedDate.Value;
                    currentParent.PassportNumber = TbPassport.Text;
                    currentParent.Gender = CbGender.SelectedIndex + 1;

                    currentParent.Photo = _image;
                    currentParent.IsValid = true;
                    AppData.Context.SaveChanges();
                    this.Close();
                }
            }
            
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Проверьте правильность введенных данных", MessageBoxButton.OK, MessageBoxImage.Error);
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
