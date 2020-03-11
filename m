Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBx1N-0003cl-Vp
 for ath11k@lists.infradead.org; Wed, 11 Mar 2020 08:47:23 +0000
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/7] ath11k: Use scnprintf() for avoiding potential buffer
 overflow
Date: Wed, 11 Mar 2020 09:47:07 +0100
Message-Id: <20200311084713.18220-2-tiwai@suse.de>
In-Reply-To: <20200311084713.18220-1-tiwai@suse.de>
References: <20200311084713.18220-1-tiwai@suse.de>
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
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Cc: ath11k@lists.infradead.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 9939e909628f..f44dec839e70 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -22,7 +22,7 @@
 	do {										\
 		int index = 0; u8 i;							\
 		for (i = 0; i < len; i++) {						\
-			index += snprintf(out + index, HTT_MAX_STRING_LEN - index,	\
+			index += scnprintf(out + index, HTT_MAX_STRING_LEN - index,	\
 					  " %u:%u,", i, arr[i]);			\
 			if (index < 0 || index >= HTT_MAX_STRING_LEN)			\
 				break;							\
@@ -46,7 +46,7 @@ static inline void htt_print_stats_string_tlv(const void *tag_buf,
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "HTT_STATS_STRING_TLV:");
 
 	for (i = 0; i < tag_len; i++) {
-		index += snprintf(&data[index],
+		index += scnprintf(&data[index],
 				HTT_MAX_STRING_LEN - index,
 				"%.*s", 4, (char *)&(htt_stats_buf->data[i]));
 		if (index >= HTT_MAX_STRING_LEN)
@@ -3097,7 +3097,7 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 		index = 0;
 
 		for (i = 0; i < HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS; i++)
-			index += snprintf(&rx_pilot_evm_db[j][index],
+			index += scnprintf(&rx_pilot_evm_db[j][index],
 					  HTT_MAX_STRING_LEN - index,
 					  " %u:%d,",
 					  i,
@@ -3109,7 +3109,7 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 	index = 0;
 	memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
 	for (i = 0; i < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; i++)
-		index += snprintf(&str_buf[index],
+		index += scnprintf(&str_buf[index],
 				  HTT_MAX_STRING_LEN - index,
 				  " %u:%d,", i, htt_stats_buf->rx_pilot_evm_db_mean[i]);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "pilot_evm_dB_mean = %s ", str_buf);
@@ -3217,7 +3217,7 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 		index = 0;
 		memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
 		for (i = 0; i < HTT_RX_PDEV_MAX_OFDMA_NUM_USER; i++)
-			index += snprintf(&str_buf[index],
+			index += scnprintf(&str_buf[index],
 					  HTT_MAX_STRING_LEN - index,
 					  " %u:%d,",
 					  i, htt_stats_buf->rx_ul_fd_rssi[j][i]);
@@ -3232,7 +3232,7 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 		index = 0;
 		memset(str_buf, 0x0, HTT_MAX_STRING_LEN);
 		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_COUNTERS; i++)
-			index += snprintf(&str_buf[index],
+			index += scnprintf(&str_buf[index],
 					  HTT_MAX_STRING_LEN - index,
 					  " %u:%d,",
 					  i,
-- 
2.16.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
