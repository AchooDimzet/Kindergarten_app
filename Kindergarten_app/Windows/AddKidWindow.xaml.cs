using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для AddKidWindow.xaml
    /// </summary>
    /// 
    public partial class AddKidWindow : Window
    {
        byte[] _image = null;
        private Kid currentKid;
        public AddKidWindow()
        {
            InitializeComponent();
            CbParent.ItemsSource = AppData.Context.Parent.ToList();
            CbGroup.ItemsSource = AppData.Context.KidGroups.ToList();
            CbGender.ItemsSource = AppData.Context.Genders.ToList();
        }

        public AddKidWindow(Kid kid)
        {
            InitializeComponent();
            CbParent.ItemsSource = AppData.Context.Parent.ToList();
            CbGroup.ItemsSource = AppData.Context.KidGroups.ToList();
            CbGender.ItemsSource = AppData.Context.Genders.ToList();

            TbFirstName.Text = kid.First_name;
            TbLastName.Text = kid.Last_name;
            TbPatronymic.Text = kid.Patronimyc;
            DateBirth.SelectedDate = kid.DateOfBirth;
            CbParent.SelectedItem = kid.ParentId;
            CbGroup.SelectedItem = kid.GroupId;
            TbMedical.Text = kid.MedicalDescription;
            TbDescription.Text = kid.Description;
            CbGender.SelectedItem = kid.Gender;

            _image = kid.Photo;

            Image.DataContext = _image;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (currentKid == null)
                {
                    AppData.Context.Kid.Add(new Kid()
                    {
                        First_name = TbFirstName.Text,
                        Last_name = TbLastName.Text,
                        Patronimyc = TbPatronymic.Text,
                        DateOfBirth = DateBirth.SelectedDate.Value,
                        ParentId = CbParent.SelectedIndex + 1,
                        GroupId = CbGroup.SelectedIndex + 1,
                        MedicalDescription = TbMedical.Text,
                        Description = TbDescription.Text,
                        Gender = CbGender.SelectedIndex + 1,

                        Photo = _image,
                        IsValid = true
                    });
                    AppData.Context.SaveChanges();
                    this.Close();
                }
                else
                {
                    currentKid.First_name = TbFirstName.Text;
                    currentKid.Last_name = TbLastName.Text;
                    currentKid.Patronimyc = TbPatronymic.Text;
                    currentKid.DateOfBirth = DateBirth.SelectedDate.Value;
                    currentKid.ParentId = CbParent.SelectedIndex + 1;
                    currentKid.GroupId = CbGroup.SelectedIndex + 1;
                    currentKid.MedicalDescription = TbMedical.Text;
                    currentKid.Description = TbDescription.Text;
                    currentKid.Gender = CbGender.SelectedIndex + 1;

                    currentKid.Photo = _image;
                    currentKid.IsValid = true;
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
