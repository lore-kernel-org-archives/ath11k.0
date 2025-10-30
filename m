Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8561BCCF9FA
	for <ath11k@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCLFs78Sdm17inBFh7Sx5FZ8I8XuvthrkpG5LmudJXA=; b=qVpXDtnIJXuiHcNZHHVkP6UOhp
	LFBV5YV8o4Mk7zW8AT3LyaISpCAOzlxOEuTQNrTNl45bvwlaVtmxpTdmZ4TvLtf2/Z02uROyVQS+6
	nCjHcQlYOvW6AwJrP947VZ+jSRF6ON98zLmfooFi4ynff2IYr6+Iasx2ZBiWTEqEqtB704IQHJsuN
	00a3D1gPKKr9/uIlLnwenkh53URCfiaTmffG9O2LXsotJ8ve+lOQpCzAJtu7Q990+iIJQmF9fvZGn
	RcL7Jtg3Yd88ISU5v918LkRHcPxdsRUCaLe8MEtM4lSwVNBfDdHV/iBzinnkWTt4Ov+/pkzARuy+U
	9M3O+7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKP-00000003SiU-0aV9;
	Thu, 30 Oct 2025 04:32:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKM-00000003Sev-3pIl
	for ath11k@lists.infradead.org;
	Thu, 30 Oct 2025 04:32:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TL7H2H1579018
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MCLFs78Sdm1
	7inBFh7Sx5FZ8I8XuvthrkpG5LmudJXA=; b=Qwih7JQ65x3c6HrgFwilOThQpDe
	bH9IGMUtEtLq3aE01Whkd7qHybmYcHhfTN23hm+yCf4N/thLZeF0S4NYUfNTwHni
	7dzPvhVhAPwMt2IMjSDVm7CJevmz3gOWP7TIDAy1w1ocmD/wX8L5hxdi4PhJq7e8
	RuKxfqBcV/HU2OiXR40Bma5Twm20WYxOASCu8e2LNCWTEeVb2NJqKxc3sHj2U4bf
	NB8heo2SPP3L40CmYCVoOxOR1L+iItHB/Wr/R5zg7H84/k05amBRc/KclYkDgSmE
	wa9U3HHycGCycS5rNNiKNXt9YDkTdl5Bv+8sNmEMjkNkboKxOYj5Wyg+bBA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjeh1c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso611792b3a.2
        for <ath11k@lists.infradead.org>; Wed, 29 Oct 2025 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761798718; x=1762403518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCLFs78Sdm17inBFh7Sx5FZ8I8XuvthrkpG5LmudJXA=;
        b=YNroWGC1ksm0I1IbSbtfBabi7zlnlkK/O4r7bjBdOBfZ2n8svwJ4AW+z4UlemOTN1Q
         Pf7VLq6bK9zV7D2CLda2CXwLr7kKXsuJgRzR2wrnkPN/cLiUMZ36rsgEWbpj24u1nwZ0
         DaaJecAYm6Nd+EWnjVoM0FtS7CgHDs9MLbjkvSecIv+EmRWhwJf5F3Wcj4NJZQN4DK3B
         6YrOUfllxA1Cff3wwBgLBTRjOom1LEhbRu+mXuqeDksI8hkDgSihjs1ib7T11R0YSyxO
         IT81GskYpwVOfovYN+r4+qatjv6g5uZ/V2HYNL6Jomd5S7gAtHMX9VwSVQwrn193ryvR
         7seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761798718; x=1762403518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCLFs78Sdm17inBFh7Sx5FZ8I8XuvthrkpG5LmudJXA=;
        b=inBLi4twSaRRlynyXyXwILsFk6yw90u61RlMhcSvOuwqTO7tD2HeYfAhQXkMc6AGv9
         8H+hVX84gsLyaY+LsbSgZoNLOXGDQOzuXwue79WTH+FUxPbN7Xz193H+nXabnSis6beu
         xJ9Qs57LhAcS1q9DothDIaSovoGkJaq+VQm4q8Jj5sBTBjddzxMhN6s0qknOtJs17RLa
         3UCEGFSUoWnc/7aGmRfEcjvggDHtcU45KUJSRUztJKzHyyKX8AIY3tGDbCEqI0wCFwzb
         leaFY+qhoIHGFkw5P+6fFXZak0+0dxSJgD+Xvp3P9wGrztlAhCteQ6o1sfPf8xN4V40O
         WVWA==
