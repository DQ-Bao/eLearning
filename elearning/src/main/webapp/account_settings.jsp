<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Account</title>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>

<h1>My Account</h1>

<button class="button" onclick="showAccountSection()">Account</button>
<button class="button" onclick="showPurchaseHistory()">Purchase History</button>

<div id="accountSection" style="display: none;">
  <h2>Account Management</h2>
  <form>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <label for="oldPassword">Old password:</label>
    <input type="password" id="oldPassword" name="oldPassword" value=""><br>
    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword"><br>
    <label for="cfPassword">Confirm New Password:</label>
    <input type="password" id="cfPassword" name="cfPassword"><br>
    <button type="submit">Update Account</button>
    <button type="button" onclick="confirmDelete()">Delete Account</button>
  </form>
  <p id="deleteConfirmation" style="display: none;">Are you sure you want to delete your account? This action cannot be undone.</p>
  <button type="button" id="deleteButton" style="display: none;" onclick="deleteAccount()">Delete</button>
  <button type="button" id="cancelButton" style="display: none;" onclick="cancelDelete()">Cancel</button>
</div>

<div id="purchaseHistorySection" style="display: none;">
  <h2>Purchase History</h2>
   <form>
            <table border="1">
                <tr>
                <td>img</td>
                <td>Title <br>
                by Manager</td>
                <td>price</td>
                <td>Paid day</td>
                </tr>
            </table>
        </form>
</div>

<script>
function showAccountSection() {
  document.getElementById("accountSection").style.display = "block";
  document.getElementById("purchaseHistorySection").style.display = "none";
}

function showPurchaseHistory() {
  document.getElementById("accountSection").style.display = "none";
  document.getElementById("purchaseHistorySection").style.display = "block";
}

function confirmDelete() {
  document.getElementById("deleteConfirmation").style.display = "block";
  document.getElementById("deleteButton").style.display = "inline";
  document.getElementById("cancelButton").style.display = "inline";
}

function cancelDelete() {
  document.getElementById("deleteConfirmation").style.display = "none";
  document.getElementById("deleteButton").style.display = "none";
  document.getElementById("cancelButton").style.display = "none";
}

// This function needs implementation to send a delete account request  
function deleteAccount() {
  // Implement logic to send a delete account request to the server
  alert("Account deleted successfully!");
  // Redirect to login page or handle account deletion as needed
}
</script>

</body>
</html>