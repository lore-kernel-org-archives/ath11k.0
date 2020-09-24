Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLPtF-0003Mc-EY
 for ath11k@lists.infradead.org; Thu, 24 Sep 2020 11:58:23 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath11k: Move non-fatal warn logs to dbg level
Date: Thu, 24 Sep 2020 17:28:11 +0530
Message-Id: <1600948691-6901-1-git-send-email-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

During driver load below warn logs are printed in the console.
Since driver may not implement all wmi events sent by fw and
all of them are non-fatal, move this log to debug level to
remove un-necessary warn message on console.

[876.898735] ath11k_pci 0000:06:00.0: Unknown eventid: 0x16005
[879.283250] ath11k_pci 0000:06:00.0: Unknown eventid: 0x1d00a

No functional changes. Compile tested only.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index adde14a390ec..1e5a46bdaa61 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6579,7 +6579,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 		break;
 	/* TODO: Add remaining events */
 	default:
-		ath11k_warn(ab, "Unknown eventid: 0x%x\n", id);
+		ath11k_dbg(ab, ATH11K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
 		break;
 	}
 
-- 
2.22.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
