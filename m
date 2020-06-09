Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiYzo-00028X-Fe
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 07:48:37 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: Add support spectral scan for IPQ6018
Date: Tue,  9 Jun 2020 13:18:08 +0530
Message-Id: <1591688888-30237-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

IPQ6018 supported with 4 bytes FFT BIN size. so supported 4 bytes
parsing logic in FFT report process.

Tested-on: IPQ6018 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Note: This is based on below patches
	1. ath11k: add IPQ6018 support
	2. ath11k: add support for spectral scan
	3. ath11k: Add direct buffer ring support

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c     |  2 ++
 drivers/net/wireless/ath/ath11k/hw.h       |  1 +
 drivers/net/wireless/ath/ath11k/spectral.c | 23 +++++++++++++----------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3516ea6..45bf10b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -26,6 +26,7 @@
 			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
 		},
+		.spectral_fft_sz = 2,
 	},
 	{
 		.dev_id = ATH11K_HW_IPQ6018,
@@ -35,6 +36,7 @@
 			.board_size = IPQ6018_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ6018_MAX_CAL_DATA_SZ,
 		},
+		.spectral_fft_sz = 4,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index d976533..7d2b147 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -117,6 +117,7 @@ struct ath11k_hw_params {
 		size_t board_size;
 		size_t cal_size;
 	} fw;
+	u8 spectral_fft_sz;
 };
 
 struct ath11k_fw_ie {
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 1c5d65b..f3196a0 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -17,8 +17,6 @@
 #define ATH11K_SPECTRAL_ATH11K_MIN_IB_BINS	32
 #define ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS	256
 
-#define ATH11K_SPECTRAL_SAMPLE_FFT_BIN_MASK	0xFF
-
 #define ATH11K_SPECTRAL_SCAN_COUNT_MAX		4095
 
 /* Max channel computed by sum of 2g and 5g band channels */
@@ -557,16 +555,16 @@ static u8 ath11k_spectral_get_max_exp(s8 max_index, u8 max_magnitude,
 	return max_exp;
 }
 
-static void ath11k_spectral_parse_16bit_fft(u8 *outbins, u8 *inbins, int num_bins)
+static void ath11k_spectral_parse_fft(u8 *outbins, u8 *inbins, int num_bins, u8 fft_sz)
 {
-	int i;
-	__le16 *data = (__le16 *)inbins;
+	int i, j;
 
 	i = 0;
+	j = 0;
 	while (i < num_bins) {
-		outbins[i] = (__le16_to_cpu(data[i])) &
-			     ATH11K_SPECTRAL_SAMPLE_FFT_BIN_MASK;
+		outbins[i] = inbins[j];
 		i++;
+		j += fft_sz;
 	}
 }
 
@@ -588,6 +586,12 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 
 	lockdep_assert_held(&ar->spectral.lock);
 
+	if (!ab->hw_params.spectral_fft_sz) {
+		ath11k_warn(ab, "invalid bin size type for hw rev %d\n",
+			    ab->hw_rev);
+		return -EINVAL;
+	}
+
 	tlv = (struct spectral_tlv *)data;
 	tlv_len = FIELD_GET(SPECTRAL_TLV_HDR_LEN, __le32_to_cpu(tlv->header));
 	/* convert Dword into bytes */
@@ -649,9 +653,8 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	freq = summary->meta.freq2;
 	fft_sample->freq2 = __cpu_to_be16(freq);
 
-	ath11k_spectral_parse_16bit_fft(fft_sample->data,
-					fft_report->bins,
-					num_bins);
+	ath11k_spectral_parse_fft(fft_sample->data, fft_report->bins,
+				  num_bins, ab->hw_params.spectral_fft_sz);
 
 	fft_sample->max_exp = ath11k_spectral_get_max_exp(fft_sample->max_index,
 							  search.peak_mag,
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
