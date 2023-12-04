<?php 
include "koneksi.php";
$username = $_POST['username'];
$password = $_POST['password'];
$sql = mysqli_query($koneksi, "SELECT * FROM user WHERE username = '$username' AND password = '$password' ");
$cek = mysqli_num_rows($sql);
if($cek>0){
	$data = mysqli_fetch_array($sql);
	session_start();
	$_SESSION['id_user'] = $data['id_user'];
	$_SESSION['nama_user'] = $data['nama_user'];
	$_SESSION['id_level'] = $data['id_level'];
	
	if($data['id_level']=='1'){
		header("Location:admin/admin.php");
	}else if($data['id_level']=='2'){
		header("Location:kasir/kasir.php");
	}else if($data['id_level']=='3'){
		header("Location:owner/owner.php");
	}else if($data['id_level']=='4'){
		header("Location:pelanggan/pelanggan.php");
	}else if($data['id_level']=='5'){
		header("Location:waiter/waiter.php");
	}						
}else{
	header("Location:index.php?pesan=gagal");
}
 ?>