X-Forwarded-Encrypted: i=1; AJvYcCUnlONpIJs5OoJknymkTnPnE37ONZY3P2hH2ooQwz3IxctEGlwpMKm99dlg1NbbEtbfXJhpaNM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDLFRxEk4g/MZvm5jkbTsRjqkAPDmy6wyG94JklUkQmAn3T4T9
	iMAZXpaGUxt2GSWA58oJ7VO/qtAEKtRbyIXH3cq+nUbgOcoGua1WyNeR3UWETuV4b+iTWc4JlRk
	mJ50wf8UC33Aa0aHpv/QrE0obxGYXsTyIrqaw/PHZC6D+00K5wLybXLcQRQ99roNF
X-Gm-Gg: ASbGncvZAPs9ELpOkeAHdjywKL3Qt/iSz3sUAqusq9r/eENPzqQ4GhGhg9yWBcGx/Xx
	QxLE5scsPmHVOLKuYda+I8lQoxysqxYbuQyvSqV0I5ia8/Q8P9WZkzlZKJ8NnRgAQ5IjZtR8niA
	Ba6GiM+Dci7VYfdRg7XAJlSFawM2mAxxUq8gzLT27GdGrtcIGxoUmbnWS84/sbV1pFkbTAWl5tF
	DBRvoAJRttisIkASJdWI4Ghzv6S0sg+t/xcqnzyrFFLj8PewWQUj8X6SZuwpfyEOFbui+Pca4pz
	SwAqtcE9EIRkMVeid8IleYtdI8mqcTzAnS4IQ1ree9oLHG5YJdkuvYiOrzoaqMqeqzCNDhUn3vC
	ZacAtdVQDGpfG/EicXQ7SfqGRxBVg7rG5zPBoKhLUvKcs
X-Received: by 2002:a05:6a00:3e25:b0:781:2740:11b2 with SMTP id d2e1a72fcca58-7a626b0f088mr2343449b3a.25.1761798717287;
        Wed, 29 Oct 2025 21:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAfBl2G5onTm/2C63I66scK6Jblniz4LlgqBi4Ewn6uGe/WRu1H7dbc64jNJvoI1t+3sW+/Q==
X-Received: by 2002:a05:6a00:3e25:b0:781:2740:11b2 with SMTP id d2e1a72fcca58-7a626b0f088mr2343390b3a.25.1761798716609;
        Wed, 29 Oct 2025 21:31:56 -0700 (PDT)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409e456sm16912161b3a.71.2025.10.29.21.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:31:56 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Subject: [PATCH ath-next 5/6] wifi: ath11k: Register DBR event handler for CFR data
Date: Wed, 29 Oct 2025 21:31:49 -0700
Message-Id: <20251030043150.3905086-6-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3UlEkXRw2DtRSZ2YvXr6CyPfHyZ5_6ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzNCBTYWx0ZWRfX2lqHyE5uksSr
 +Tk2pmhclnVog+r6hCZaJsaY2uXWmSRRJPY5XVd9MT5QH6E+YXbhQDsY5fE6FsLkZZ/xE2eVHnJ
 SJ/Gd6kUI7MBNu3K5gcqfC7k59sOz7clR3svniBIQcpRrxz3qR1YJCbVzyfTwkb6NNIuETYrpzw
 CNFuro8vmJCESuKwcgFCDZY9N/eiosZmnhDXO4XzuCJ3zuKXoE2ohKIBBtxm0ZQa9tQJNih8cU3
 pyX/dr17D4r5ilL4IRAV6glivexhvZQouV0jQE/Okl4Y6MKeDASawvmN/MOk+t1PzXB9w9th9yE
 DXIHHPFpbIFmxTu0B1oO4819YhIESsKJcgQhv711+W8d9eMen5l9MyhhOzmrt9Z9JcJoosbSn4W
 qQNZuu7DV74yKKeVa+Xn52kXLqz+9Q==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6902ea3e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=X6MYPc9AQ2pAf6QSHKQA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3UlEkXRw2DtRSZ2YvXr6CyPfHyZ5_6ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_213158_965694_68EC5D16 
