Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXWJW-00079M-HG
 for ath11k@lists.infradead.org; Tue, 27 Oct 2020 21:15:33 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH] ath11k: fix thermal temperature read
Date: Tue, 27 Oct 2020 13:48:03 -0700
Message-Id: <20201027204803.12464-1-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Fix dangling pointer in thermal temperature event which causes
incorrect temperature read.

Tested-on: IPQ8074 AHB WLAN.HK.2.4.0.1-00041-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 53 +++++++++++----------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8eca92520837..0008df7458e7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5017,31 +5017,6 @@ int ath11k_wmi_pull_fw_stats(struct ath11k_base *ab, struct sk_buff *skb,
 	return 0;
 }
 
-static int
-ath11k_pull_pdev_temp_ev(struct ath11k_base *ab, u8 *evt_buf,
-			 u32 len, const struct wmi_pdev_temperature_event *ev)
-{
-	const void **tb;
-	int ret;
-
-	tb = ath11k_wmi_tlv_parse_alloc(ab, evt_buf, len, GFP_ATOMIC);
-	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return ret;
-	}
-
-	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
-	if (!ev) {
-		ath11k_warn(ab, "failed to fetch pdev temp ev");
-		kfree(tb);
-		return -EPROTO;
-	}
-
-	kfree(tb);
-	return 0;
-}
-
 size_t ath11k_wmi_fw_stats_num_vdevs(struct list_head *head)
 {
 	struct ath11k_fw_stats_vdev *i;
@@ -6410,23 +6385,37 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 				  struct sk_buff *skb)
 {
 	struct ath11k *ar;
-	struct wmi_pdev_temperature_event ev = {0};
+	const void **tb;
+	const struct wmi_pdev_temperature_event *ev;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return;
+	}
 
-	if (ath11k_pull_pdev_temp_ev(ab, skb->data, skb->len, &ev) != 0) {
-		ath11k_warn(ab, "failed to extract pdev temperature event");
+	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch pdev temp ev");
+		kfree(tb);
 		return;
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "pdev temperature ev temp %d pdev_id %d\n", ev.temp, ev.pdev_id);
+		   "pdev temperature ev temp %d pdev_id %d\n", ev->temp, ev->pdev_id);
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 	if (!ar) {
-		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev.pdev_id);
+		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
+		kfree(tb);
 		return;
 	}
 
-	ath11k_thermal_event_temperature(ar, ev.temp);
+	ath11k_thermal_event_temperature(ar, ev->temp);
+
+	kfree(tb);
 }
 
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)

base-commit: 3cb12d27ff655e57e8efe3486dca2a22f4e30578
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
