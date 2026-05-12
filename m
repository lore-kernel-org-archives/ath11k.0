Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F6CCD4846
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHuEOWTWgkuFCgRCml8bt7nPD8/09L3zu8ijOwpUPws=; b=pEQqBMcWovz0m6MlbEDQiEhDC5
	fDQB3r0CzDY6N5X+kfDfzZaCU49JAQqgnR8WT6LxZtb/Eioa4tSzgBJG8Nyst5qh/gqw6l0k9SV/O
	Fn1glNd6XqV4LSE/tjFnds9Vz/eJKONoroxyWHMor6+d2DcDU7R1jLG9zcHJ4NM0uUZCmTsR9+CLj
	1koMblFMf356NYPzw+cMdDQWIFT1K9SnyjB1YH9U5pFvIpsxie0lR4HnZH8pjqtKknd3xypQqeOPs
	O/A8zs3j4uvX1kT5n5eduERRM594TpF/vHbY/aXj2s4BgtwinjsT9MJ57oeJB7w+nHDFiUEXTcj98
	CDLNoUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcmy-0000000FGKx-0rtl;
	Tue, 12 May 2026 02:24:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcmv-0000000FGK9-3bcn
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 02:24:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6Weo2994880
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vHuEOWTWgku
	FCgRCml8bt7nPD8/09L3zu8ijOwpUPws=; b=Eo9tHR3AVszig8PXZK7//OygSEa
	mfAMvqEh2o8mzVDkFu2ZbTUxZv/96QNGEf3SOoD/meaaAsnMP+y5hkcl32RvFqAP
	XSFA7IbkYxFNstTOzZeJf6FersXOmLvkdRBH+EvYRFMbfnKHn3hkcbMgr7B8AvLW
	fawyVruhB2uTuPialscJaE8Roog6lHxMEyRsAcem0cleEwUE0ttpqzPXfr66nNWx
	gBxes5lVGU6eQ5NjCh8M7TMKFLafwpABlpzSyWdLJYeIrDac/vmU2GpUjMSJHpDq
	688/qyKkRWZ5fNMQNETXD3XysXg2Mp0tfjD/Qjc28hcXA3PKl5Ta9dmz1SQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0s397-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:24:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso3468180b3a.3
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778552640; x=1779157440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHuEOWTWgkuFCgRCml8bt7nPD8/09L3zu8ijOwpUPws=;
        b=cyjD3g7BW2h4GZZoKGM0yASNNSs4SNyw0UNSK8Rq1k2KDmZTi935nv9K/jAjFGWays
         k2Uwl1XRb/mdEIPIBis8m8QlkeSZmyw43pwTn7DQ4RUlnhAG1WQ5OJ1Iqm3ErAIosw/I
         OIYijPgaOBEq4VyQ7tZaZ/HN3+NJrxxgpeQJS3d1VpJuriCIfYCrr0a5QRLfqlIwgymE
         5ivLgsuzbOkQ3mn3NNDfrC1hFE55GJFkPUnvJ8FIfMUcC+lHcLET9DtPxhG8eJrvd91Q
         vUzV7+yC68wwVxR79h+qHjv24GDNTGhCEZGaD1Wb8QtK8neZIzQwVuijPCWQP60PWLUd
         7C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778552640; x=1779157440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHuEOWTWgkuFCgRCml8bt7nPD8/09L3zu8ijOwpUPws=;
        b=A7hUMwLkaADBzyP9UJXB5iL7ii8VaV+ksQwGAg4GxoDqi4yYc+UegW7GPoRHzhLuMl
         ua94l6SptbG5so3xLsII8sWFBnchDUJsS1OT6093Fr6+0hWJPYtJb2/bTc+ipRfHa0fN
         ZKrdzVmCxkRWLjqhkJJqyUXwTu4fqRTiQ3HNm9L4oXkWpx+pYJV/vYCC7oxqYZhgN9En
         a6A6xaPN2sKLbVH0qSzW5Gr0LwN82O9Jghw/pwUpx+hmvay2XzUJMcVvxa788ZVK6lwI
         hXmb3cxImBTUhs8Djn9RVJvyz5xHfm5khnpSfVHC349Jf5/7o12oe9h5dxuHMxKGryMV
         aZvg==