X-CRM114-Status: GOOD (  26.71  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

Add handler for WMI_PDEV_DMA_RING_BUF_RELEASE_EVENT which indicates CFR
data availability in the DB ring.

Add CFR data processing from DB ring buffers. Use correlate_and_relay
API to match CFR data with metadata from WMI_PEER_CFR_CAPTURE_EVENT.

Release buffer to userspace through relayfs on successful correlation,
otherwise hold buffer waiting for matching WMI event from firmware.

Add new debug masks:
 - ATH11K_DBG_CFR:      Enables CFR-related debug logs.
 - ATH11K_DBG_CFR_DUMP: Enables detailed CFR data dump for analysis.

Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c    | 235 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/cfr.h    |  82 ++++++++
 drivers/net/wireless/ath/ath11k/dbring.c |  10 +-
 drivers/net/wireless/ath/ath11k/dbring.h |   2 +
 drivers/net/wireless/ath/ath11k/debug.h  |   8 +-
 5 files changed, 334 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index 0a7dcf7b7793..e8a976d64733 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -8,10 +8,243 @@
 #include "core.h"
 #include "debug.h"
 
+struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar)
+{
+	if (ar->cfr_enabled)
+		return &ar->cfr.rx_ring;
+
+	return NULL;
+}
+
+static int ath11k_cfr_calculate_tones_from_dma_hdr(struct ath11k_cfr_dma_hdr *hdr)
+{
+	u8 bw = FIELD_GET(CFIR_DMA_HDR_INFO1_UPLOAD_PKT_BW, hdr->info1);
+	u8 preamble = FIELD_GET(CFIR_DMA_HDR_INFO1_PREAMBLE_TYPE, hdr->info1);
+
+	switch (preamble) {
+	case ATH11K_CFR_PREAMBLE_TYPE_LEGACY:
+		fallthrough;
+	case ATH11K_CFR_PREAMBLE_TYPE_VHT:
+		switch (bw) {
+		case 0:
+			return TONES_IN_20MHZ;
+		case 1: /* DUP40/VHT40 */
+			return TONES_IN_40MHZ;
+		case 2: /* DUP80/VHT80 */
+			return TONES_IN_80MHZ;
+		case 3: /* DUP160/VHT160 */
+			return TONES_IN_160MHZ;
+		default:
+			return TONES_INVALID;
+		}
+	case ATH11K_CFR_PREAMBLE_TYPE_HT:
+		switch (bw) {
+		case 0:
+			return TONES_IN_20MHZ;
+		case 1:
+			return TONES_IN_40MHZ;
+		default:
+			return TONES_INVALID;
+		}
+	default:
+		return TONES_INVALID;
+	}
+}
+
+void ath11k_cfr_release_lut_entry(struct ath11k_look_up_table *lut)
+{
+	memset(lut, 0, sizeof(*lut));
+}
+
+static void ath11k_cfr_rfs_write(struct ath11k *ar, const void *head,
+				 u32 head_len, const void *data, u32 data_len,
+				 const void *tail, int tail_data)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+
+	if (!cfr->rfs_cfr_capture)
+		return;
+
+	relay_write(cfr->rfs_cfr_capture, head, head_len);
+	relay_write(cfr->rfs_cfr_capture, data, data_len);
+	relay_write(cfr->rfs_cfr_capture, tail, tail_data);
+	relay_flush(cfr->rfs_cfr_capture);
+}
+
+static void ath11k_cfr_free_pending_dbr_events(struct ath11k *ar)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct ath11k_look_up_table *lut;
+	int i;
+
+	if (!cfr->lut)
+		return;
+
+	for (i = 0; i < cfr->lut_num; i++) {
+		lut = &cfr->lut[i];
+		if (lut->dbr_recv && !lut->tx_recv &&
+		    lut->dbr_tstamp < cfr->last_success_tstamp) {
+			ath11k_dbring_bufs_replenish(ar, &cfr->rx_ring, lut->buff,
+						     WMI_DIRECT_BUF_CFR);
+			ath11k_cfr_release_lut_entry(lut);
+			cfr->flush_dbr_cnt++;
+		}
+	}
+}
+
+/* Correlate and relay: This function correlate the data coming from
+ * WMI_PDEV_DMA_RING_BUF_RELEASE_EVENT(DBR event) and
+ * WMI_PEER_CFR_CAPTURE_EVENT(Tx capture event).
+ * If both the events are received and PPDU id matches from both the
+ * events, return CORRELATE_STATUS_RELEASE which means relay the
+ * correlated data to user space. Otherwise return CORRELATE_STATUS_HOLD
+ * which means wait for the second event to come.
+ *
+ * It also check for the pending DBR events and clear those events
+ * in case of corresponding TX capture event is not received for
+ * the PPDU.
+ */
+
+static enum ath11k_cfr_correlate_status
+ath11k_cfr_correlate_and_relay(struct ath11k *ar,
+			       struct ath11k_look_up_table *lut,
+			       u8 event_type)
+{
+	enum ath11k_cfr_correlate_status status;
+	struct ath11k_cfr *cfr = &ar->cfr;
+	u64 diff;
+
+	if (event_type == ATH11K_CORRELATE_TX_EVENT) {
+		if (lut->tx_recv)
+			cfr->cfr_dma_aborts++;
+		cfr->tx_evt_cnt++;
+		lut->tx_recv = true;
+	} else if (event_type == ATH11K_CORRELATE_DBR_EVENT) {
+		cfr->dbr_evt_cnt++;
+		lut->dbr_recv = true;
+	}
+
+	if (lut->dbr_recv && lut->tx_recv) {
+		if (lut->dbr_ppdu_id == lut->tx_ppdu_id) {
+			/* We are using 64-bit counters here. So, it may take
+			 * several year to hit wraparound. Hence, not handling
+			 * the wraparound condition.
+			 */
+			cfr->last_success_tstamp = lut->dbr_tstamp;
+			if (lut->dbr_tstamp > lut->txrx_tstamp) {
+				diff = lut->dbr_tstamp - lut->txrx_tstamp;
+				ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
+					   "txrx event -> dbr event delay = %u ms",
+					   jiffies_to_msecs(diff));
+			} else if (lut->txrx_tstamp > lut->dbr_tstamp) {
+				diff = lut->txrx_tstamp - lut->dbr_tstamp;
+				ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
+					   "dbr event -> txrx event delay = %u ms",
+					   jiffies_to_msecs(diff));
+			}
+
+			ath11k_cfr_free_pending_dbr_events(ar);
+
+			cfr->release_cnt++;
+			status = ATH11K_CORRELATE_STATUS_RELEASE;
+		} else {
+			/* When there is a ppdu id mismatch, discard the TXRX
+			 * event since multiple PPDUs are likely to have same
+			 * dma addr, due to ucode aborts.
+			 */
+
+			ath11k_dbg(ar->ab, ATH11K_DBG_CFR,
+				   "Received dbr event twice for the same lut entry");
+			lut->tx_recv = false;
+			lut->tx_ppdu_id = 0;
+			cfr->clear_txrx_event++;
+			cfr->cfr_dma_aborts++;
+			status = ATH11K_CORRELATE_STATUS_HOLD;
+		}
+	} else {
+		status = ATH11K_CORRELATE_STATUS_HOLD;
+	}
+
+	return status;
+}
+
 static int ath11k_cfr_process_data(struct ath11k *ar,
 				   struct ath11k_dbring_data *param)
 {
-	return 0;
+	u32 end_magic = ATH11K_CFR_END_MAGIC;
+	struct ath11k_csi_cfr_header *header;
+	struct ath11k_cfr_dma_hdr *dma_hdr;
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct ath11k_look_up_table *lut;
+	struct ath11k_base *ab = ar->ab;
+	u32 buf_id, tones, length;
+	u8 num_chains;
+	int status;
+	u8 *data;
+
+	data = param->data;
+	buf_id = param->buf_id;
+
+	if (param->data_sz < sizeof(*dma_hdr))
+		return -EINVAL;
+
+	dma_hdr = (struct ath11k_cfr_dma_hdr *)data;
+
+	tones = ath11k_cfr_calculate_tones_from_dma_hdr(dma_hdr);
+	if (tones == TONES_INVALID) {
+		ath11k_warn(ar->ab, "Number of tones received is invalid\n");
+		return -EINVAL;
+	}
+
+	num_chains = FIELD_GET(CFIR_DMA_HDR_INFO1_NUM_CHAINS,
+			       dma_hdr->info1);
+
+	length = sizeof(*dma_hdr);
+	length += tones * (num_chains + 1);
+
+	spin_lock_bh(&cfr->lut_lock);
+
+	if (!cfr->lut) {
+		spin_unlock_bh(&cfr->lut_lock);
+		return -EINVAL;
+	}
+
+	lut = &cfr->lut[buf_id];
+
+	ath11k_dbg_dump(ab, ATH11K_DBG_CFR_DUMP, "data_from_buf_rel:", "",
+			data, length);
+
+	lut->buff = param->buff;
+	lut->data = data;
+	lut->data_len = length;
+	lut->dbr_ppdu_id = dma_hdr->phy_ppdu_id;
+	lut->dbr_tstamp = jiffies;
+
+	memcpy(&lut->hdr, dma_hdr, sizeof(*dma_hdr));
+
+	header = &lut->header;
+	header->meta_data.channel_bw = FIELD_GET(CFIR_DMA_HDR_INFO1_UPLOAD_PKT_BW,
+						 dma_hdr->info1);
+	header->meta_data.length = length;
+
+	status = ath11k_cfr_correlate_and_relay(ar, lut,
+						ATH11K_CORRELATE_DBR_EVENT);
+	if (status == ATH11K_CORRELATE_STATUS_RELEASE) {
+		ath11k_dbg(ab, ATH11K_DBG_CFR,
+			   "releasing CFR data to user space");
+		ath11k_cfr_rfs_write(ar, &lut->header,
+				     sizeof(struct ath11k_csi_cfr_header),
+				     lut->data, lut->data_len,
+				     &end_magic, sizeof(u32));
+		ath11k_cfr_release_lut_entry(lut);
+	} else if (status == ATH11K_CORRELATE_STATUS_HOLD) {
+		ath11k_dbg(ab, ATH11K_DBG_CFR,
+			   "tx event is not yet received holding the buf");
+	}
+
+	spin_unlock_bh(&cfr->lut_lock);
+
+	return status;
 }
 
 /* Helper function to check whether the given peer mac address
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index 4653b04c30de..e8b5c23b15cc 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -19,9 +19,78 @@
 
 #define HOST_MAX_CHAINS 8
 
+enum ath11k_cfr_correlate_event_type {
+	ATH11K_CORRELATE_DBR_EVENT,
+	ATH11K_CORRELATE_TX_EVENT,
+};
+
 struct ath11k_sta;
 struct ath11k_per_peer_cfr_capture;
 
+#define ATH11K_CFR_END_MAGIC 0xBEAFDEAD
+
+enum ath11k_cfr_correlate_status {
+	ATH11K_CORRELATE_STATUS_RELEASE,
+	ATH11K_CORRELATE_STATUS_HOLD,
+	ATH11K_CORRELATE_STATUS_ERR,
+};
+
+enum ath11k_cfr_preamble_type {
+	ATH11K_CFR_PREAMBLE_TYPE_LEGACY,
+	ATH11K_CFR_PREAMBLE_TYPE_HT,
+	ATH11K_CFR_PREAMBLE_TYPE_VHT,
+};
+
+struct cfr_metadata {
+	u8 peer_addr[ETH_ALEN];
+	u8 status;
+	u8 capture_bw;
+	u8 channel_bw;
+	u8 phy_mode;
+	u16 prim20_chan;
+	u16 center_freq1;
+	u16 center_freq2;
+	u8 capture_mode;
+	u8 capture_type;
+	u8 sts_count;
+	u8 num_rx_chain;
+	u32 timestamp;
+	u32 length;
+	u32 chain_rssi[HOST_MAX_CHAINS];
+	u16 chain_phase[HOST_MAX_CHAINS];
+	u32 cfo_measurement;
+	u8 agc_gain[HOST_MAX_CHAINS];
+	u32 rx_start_ts;
+} __packed;
+
+struct ath11k_csi_cfr_header {
+	u32 start_magic_num;
+	u32 vendorid;
+	u8 cfr_metadata_version;
+	u8 cfr_data_version;
+	u8 chip_type;
+	u8 platform_type;
+	u32 reserved;
+	struct cfr_metadata meta_data;
+} __packed;
+
+#define TONES_IN_20MHZ  256
+#define TONES_IN_40MHZ  512
+#define TONES_IN_80MHZ  1024
+#define TONES_IN_160MHZ 2048 /* 160 MHz isn't supported yet */
+#define TONES_INVALID   0
+
+#define CFIR_DMA_HDR_INFO0_TAG GENMASK(7, 0)
+#define CFIR_DMA_HDR_INFO0_LEN GENMASK(13, 8)
+
+#define CFIR_DMA_HDR_INFO1_UPLOAD_DONE      GENMASK(0, 0)
+#define CFIR_DMA_HDR_INFO1_CAPTURE_TYPE     GENMASK(3, 1)
+#define CFIR_DMA_HDR_INFO1_PREAMBLE_TYPE    GENMASK(5, 4)
+#define CFIR_DMA_HDR_INFO1_NSS              GENMASK(8, 6)
+#define CFIR_DMA_HDR_INFO1_NUM_CHAINS       GENMASK(11, 9)
+#define CFIR_DMA_HDR_INFO1_UPLOAD_PKT_BW    GENMASK(14, 12)
+#define CFIR_DMA_HDR_INFO1_SW_PEER_ID_VALID GENMASK(15, 15)
+
 struct ath11k_cfr_dma_hdr {
 	u16 info0;
 	u16 info1;
@@ -37,6 +106,7 @@ struct ath11k_look_up_table {
 	u16 dbr_ppdu_id;
 	u16 tx_ppdu_id;
 	dma_addr_t dbr_address;
+	struct ath11k_csi_cfr_header header;
 	struct ath11k_cfr_dma_hdr hdr;
 	u64 txrx_tstamp;
 	u64 dbr_tstamp;
@@ -108,6 +178,8 @@ int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 					 struct ath11k_sta *arsta,
 					 struct ath11k_per_peer_cfr_capture *params,
 					 const u8 *peer_mac);
+struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar);
+void ath11k_cfr_release_lut_entry(struct ath11k_look_up_table *lut);
 
 #else
 static inline int ath11k_cfr_init(struct ath11k_base *ab)
