Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeT-0003Mm-Cg
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:05:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 09/10] ath11k: Fixing TLV length issue in peer pktlog WMI
 command
Date: Tue, 26 Nov 2019 11:04:59 +0000
Message-ID: <0101016ea762ca54-e118fe42-0abb-461b-a2cf-200e1ffc3883-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Vikas Patel <vikpatel@codeaurora.org>

TLV length was 0 for TLV tag 'WMI_TAG_ARRAY_STRUCT' causing
Q6 to crash when trying to configure pktlog filter via debugfs.

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
