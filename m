Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRugh-0000vG-Fq
 for ath11k@lists.infradead.org; Fri, 24 Apr 2020 09:32:00 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 2/2] ath11k: add 802.3 undecap support to fix TKIP MIC error
 reporting
Date: Fri, 24 Apr 2020 15:01:30 +0530
Message-Id: <1587720690-2753-3-git-send-email-murugana@codeaurora.org>
In-Reply-To: <1587720690-2753-1-git-send-email-murugana@codeaurora.org>
References: <1587720690-2753-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

Currently DECAP_TYPE_8023 frames with TKIP MIC error is not undecaped
and hence fails to do TKIP MIC error reporting in ieee80211_rx_napi()
path.

Fix this by adding undecap support for ieee80211_rx_napi() to process
these frames and perform TKIP counter-measures when there is MIC error
reported.

Tested with STA triggering TKIP MIC error frames (using debugfs
"tkip_mic_test" in SW encryption mode) twice within a minute and
verify TKIP counter-measures are performed as expected.

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 39 ++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index bbd7da48518f..8db42a3d4a1f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1986,6 +1986,42 @@ static void ath11k_dp_rx_h_undecap_eth(struct ath11k *ar,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
+static void ath11k_dp_rx_h_undecap_snap(struct ath11k *ar,
+					struct sk_buff *msdu,
+					u8 *first_hdr,
+					enum hal_encrypt_type enctype,
+					struct ieee80211_rx_status *status)
+{
+	struct ieee80211_hdr *hdr;
+	size_t hdr_len;
+	u8 l3_pad_bytes;
+	struct hal_rx_desc *rx_desc;
+
+	/* Delivered decapped frame:
+	 * [amsdu header] <-- replaced with 802.11 hdr
+	 * [rfc1042/llc]
+	 * [payload]
+	 */
+
+	rx_desc = (void *)msdu->data - sizeof(*rx_desc);
+	l3_pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(rx_desc);
+
+	skb_put(msdu, l3_pad_bytes);
+	skb_pull(msdu, sizeof(struct ath11k_dp_amsdu_subframe_hdr) + l3_pad_bytes);
+
+	hdr = (struct ieee80211_hdr *)first_hdr;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+
+	if (!(status->flag & RX_FLAG_IV_STRIPPED)) {
+		memcpy(skb_push(msdu,
+				ath11k_dp_rx_crypto_param_len(ar, enctype)),
+		       (void *)hdr + hdr_len,
+			ath11k_dp_rx_crypto_param_len(ar, enctype));
+	}
+
+	memcpy(skb_push(msdu, hdr_len), hdr, hdr_len);
+}
+
 static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 				   struct hal_rx_desc *rx_desc,
 				   enum hal_encrypt_type enctype,
@@ -2013,7 +2049,8 @@ static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 					   enctype, status);
 		break;
 	case DP_RX_DECAP_TYPE_8023:
-		/* TODO: Handle undecap for these formats */
+		ath11k_dp_rx_h_undecap_snap(ar, msdu, first_hdr,
+					    enctype, status);
 		break;
 	}
 }
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