@@ -155,5 +227,15 @@ ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
 {
 	return 0;
 }
+
+static inline void ath11k_cfr_release_lut_entry(struct ath11k_look_up_table *lut)
+{
+}
+
+static inline
+struct ath11k_dbring *ath11k_cfr_get_dbring(struct ath11k *ar)
+{
+	return NULL;
+}
 #endif /* CONFIG_ATH11K_CFR */
 #endif /* ATH11K_CFR_H */
diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index ed2b781a6bab..d6994ce6ebff 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.c
+++ b/drivers/net/wireless/ath/ath11k/dbring.c
@@ -295,6 +295,7 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 	int size;
 	dma_addr_t paddr;
 	int ret = 0;
+	int status;
 
 	pdev_idx = ev->fixed.pdev_id;
 	module_id = ev->fixed.module_id;
@@ -328,6 +329,9 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 	case WMI_DIRECT_BUF_SPECTRAL:
 		ring = ath11k_spectral_get_dbring(ar);
 		break;
+	case WMI_DIRECT_BUF_CFR:
+		ring = ath11k_cfr_get_dbring(ar);
+		break;
 	default:
 		ring = NULL;
 		ath11k_warn(ab, "Recv dma buffer release ev on unsupp module %d\n",
@@ -378,8 +382,12 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 			handler_data.data = PTR_ALIGN(vaddr_unalign,
 						      ring->buf_align);
 			handler_data.data_sz = ring->buf_sz;
+			handler_data.buff = buff;
+			handler_data.buf_id = buf_id;
 
-			ring->handler(ar, &handler_data);
+			status = ring->handler(ar, &handler_data);
+			if (status == ATH11K_CORRELATE_STATUS_HOLD)
+				continue;
 		}
 
 		buff->paddr = 0;
