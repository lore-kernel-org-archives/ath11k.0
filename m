Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAZyI-0007IS-Eh
 for ath11k@lists.infradead.org; Tue, 25 Aug 2020 14:30:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id c15so12909220wrs.11
 for <ath11k@lists.infradead.org>; Tue, 25 Aug 2020 07:30:46 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH] ath11k: return error if firmware request fails
Date: Tue, 25 Aug 2020 15:30:39 +0100
Message-Id: <20200825143040.233619-1-alex.dewar90@gmail.com>
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
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

In ath11k_qmi_prepare_bdf_download(), ath11k_core_firmware_request() is
called, but the returned pointer is not checked for errors. Rather the
variable ret (which will always be zero) is checked by mistake. Fix
this and replace the various gotos with simple returns for clarity.

While we are at it, move the call to memset, as variable bd is not used
on all code paths.

Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 91134510364c..b906b50ee57e 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1868,16 +1868,16 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 	const struct firmware *fw_entry;
 	struct ath11k_board_data bd;
 	u32 fw_size;
-	int ret = 0;
-
-	memset(&bd, 0, sizeof(bd));
+	int ret;
 
 	switch (type) {
 	case ATH11K_QMI_FILE_TYPE_BDF_GOLDEN:
+		memset(&bd, 0, sizeof(bd));
+
 		ret = ath11k_core_fetch_bdf(ab, &bd);
 		if (ret) {
 			ath11k_warn(ab, "qmi failed to load BDF\n");
-			goto out;
+			return ret;
 		}
 
 		fw_size = min_t(u32, ab->hw_params.fw.board_size, bd.len);
@@ -1886,10 +1886,11 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
 		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
-		if (ret) {
+		if (IS_ERR(fw_entry)) {
+			ret = PTR_ERR(fw_entry);
 			ath11k_warn(ab, "failed to load %s: %d\n",
 				    ATH11K_DEFAULT_CAL_FILE, ret);
-			goto out;
+			return ret;
 		}
 
 		fw_size = min_t(u32, ab->hw_params.fw.board_size,
@@ -1901,14 +1902,11 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		release_firmware(fw_entry);
 		break;
 	default:
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	req->total_size = fw_size;
-
-out:
-	return ret;
+	return 0;
 }
 
 static int ath11k_qmi_load_bdf_fixed_addr(struct ath11k_base *ab)
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
