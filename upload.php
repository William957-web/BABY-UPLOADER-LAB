<?php
$targetDir = "uploads/";
$targetFile = $targetDir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
if (isset($_POST["submit"])) {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        echo "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
        header('Location: view.php?file='.$targetFile);
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