diff --git a/drivers/net/wireless/ath/ath11k/dbring.h b/drivers/net/wireless/ath/ath11k/dbring.h
index 0a380120f7a0..e5f244dfa963 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.h
+++ b/drivers/net/wireless/ath/ath11k/dbring.h
@@ -21,6 +21,8 @@ struct ath11k_dbring_data {
 	void *data;
 	u32 data_sz;
 	struct wmi_dma_buf_release_meta_data meta;
+	struct ath11k_dbring_element *buff;
+	u32 buf_id;
 };
 
 struct ath11k_dbring_buf_release_event {
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index cc8934d15697..aaa0034527a5 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH11K_DEBUG_H_
@@ -27,6 +27,8 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_DP_TX	= 0x00002000,
 	ATH11K_DBG_DP_RX	= 0x00004000,
 	ATH11K_DBG_CE		= 0x00008000,
+	ATH11K_DBG_CFR		= 0x00010000,
+	ATH11K_DBG_CFR_DUMP	= 0x00020000,
 };
 
 static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
@@ -64,6 +66,10 @@ static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
 		return "dp_rx";
 	case ATH11K_DBG_CE:
 		return "ce";
+	case ATH11K_DBG_CFR:
+		return "cfr";
+	case ATH11K_DBG_CFR_DUMP:
+		return "cfr_dump";
 
 	/* no default handler to allow compiler to check that the
 	 * enum is fully handled
-- 
2.34.1


