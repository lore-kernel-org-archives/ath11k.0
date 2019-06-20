Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2Px-00077x-5b
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:08:18 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix return statements on void function warnings
Date: Fri, 21 Jun 2019 00:37:58 +0530
Message-Id: <1561057678-725-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/debug.h:130: void function return statements are not generally useful
drivers/net/wireless/ath/ath11k/wmi.c:4692: void function return statements are not generally useful

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h | 1 -
 drivers/net/wireless/ath/ath11k/wmi.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 85fb2eb..d0c69c4 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -126,7 +126,6 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 				   const char *msg, const char *prefix,
 				   const void *buf, size_t len)
 {
-	return;
 }
 #endif /* CONFIG_ATH11K_DEBUG */
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 485e6ac..a79b6d2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4689,7 +4689,6 @@ static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, u8 *evt_buf, u
 	/* TODO: Do we need to validate whether ath11k_peer_find() return NULL
 	 *	 Why this is needed when there is HTT event for peer delete
 	 */
-	return;
 }
 
 static inline const char *ath11k_wmi_vdev_resp_print(u32 vdev_resp_status)
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