X-Gm-Message-State: AOJu0YxuiUz0ImF/YARwum1ucb7oKC/enQ4NtaLPI8anxFAT4wk8hN+c
	ypiqCzluZ1VMViBBo5b+/KV/JbFHVpUycJW3ZQz85ZPWmYUFNeq7GuY4nZShTpWFWtflVSUuHdc
	JB9pDYdOAA8e1yiEWMkUdCP6QgUQtgf8cELb46ctwkz6yJMS7zuP0zGX5DBsu3GM4
X-Gm-Gg: Acq92OGjfwuD5HgZd89ZPnZf1gXiG7FX/uXeUTuetYgsSTRAgVRBVxOlJnf8QlIhaNX
	/l1UStO2aDgx4GaHZXE1VENjqkNUcD3sTbXab4ytmNRc2Hq1+xC/D9meWU9XmP9Tv2CqootA9fl
	mSt6SBXqn3WGV7qtEUBb02CdweOkIVV1y65pyEMSKwfCM9UQ9g+Ld3eJBX/5a4+uyUAHuXa9H8M
	8OGflIq0iGUqpGSEDxKnjyrZPIaJbrM4vYOPdNyxse8AFKKYoUxoJd9RjbWIV5QDbrFb42Bl1Go
	JYybcDuCZW+4CgNMIzagHWIkYGecG07w/wUy7YY66E7m9HfiuXNwPwYnaz59fmuU567bWRPZRpH
	HRL9wSsLKC81UR20yslC71/ywSG0yALjTGwZ4uz9bPJCVGyZCcJ7XWTfwV7ooAHbUDOFf7GU7Uk
	KTffQc
X-Received: by 2002:aa7:9314:0:b0:82f:5d4f:7355 with SMTP id d2e1a72fcca58-83eebc2c657mr972674b3a.33.1778552639863;
        Mon, 11 May 2026 19:23:59 -0700 (PDT)
X-Received: by 2002:aa7:9314:0:b0:82f:5d4f:7355 with SMTP id d2e1a72fcca58-83eebc2c657mr972652b3a.33.1778552639338;
        Mon, 11 May 2026 19:23:59 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm25199256b3a.40.2026.05.11.19.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:23:59 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
Date: Tue, 12 May 2026 10:23:50 +0800
Message-Id: <20260512022351.2033155-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a028f40 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pyFkC3i_6phWDu-JDTMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: cmxiU4sxyZ69hS_TyMtUajbm51E-1S4k
X-Proofpoint-ORIG-GUID: cmxiU4sxyZ69hS_TyMtUajbm51E-1S4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyMCBTYWx0ZWRfX31MHTctHA/Ez
 CBtMgumDvZXBO2hLhAWcGhLlDViSxxcKZ/jRFu+vF1G3rRPgF4Svz0/lFFeeprnruDmvSfjACIT
 9RputwF/NRgotwhV0Amr2/TO6sSsWOO5leAjPJ2n5xC0BRm95dJsIW7wX6GepV9ZEaYSbNDseqy
 geKN1KetrQ2lhpkba3HJE/U/VqjImDm22QdaSsTWnX9GqqHAvVg5V8x3MRUii3n/QlKPjWFvawM
 /4RtWpOju3VyAW54T5FwwHbxD8KZMls//MbJtDHOYGJDEXoggZF336yNOlWFeXfHGB5EYxko+tS
 cTrDw/NFizwXjKxWpVHj1p1GCCof+Ot/rMEreKmizNoyFAr9Qj2GP8Nm/Tw8FVzJJ2Lk08vI6kx
 3Zs4gNU9ejvFio2zfk5RRNfNW7G69BUXbloN771+zBxPEIz0RtN7rpmjTTZPVa36J2wwyhdab1/
 Bm/rzlsyOttSwcSqM8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_192402_040402_733669B7 
X-CRM114-Status: GOOD (  15.92  )
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

