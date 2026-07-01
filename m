Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C575C43458
	for <ath11k@archiver.kernel.org>; Wed,  1 Jul 2026 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQexzviQesYtFmxybT4rIPZDP12EthyB0Le/+SnIPwU=; b=DEwnC8S3u7vJm2D8/E9rIJfEO4
	zh53yneq9XTfJ+g6Inp6yQHkGisTzc7dphtsFffmHVw11vgzP7fyaSJj1xASXe7Y0h6/0L2nSya9z
	v1jtmeBT84RZID9raiAbPs9y3dsrkuhmioSY6KwJWyubLAPCcF8/iDGWhkC6qCe9D889+JPzHW+lg
	CLPmUyQNyd24w6dc3iaJmGm4G0YRyu2XGFMj7XcV1FqTj6N3ryav8iAkztHhO9zD59WVXnDd4FIT5
	W9McmuhGOZraQtEWDPAVUBWn6GA/MI0XWn8XE6E/x/HwtQDQAL1rTE47NIPgsa6xkPsDYGFWCpaQL
	Cg5ydSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek51-00000000TA2-44KO;
	Wed, 01 Jul 2026 01:49:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek4z-00000000T9W-0Tyf
	for ath11k@lists.infradead.org;
	Wed, 01 Jul 2026 01:49:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMta83454882
	for <ath11k@lists.infradead.org>; Wed, 1 Jul 2026 01:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQexzviQesYtFmxybT4rIP
	ZDP12EthyB0Le/+SnIPwU=; b=G+g6KUFcUlWkAQ/I++DjgHKVZgFUNQXQE/BBLd
	v0wjRJGispG0jR9DtVplq2F5qzPmoDjlO5FS4YR0O7zdqdK6BpWXLbuVCgLfrKL6
	yc6G8iSw2ajYkYgOGvCTFCj4MCKepzGgD/o2zVCR4oKLw9MASCMO5j4L6ZRVl53Y
	qjb8MwPRgGu5DcnkV+n6jtIwa0z3+MnVt9KUsTO+ejkUnnbi7FTatkwMORXHvvuY
	2ATprD1kPYYVvyNgxKH3Mj7OKz+nqFdLd78tg9boLF5fXR9b2/Ozf4OjLSeMrIM7
	84sY/ahOrIUGA/45luszpekFsvK3mV8R0Wo+i0BISOrayWtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvw9exh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 01 Jul 2026 01:49:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so99664a12.2
        for <ath11k@lists.infradead.org>; Tue, 30 Jun 2026 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870569; x=1783475369; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQexzviQesYtFmxybT4rIPZDP12EthyB0Le/+SnIPwU=;
        b=hPxxItN0jnnnYVeVIZqDXWqzBV1UuF1Hjs5z+gKMUiNVVrlzWTD2Mx5W7mMMkaffG8
         wI1C2fCQdynxzS9lDIhEhGWBtMlMOfqlMQt7QnvKsS36WMEIOZR9uChSjMKDsGcD6QXU
         ZC/BnCxcJmPBoQ+eRkB6Sh5bDFC4ldro+fBTJo2gPm/VFkqGncq7kPnMaTQWk2V3vIbG
         pjHPBxtvY29fEqKETu0KJ+c/6FMZPZBY7/z9QaSafpKAWUiHz8OxxJqfCS/2vONWH9xF
         NAx4nlBm+NaNT4EmiiVLYCGQ/vQeZ3mnWhoyr4f8sENsB4RQU69FpX8+i2i+rwQAboIy
         q+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870569; x=1783475369;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQexzviQesYtFmxybT4rIPZDP12EthyB0Le/+SnIPwU=;
        b=FGoimFffyFyiqEEf9AzB2uBu960CeMFiuhXpH1UnjxmpSGe7H5nvw/mxGVI11MRtlS
         BO00f9NJX+oXN/vA/PXozP1cVzZOOCiJBIEZTkD/l27y1re0DuZ0f4L8CA3kMewL5mWA
         8WZA90ari/nti2B1v13DjsxX+Ux+wZostXGyrEMe3VBUbti6AHsPka94i61Zg6apipny
         mB6dgxsPkn3SmP/V/oskVSBwT2A5w7HRRNT3ftTmqbCYs2Na4LWdq6AufnL/DW1N+Obx
         d6e0jbCNF99/PCasMzmIeK8WI9JJ6Usr2RrQtIMhr8Rflsy6IczXhtgkHP1mNbhODanq
         8J3w==
