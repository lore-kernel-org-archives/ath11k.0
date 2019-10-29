Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPHhg-00087x-3c
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 02:57:53 +0000
From: Vikas Patel <vikpatel@codeaurora.org>
Subject: [PATCH] ath11k: Fixing TLV length issue in peer pktlog WMI command
Date: Tue, 29 Oct 2019 08:27:42 +0530
Message-Id: <20191029025742.22488-1-vikpatel@codeaurora.org>
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
Cc: Vikas Patel <vikpatel@codeaurora.org>

TLV length was 0 for TLV tag 'WMI_TAG_ARRAY_STRUCT' causing
Q6 to crash when trying to configure pktlog filter via debugfs.

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ccebf7ce420a..aae6e76330da 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2329,7 +2329,7 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 
 	tlv = ptr;
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+		      FIELD_PREP(WMI_TLV_LEN, sizeof(*info));
 
 	ptr += TLV_HDR_SIZE;
 	info = ptr;
-- 
2.23.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
