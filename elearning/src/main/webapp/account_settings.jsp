<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
  <jsp:attribute name="head">
    <style>
      .button {
        background-color: #4CAF50;
        /* Green */
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
  </jsp:attribute>

  <jsp:attribute name="script">
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
  </jsp:attribute>

  <jsp:body>
    
    <h1>My Account</h1>

    <div class="row"> <!-- Cái class row là để hiển thị trên một dòng -->
      <!-- Bootstrap thì một dòng chia ra làm 12 phần, chỗ này dùng col-3 tức là nó chiếm 3 phần, phần kia mình để col-9, để cộng lại nó vừa đủ một dòng -->
      <div class="col-3 nav nav-pills flex-column">
          <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#settings" type="button" aria-controls="settings" aria-selected="true">Settings</button>
          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#purchase-history" type="button" aria-controls="purchase-history" aria-selected="true">Purchase History</button>
      </div>
      <div class="col-9">
          <div class="tab-content">
              <div class="tab-pane fade show active" id="settings">
                <div id="accountSection">
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
                  <p id="deleteConfirmation" style="display: none;">Are you sure you want to delete your account? This action
                    cannot be undone.</p>
                  <button type="button" id="deleteButton" style="display: none;" onclick="deleteAccount()">Delete</button>
                  <button type="button" id="cancelButton" style="display: none;" onclick="cancelDelete()">Cancel</button>
                </div>
            
              </div>
              <div class="tab-pane fade show active" id="purchase-history">
                <div id="purchaseHistorySection">
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
              </div>
          </div>
      </div>
    </div>

    
    

  </jsp:body>
</t:main>