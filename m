Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHLY-0006pI-Gc
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 16:36:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/8] ath11k: add RX stats support for radiotap
Date: Mon, 25 Nov 2019 16:36:18 +0000
Message-ID: <0101016ea36bc131-6435b284-587e-4253-8ebf-35fa9bf351c0-000000@us-west-2.amazonses.com>
In-Reply-To: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
References: <1574699772-17938-1-git-send-email-kvalo@codeaurora.org>
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

From: John Crispin <john@phrozen.org>

mac80211 expects the definition of what HE rate info is available inside a
struct prepended to the skb.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9491a479fab5..c498c4920e11 100644
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
