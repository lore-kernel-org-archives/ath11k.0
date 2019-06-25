Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcq2-0003Fa-34
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 04:13:47 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 2/5] ath11k: avoid unnecessary 'out of memory' message
Date: Tue, 25 Jun 2019 09:43:16 +0530
Message-Id: <1561435999-28316-2-git-send-email-periyasa@codeaurora.org>
In-Reply-To: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
References: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/dp_rx.c:573: Possible unnecessary 'out of memory' message
drivers/net/wireless/ath/ath11k/wmi.c:4528: Possible unnecessary 'out of memory' message

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 +---
 drivers/net/wireless/ath/ath11k/wmi.c   | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index afe8399..17be3cc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -569,10 +569,8 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 	}
 
 	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
-	if (!elem) {
-		ath11k_warn(ab, "failed to allocate memory for cache flush element\n");
+	if (!elem)
 		goto free_desc;
-	}
 
 	elem->ts = jiffies;
 	memcpy(&elem->data, rx_tid, sizeof(*rx_tid));
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index f800c77..085ee32 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4527,9 +4527,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 l
 	struct ath11k *ar;
 
 	reg_info = kzalloc(sizeof(*reg_info), GFP_ATOMIC);
-
 	if (!reg_info) {
-		ath11k_warn(ab, "Unable to allocate memory for processing chan_info event\n");
 		ret = -ENOMEM;
 		goto fallback;
 	}
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