In certain cases, hardware might provide packets with a
length greater than the maximum native Wi-Fi header length.
This can lead to accessing and modifying fields in the header
within the ath11k_dp_rx_h_undecap_nwifi() function for the
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
potentially result in invalid data access and memory corruption.

Kernel stack is corrupted in: ath11k_dp_rx_h_undecap+0x6b0/0x6b0 [ath11k]
Call trace:
 ath11k_dp_rx_h_mpdu+0x0/0x2e8 [ath11k]
 ath11k_dp_rx_h_mpdu+0x1e0/0x2e8 [ath11k]
 ath11k_dp_rx_wbm_err+0x1e0/0x450 [ath11k]
 ath11k_dp_rx_process_wbm_err+0x2fc/0x460 [ath11k]
 ath11k_dp_service_srng+0x2e0/0x348 [ath11k]

Add a sanity check before processing the SKB to prevent invalid
data access in the undecap native Wi-Fi function for the
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.

This adapted from the discussion/patch of the ath12k driver [1].

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Link: https://lore.kernel.org/linux-wireless/20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com/ # [1]
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 50 +++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index fe79109adc70..fbe2061a544d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2502,6 +2502,29 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
 }
 
+static bool ath11k_dp_rx_check_nwifi_hdr_len_valid(struct ath11k_base *ab,
+						   struct hal_rx_desc *rx_desc,
+						   struct sk_buff *msdu)
+{
+	struct ieee80211_hdr *hdr;
+	u8 decap_type;
+	u32 hdr_len;
+
+	decap_type = ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc);
+	if (decap_type != DP_RX_DECAP_TYPE_NATIVE_WIFI)
+		return true;
+
+	hdr = (struct ieee80211_hdr *)msdu->data;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+
+	if ((likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN)))
+		return true;
+
+	ab->soc_stats.invalid_rbm++;
+	WARN_ON_ONCE(1);
+	return false;
+}
+
 static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 				     struct sk_buff *msdu,
 				     struct sk_buff_head *msdu_list,
@@ -2572,6 +2595,11 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 		}
 	}
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ab, rx_desc, msdu))) {
+		ret = -EINVAL;
+		goto free_out;
+	}
+
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
 	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
 
@@ -3261,6 +3289,12 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
 	skb_pull(msdu, hal_rx_desc_sz);
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ar->ab, rx_desc,
+							     msdu))) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rxs);
 	ath11k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, rxs, true);
@@ -3953,6 +3987,10 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 	}
+
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ar->ab, desc, msdu)))
+		return -EINVAL;
+
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
 	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
@@ -3997,7 +4035,7 @@ static bool ath11k_dp_rx_h_reo_err(struct ath11k *ar, struct sk_buff *msdu,
 	return drop;
 }
 
-static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
+static bool ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 					struct ieee80211_rx_status *status)
 {
 	u16 msdu_len;
@@ -4005,6 +4043,7 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 	u8 l3pad_bytes;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	u32 hal_rx_desc_sz = ar->ab->hw_params.hal_desc_sz;
+	struct ath11k_base *ab = ar->ab;
 
 	rxcb->is_first_msdu = ath11k_dp_rx_h_msdu_end_first_msdu(ar->ab, desc);
 	rxcb->is_last_msdu = ath11k_dp_rx_h_msdu_end_last_msdu(ar->ab, desc);
@@ -4014,6 +4053,9 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ab, desc, msdu)))
+		return true;
+
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
 	status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
@@ -4021,19 +4063,21 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_undecap(ar, msdu, desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, status, false);
+
+	return false;
 }
 
 static bool ath11k_dp_rx_h_rxdma_err(struct ath11k *ar,  struct sk_buff *msdu,
 				     struct ieee80211_rx_status *status)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
-	bool drop = false;
+	bool drop;
 
 	ar->ab->soc_stats.rxdma_error[rxcb->err_code]++;
 
 	switch (rxcb->err_code) {
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_TKIP_MIC_ERR:
-		ath11k_dp_rx_h_tkip_mic_err(ar, msdu, status);
+		drop = ath11k_dp_rx_h_tkip_mic_err(ar, msdu, status);
 		break;
 	default:
 		/* TODO: Review other rxdma error code to check if anything is
-- 
2.34.1