X-Forwarded-Encrypted: i=1; AHgh+RrZfMESIxH6LuYkTFfWE/DElvXT+Jd8nL4b/pGk2hdxQm572Xntq2H3eK+bE2B1ybBNwQXgw4c=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoz0bENIt05H3IQUjzRt4wOVRfIv76RuVBDEcgRPYaTarZa3+e
	aMlK0XGK0b3+MT81wrhgrvl8FA82WPOewLq8h0MiTB3RQwhp7SbVyDLoW49Jba7mByijo/utwJj
	IJtpW4A4e3IXTVAl3633k79Mk30wZFYIDx7+bcKxd3+XXyduiWsbp8+iMzbCejhZM
X-Gm-Gg: AfdE7ckiquMgQeLi1mTRDQ+YXtSF1aQ/N/S3EXU2vu2UC2F9wxRhEHVClC8gaK5TcGJ
	/1ZHdlCVpj4gBh0C387/k11xgTOeAYeHUzPjNVYlKuP0ZQSAiY2CU+qLZsZDzASRtYwssjM0g8D
	byFf1BBLdG1x8y9fEUR7F8uKrZIOkUmZD7vk3YQqC4HS32x2/Q8QZFxG8EaexUxEhZOYaLwlESE
	jyFY8YaNGaC1r78jNSn1dedH2Y9l3ip38yKsi0x0UON20zBArioWwWNDJXK5+vQAyt8DIC+7Xjc
	MzgYR09vDLihDUsBjsWPDWcTL/2sLh/7+/P8/ZdBNzDeVfBd6nwWd4XruG/hg6pUg8XZGh0D6Ad
	AD7rSUhyywlo2t0kw80yksrSQ3A8oU+EIQTcGoIAcAxKoidr/9vTxpKVyPZA0qJeP
X-Received: by 2002:a05:6a00:aa09:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-847addb217dmr2580814b3a.24.1782870569243;
        Tue, 30 Jun 2026 18:49:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa09:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-847addb217dmr2580798b3a.24.1782870568783;
        Tue, 30 Jun 2026 18:49:28 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff89fe5sm3027326b3a.5.2026.06.30.18.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:49:28 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:49:13 +0800
Subject: [PATCH ath-next] wifi: ath11k: cap out-of-range rx MCS instead of
 leaving bogus rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-ath11k-invalid-he-mcs-v1-1-7d963080c079@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABhyRGoC/4XNQQ6CMBAF0KuQWTuEKbRVV97DuCilSCO0SrHBE
 O5uw8qFxs0kPz//zQLBjNYEOGYLjCbaYL1LgXYZ6E65q0HbpAysYKIQxQHV1BHd0LqoettgZ3D
 QARnnkutWlZJKSNv7aFo7b+4Z0gSdmSe4pKazYfLja3sYaev/2JGQsNaCtJEVp6I++RDyx1P12
 g9Dns4GR/aBkfyFsYSVvGqEFFTva/EFW9f1DdGAazQYAQAA
X-Change-ID: 20260609-ath11k-invalid-he-mcs-25575cfa3713
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: gBdcMcI1ci_nJLSCLSbxyLY0OchZ9d9X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxNyBTYWx0ZWRfX5RFQtD3b9Pdg
 JVJdZjA7ZbCHQDE9iNx6pMbBdV50IIshSOhJ8i189TQrwvBOQgjUkO1bTw61/nr4LyhEN0AezFl
 5ZuH01owVy58rPCEqvi6FQpfmfUhK/0=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44722a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7DreTgk5lnmQ1XNskeAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: gBdcMcI1ci_nJLSCLSbxyLY0OchZ9d9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxNyBTYWx0ZWRfXwGEe/ciGl6Nj
 y9n5AUDVxmBxAlPpLjBhTKoYJQEB0f2cZvC23W+sXB9POOTwK8cZLsCD5nLjKCC4nwdeFBSsL1r
 fDHBNvu0W3IszQ88cKWrj+MfpW3dzY81CRuKDBeb2IkjjD2PA4vbbY+UqMMsS18Impe7f+ckwnp
 TrjNk8T7aLW7jWF8kxYKm1c5KVZydMNjveFAilr0SEJUe5oT+NtXEeIxt3cy1mo3Nz4WBf63pNa
 AuxcvToH3c3TkKbhkpQrq14SL2ufHp5Iic8b+DbondYZivgURAOk57cAAqTJmraH/9Jgw4IsUes
 jKPX0ZUzDhlLj4+uP+Dr+Qo3SMxHRx7RjRt/DXM7ecTea6xeOcepJrDqu07MTo+MURcPrJWJQwq
 wK1zflUf/NmkRs2Pz4lW0ifsJ1mzgguDGKgv1Yl91bPuNK7LZMTXckZcheGwHAG3GXy9ahRKdCp
 Ep6v1kkzram/ooCmlpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_184933_344056_B4E10FF6 
