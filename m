Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnzHZ-0001Ya-Vd
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 05:48:52 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: add RX stats support for radiotap
Date: Thu, 18 Jul 2019 07:48:37 +0200
Message-Id: <20190718054837.32756-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

mac80211 expects the definition of what HE rate info is available inside a
struct prepended to the skb.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 686b14044938..dcbc46b52493 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2038,11 +2038,21 @@ static char *ath11k_print_get_tid(struct ieee80211_hdr *hdr, char *out,
 static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *napi,
 				      struct sk_buff *msdu)
 {
+	static const struct ieee80211_radiotap_he known = {
+		.data1 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_DATA_MCS_KNOWN),
+		.data2 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA2_GI_KNOWN),
+	};
 	struct ieee80211_rx_status *status;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+	struct ieee80211_radiotap_he *he = NULL;
 	char tid[32];
 
 	status = IEEE80211_SKB_RXCB(msdu);
+	if (status->encoding == RX_ENC_HE) {
+		he = skb_push(msdu, sizeof(known));
+		memcpy(he, &known, sizeof(known));
+		status->flag |= RX_FLAG_RADIOTAP_HE;
+	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 		   "rx skb %pK len %u peer %pM %s %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
