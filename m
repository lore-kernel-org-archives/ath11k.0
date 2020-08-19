Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8LmN-0005dZ-AP
 for ath11k@lists.infradead.org; Wed, 19 Aug 2020 10:57:16 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ath11k: fix error check on return from call to
 ath11k_core_firmware_request
Date: Wed, 19 Aug 2020 11:57:12 +0100
Message-Id: <20200819105712.51886-1-colin.king@canonical.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to ath11k_core_firmware_request is returning a pointer that
can be set to an error code, however, this is not being checked.
Instead ret is being incorrecly checked for the error return. Fix the
error checking.

Addresses-Coverity: ("Logically dead code")
Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 91134510364c..4792857678b9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1886,7 +1886,7 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
 		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
-		if (ret) {
+		if (PTR_ERR(fw_entry)) {
 			ath11k_warn(ab, "failed to load %s: %d\n",
 				    ATH11K_DEFAULT_CAL_FILE, ret);
 			goto out;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