X-CRM114-Status: GOOD (  14.67  )
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

ath11k can receive HT/VHT/HE frames whose reported MCS is above the
maximum that can be expressed in the corresponding mac80211 rate space
(e.g. an HE frame reported with MCS 12, while HE tops out at MCS 11).

The frame itself is valid and decodes correctly, but for such a frame
ath11k_dp_rx_h_rate() leaves rx_status->rate_idx set to the out-of-range
value and never assigns rx_status->encoding, so it stays RX_ENC_LEGACY
from the ath11k_dp_rx_h_ppdu() initialization. Once that frame reaches
mac80211 it trips the rate sanity check and the frame is dropped with a
splat:

  ath11k_pci 0000:03:00.0: Received with invalid mcs in HE mode 12
  WARNING: CPU: 0 PID: 0 at net/mac80211/rx.c:5433 ieee80211_rx_list+0xb0a/0xe90 [mac80211]

Dropping the frame would discard otherwise valid data, so instead cap the
reported MCS to the maximum the rate space can express and deliver the
frame. Set rx_status->encoding before the range check and assign rate_idx
from the capped value, so a frame with an out-of-range MCS no longer
leaves partial or bogus rate metadata behind. Also downgrade the logging
level since they are not treated as invalid frames now. The only loss is
that such a frame is reported as the capped MCS in the rx rate statistics.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9e90d8e3f155..896d30181754 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2334,10 +2334,10 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 	case RX_MSDU_START_PKT_TYPE_11N:
 		rx_status->encoding = RX_ENC_HT;
 		if (rate_mcs > ATH11K_HT_MCS_MAX) {
-			ath11k_warn(ar->ab,
-				    "Received with invalid mcs in HT mode %d\n",
-				     rate_mcs);
-			break;
+			ath11k_dbg(ar->ab, ATH11K_DBG_DP_RX,
+				   "Received HT frame with out-of-range mcs %d, capping to %d\n",
+				   rate_mcs, ATH11K_HT_MCS_MAX);
+			rate_mcs = ATH11K_HT_MCS_MAX;
 		}
 		rx_status->rate_idx = rate_mcs + (8 * (nss - 1));
 		if (sgi)
@@ -2346,13 +2346,13 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AC:
 		rx_status->encoding = RX_ENC_VHT;
-		rx_status->rate_idx = rate_mcs;
 		if (rate_mcs > ATH11K_VHT_MCS_MAX) {
-			ath11k_warn(ar->ab,
-				    "Received with invalid mcs in VHT mode %d\n",
-				     rate_mcs);
-			break;
+			ath11k_dbg(ar->ab, ATH11K_DBG_DP_RX,
+				   "Received VHT frame with out-of-range mcs %d, capping to %d\n",
+				   rate_mcs, ATH11K_VHT_MCS_MAX);
+			rate_mcs = ATH11K_VHT_MCS_MAX;
 		}
+		rx_status->rate_idx = rate_mcs;
 		rx_status->nss = nss;
 		if (sgi)
 			rx_status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
@@ -2362,14 +2362,14 @@ static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 			rx_status->enc_flags |= RX_ENC_FLAG_LDPC;
 		break;
 	case RX_MSDU_START_PKT_TYPE_11AX:
-		rx_status->rate_idx = rate_mcs;
+		rx_status->encoding = RX_ENC_HE;
 		if (rate_mcs > ATH11K_HE_MCS_MAX) {
-			ath11k_warn(ar->ab,
-				    "Received with invalid mcs in HE mode %d\n",
-				    rate_mcs);
-			break;
+			ath11k_dbg(ar->ab, ATH11K_DBG_DP_RX,
+				   "Received HE frame with out-of-range mcs %d, capping to %d\n",
+				   rate_mcs, ATH11K_HE_MCS_MAX);
+			rate_mcs = ATH11K_HE_MCS_MAX;
 		}
-		rx_status->encoding = RX_ENC_HE;
+		rx_status->rate_idx = rate_mcs;
 		rx_status->nss = nss;
 		rx_status->he_gi = ath11k_mac_he_gi_to_nl80211_he_gi(sgi);
 		rx_status->bw = ath11k_mac_bw_to_mac80211_bw(bw);

---
base-commit: df81349fece7e61084feae04f301a5655c710c49
change-id: 20260609-ath11k-invalid-he-mcs-25575cfa3713

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


