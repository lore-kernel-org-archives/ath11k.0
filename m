Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVeTh-0006dN-94
 for ath11k@lists.infradead.org; Mon, 04 May 2020 17:02:10 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath11k: fix kernel panic by freeing the msdu received with
 invalid length
Date: Mon,  4 May 2020 22:29:28 +0530
Message-Id: <1588611568-20791-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

In certain scenario host receives the packets with invalid length
which causes below kernel panic. Free up those msdus to avoid
this kernel panic.

 2270.028121:   <6> task: ffffffc0008306d0 ti: ffffffc0008306d0 task.ti: ffffffc0008306d0
 2270.035247:   <2> PC is at skb_panic+0x40/0x44
 2270.042784:   <2> LR is at skb_panic+0x40/0x44
 2270.521775:   <2> [<ffffffc0004a06e0>] skb_panic+0x40/0x44
 2270.524039:   <2> [<ffffffc0004a1278>] skb_put+0x54/0x5c
 2270.529264:   <2> [<ffffffbffcc373a8>] ath11k_dp_process_rx_err+0x320/0x5b0 [ath11k]
 2270.533860:   <2> [<ffffffbffcc30b68>] ath11k_dp_service_srng+0x80/0x268 [ath11k]
 2270.541063:   <2> [<ffffffbffcc1d554>] ath11k_hal_rx_reo_ent_buf_paddr_get+0x200/0xb64 [ath11k]
 2270.547917:   <2> [<ffffffc0004b1f74>] net_rx_action+0xf8/0x274
 2270.556247:   <2> [<ffffffc000099df4>] __do_softirq+0x128/0x228
 2270.561625:   <2> [<ffffffc00009a130>] irq_exit+0x84/0xcc
 2270.567008:   <2> [<ffffffc0000cfb28>] __handle_domain_irq+0x8c/0xb0
 2270.571695:   <2> [<ffffffc000082484>] gic_handle_irq+0x6c/0xbc

Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 47ad3bd..90d2d47 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2270,6 +2270,7 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	struct ieee80211_hdr *hdr;
 	struct sk_buff *last_buf;
 	u8 l3_pad_bytes;
+	u8 *hdr_status;
 	u16 msdu_len;
 	int ret;
 
@@ -2298,8 +2299,13 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 		skb_pull(msdu, HAL_RX_DESC_SIZE);
 	} else if (!rxcb->is_continuation) {
 		if ((msdu_len + HAL_RX_DESC_SIZE) > DP_RX_BUFFER_SIZE) {
+			hdr_status = ath11k_dp_rx_h_80211_hdr(rx_desc);
 			ret = -EINVAL;
 			ath11k_warn(ar->ab, "invalid msdu len %u\n", msdu_len);
+			ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", hdr_status,
+					sizeof(struct ieee80211_hdr));
+			ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", rx_desc,
+					sizeof(struct hal_rx_desc));
 			goto free_out;
 		}
 		skb_put(msdu, HAL_RX_DESC_SIZE + l3_pad_bytes + msdu_len);
@@ -3394,6 +3400,7 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 	struct sk_buff *msdu;
 	struct ath11k_skb_rxcb *rxcb;
 	struct hal_rx_desc *rx_desc;
+	u8 *hdr_status;
 	u16 msdu_len;
 
 	spin_lock_bh(&rx_ring->idr_lock);
@@ -3431,6 +3438,17 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 
 	rx_desc = (struct hal_rx_desc *)msdu->data;
 	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
+	if ((msdu_len + HAL_RX_DESC_SIZE) > DP_RX_BUFFER_SIZE) {
+		hdr_status = ath11k_dp_rx_h_80211_hdr(rx_desc);
+		ath11k_warn(ar->ab, "invalid msdu leng %u", msdu_len);
+		ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", hdr_status,
+				sizeof(struct ieee80211_hdr));
+		ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", rx_desc,
+				sizeof(struct hal_rx_desc));
+		dev_kfree_skb_any(msdu);
+		goto exit;
+	}
+
 	skb_put(msdu, HAL_RX_DESC_SIZE + msdu_len);
 
 	if (ath11k_dp_rx_frag_h_mpdu(ar, msdu, ring_desc)) {
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
