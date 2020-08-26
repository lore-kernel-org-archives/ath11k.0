Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4il-0002DX-VM
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 23:20:48 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath11k:  Support loading ELF board files.
Date: Wed, 26 Aug 2020 16:20:44 -0700
Message-Id: <20200826232044.6799-1-greearb@candelatech.com>
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
To: ath11k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

The QCA6390 board I have, model 8291M-PR comes with an ELF board
file.  To get this to at least somewhat work, I renamed bdwlan.e04
to 'board.bin' and then added this patch to check for .ELF as
starting bytes of the board file.  If that is found, use type
ELF.  After this the driver loads.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

This is on top of recent kvallo ath tree.

 drivers/net/wireless/ath/ath11k/qmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 91134510364c..f87f1d1564f4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1992,6 +1992,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	struct qmi_txn txn = {};
 	int ret;
 	const u8 *temp;
+	int bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
@@ -2008,6 +2009,15 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	temp = bd.data;
 	remaining = bd.len;
 
+	if (bd.len >= 4) {
+		char* edata = (char*)(temp);
+		if (edata[1] == 'E' &&
+		    edata[2] == 'L' &&
+		    edata[3] == 'F') {
+			bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
+		}
+	}
+
 	while (remaining) {
 		req->valid = 1;
 		req->file_id_valid = 1;
@@ -2017,7 +2027,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		req->seg_id_valid = 1;
 		req->data_valid = 1;
 		req->data_len = ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE;
-		req->bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
+		req->bdf_type = bdf_type;
 		req->bdf_type_valid = 1;
 		req->end_valid = 1;
 		req->end = 0;
-- 
2.26.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
