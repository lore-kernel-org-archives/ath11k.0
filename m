Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9p-0002u8-Dp
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 08/12] ath11k: change ath11k_core_fetch_board_data_api_n() to
 use ath11k_core_create_firmware_path()
Date: Tue, 16 Jun 2020 17:00:51 +0300
Message-Id: <1592316055-24958-9-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Use the helper added in previous comment to create the full path, instead of doing it manually.

No functional changes. Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index de5b1d20771a..84a566dffad9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -165,11 +165,13 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 {
 	size_t len, magic_len;
 	const u8 *data;
-	char *filename = ATH11K_BOARD_API2_FILE;
+	char *filename, filepath[100];
 	size_t ie_len;
 	struct ath11k_fw_ie *hdr;
 	int ret, ie_id;
 
+	filename = ATH11K_BOARD_API2_FILE;
+
 	if (!bd->fw)
 		bd->fw = ath11k_core_firmware_request(ab, filename);
 
@@ -179,11 +181,14 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 	data = bd->fw->data;
 	len = bd->fw->size;
 
+	ath11k_core_create_firmware_path(ab, filename,
+					 filepath, sizeof(filepath));
+
 	/* magic has extra null byte padded */
 	magic_len = strlen(ATH11K_BOARD_MAGIC) + 1;
 	if (len < magic_len) {
-		ath11k_err(ab, "failed to find magic value in %s/%s, file too short: %zu\n",
-			   ab->hw_params.fw.dir, filename, len);
+		ath11k_err(ab, "failed to find magic value in %s, file too short: %zu\n",
+			   filepath, len);
 		ret = -EINVAL;
 		goto err;
 	}
@@ -197,8 +202,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 	/* magic is padded to 4 bytes */
 	magic_len = ALIGN(magic_len, 4);
 	if (len < magic_len) {
-		ath11k_err(ab, "failed: %s/%s too small to contain board data, len: %zu\n",
-			   ab->hw_params.fw.dir, filename, len);
+		ath11k_err(ab, "failed: %s too small to contain board data, len: %zu\n",
+			   filepath, len);
 		ret = -EINVAL;
 		goto err;
 	}
@@ -246,8 +251,8 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 out:
 	if (!bd->data || !bd->len) {
 		ath11k_err(ab,
-			   "failed to fetch board data for %s from %s/%s\n",
-			   boardname, ab->hw_params.fw.dir, filename);
+			   "failed to fetch board data for %s from %s\n",
+			   boardname, filepath);
 		ret = -ENODATA;
 		goto err;
 	}
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
