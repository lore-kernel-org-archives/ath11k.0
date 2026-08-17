Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E0C5DF74
	for <ath11k@archiver.kernel.org>; Mon, 17 Aug 2026 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4Omj204/uIeyve9oBEjC2WLK/tG67t/xbLfOcYNJ2I=; b=yRFb0y3GWCwefkDzs+Ywyq6bgL
	VX0Usq7iOKFYvyT9F+SmQfBsxx3miq6vO+L8wWQO9ZWU8rvPJ9lSVngBCfIPuVF53RHlnT26HuIjd
	/fwCbETvdUlQrU0fs53sHmLP5R2yDb6TXHEouNtgY9ecH4cHyoC2cRn6amFAiDktnlz81QC4U//9d
	GAPSr90txoS4dHe8B8GiITN5xrPDnl/jKSKgcMDb+m+Xs8Tt714evlGEHVxEEOC+rxlHYrEH/kk8f
	0uQI5nn/6BZcoDYvFexgKnOHFaZMuOfMovqS1Iqhtjg1TjiEJIKN+hVmKNatzVUisYag0k/YEW/LI
	1rowIrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww72Q-00000006zPH-2vCl;
	Mon, 17 Aug 2026 23:46:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww72N-00000006zOu-0x7c
	for ath11k@lists.infradead.org;
	Mon, 17 Aug 2026 23:46:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkiOP4076574
	for <ath11k@lists.infradead.org>; Mon, 17 Aug 2026 23:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y4Omj204/uIeyve9oBEjC2
	WLK/tG67t/xbLfOcYNJ2I=; b=dDxTvk0N5jty+8WsCM70xQIna6ThVK18KtOfcG
	pkBgDPorOZllPVIJwY5n0txYs9prMfoRUZ98T/tfHSFNr/v/ViAhWmr/M8hqiUuf
	r94hlWvFD3Tkx7z3j3DhMx48HIzbog0wwptDBI2THt3tiDL243nv1nRRDWfocW0a
	oEHx3Y0bDU61IIbhmt887c/p4xSa7jlggbsBCfwbJ6kqzFrhaBjxRYUssh0G66bH
	Q6oigplvCac33h4CSPa5MCnpXovFS7lFrVLexDc7PUTPve85P7+vXRJNAKOhmb1K
	s2X1oWOh40r0yQNCTgOfkiTj1eW3Dbk0F5yd4wlpFOvsxVRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7utry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Aug 2026 23:46:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso6776405a12.2
        for <ath11k@lists.infradead.org>; Mon, 17 Aug 2026 16:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787010397; x=1787615197; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4Omj204/uIeyve9oBEjC2WLK/tG67t/xbLfOcYNJ2I=;
        b=Bo1d82c9hMWPHptTz8YIOovcybEtQrXUjI5rpZHnb8esMUZY/BIWID6gRCDT4b5s19
         O6hz12qB1Nmr0YKIreoLm9dUIjcVPcLdnOFgZuSmYfwPiXOHdtvOWwCm9zjaxlte5Ywk
         EAPCFFFAUC1MQAKa1gEj185FpahD2udKoXnZNjLeizGHwVl2L3Ds03CaWsmGKoGOimuO
         cylLtYt8bCHO935c1W39K9twO/55ouq3sof2keub39UOYpbyi86u6sFVZqA+uqNtvfq1
         ouX+GE/2dQQespgcx7fZchkhOgZoK4ZDnCUs5qNWVIM9Nfil2fbUvCNR5XCFu9gf79yx
         6X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787010397; x=1787615197;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y4Omj204/uIeyve9oBEjC2WLK/tG67t/xbLfOcYNJ2I=;
        b=DwzWi9AS/wOyzXIzbHX3uHXYrM9v0FPBLBw11W4N4LxMqllJXjQ+YivXCqg6d0NOUE
         Dwbou8vJUa+cS6hF4G1pQSkpxHPeyfJ8smE9fi9jWvEM+xzLCorurIXQBYGnZ+d5dPBA
         IKEoFn/fPnjGi1xIkW25v9Z2qtjp/MG21R4KBLYFwY1Lwg4mXAJSIZd4BdQVfFtMZ7T9
         6LNAWXpSCaazC1vnYPwvgzUZIkijjj71A4vX00nBVZ3j0VuEjIE2SrsWG8Z7IA+sFb4F
         9RkRO8mmYiPkTD06aLlWzqd9j1ijUMENqbCzoLux3MRsyKuedAQfRWt1W4WzVQ25bFnB
         kfWQ==
X-Forwarded-Encrypted: i=1; AHgh+RofrtXmuLAAK2Kb/fCJot2LjBWrT3wwtAOuOZF9m98d4+eCfoMs3uIcybxugQiEssSvA/c1wDE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsxGF7f+VqSrUFC7M5fR1550KRBenMlPXRdEkpG9TshRH+bpG9
	U0Ill4mqHJ4BcrSc7p7W+lo7qoP33RCUObjvF5Lm4/utZs6c94R4JiXO9h5HvkLoVjql7dufu8W
	K1EowmEpXgYUT2tVLM8LfHMNpXYbnSTPRcOaRlFieOCcB3j7+y0sDHZ6+Dkxf3Rt6
X-Gm-Gg: AR+sD10aZBb9yNTTtPrkFfB/03V4xN8hz9B0sf30Mjfmo4lmZIyAyIpX+0lKe8kUIsX
	sC3B4b2rO+Cfs6ekXBwwlcyYogUm9tovILu5WgEGAslhCe+lvDuuFydbRrVQApd7Xxwv7NpvI2A
	6jIZbTmJNnCTyitzL1DDIrFWt4RIol/0i1pivJowzfPRqkMBnsXWlRqDMSkVeM1Uo0YJ29VgL9j
	luqwQFJJv3+zBr5mw8q7FZv2VTo9ceJ7ygdq5rC6PqRiLrO5l/x6/iagWrvi03EUWR4l0K3+kEW
	WIWlA1Q9n9FkDH2F67nHzbogYv5EKekdjsONGrUTRgZ3j3iuXPN97aXOJwDp444/Lih5IP+SahL
	sbXUl0r9hHLtLSlKhe0mZuJqVJitmVUoWtaupY0Ny2B0j7EYKSqTlM6Q=
X-Received: by 2002:a05:6a21:3511:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc71a2c74emr37886968637.13.1787010396904;
        Mon, 17 Aug 2026 16:46:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3511:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc71a2c74emr37886894637.13.1787010396474;
        Mon, 17 Aug 2026 16:46:36 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dcedf4sm10043488eec.5.2026.08.17.16.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 16:46:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:46:34 -0700
Subject: [PATCH ath-next] wifi: ath11k: fix reg_info_store leak in
 ath11k_service_ready_ext_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-reg_info_store-leak-v1-1-77025a99b074@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFmdg2oC/32NUQqDMBBEryL73ZUkpaL96j2KSDAbXapJm1ixS
 O7e1AP0Z2B4zJsdIgWmCNdih0ArR/YuF3kqoB+1GwjZ5A5KqErUQmGgoWNnfRcXHwgn0g+U2ta
 yP1OlGwt5+QxkeTusd9DLiI62BdpMRv7NPsfdKg/+17xKlKiEaRpTm4ux6uZjLF9vPfV+nssc0
 KaUvuaKWrvHAAAA
X-Change-ID: 20260802-reg_info_store-leak-1af81c3e6a9f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: FNeFhWRwKFzUzhR-pI_-Uel8313HIOWS
X-Proofpoint-ORIG-GUID: FNeFhWRwKFzUzhR-pI_-Uel8313HIOWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE4MiBTYWx0ZWRfX8lAII7HxJRVx
 9pLlMeheAEOFxMSxv+Egf749JrEctkrOmkVNz1m8eRyLDshXhFs9YRtQAmhZ9UVgb0XYNb59/1O
 a+GBw+I/rLkZwqoMU9SvY+NPjAWYRPq8Qv4GtWJRq5FP7m1vT2nE02oZ9ghYtvMPEYmHztvFQys
 r9oi9bYeYLMqrrO0UKak7zwM1LjTohpj6uVOFMUHKhVcuJ1/XbmF2+hgT8X7+o72iiiE3Yojw0i
 KjCdLOi2Xxo9d3jwfvQ47pwOQfdj1reN/9gt/wTEgSQH6M0/wR1pbOiYY7zmP5M/bEsNbGm1HWh
 fF16pGLcMh+wGeZyn3MYqa9ZVUbDOaD3tvgnOonr53Gu9U6OIHqSQULCIKfbe5HCg41BX6IQKpg
 45jxaD+W1XUSibldQFzJ/7Y97GY+xXkasN+MpN5QEucJilynkiScVGGrCTXOWT5a5h10txwbMQ2
 AZCzXkCqgV5xFl0YmyA==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a839d5d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ioZH6r-_hHwHCcFRKkYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE4MiBTYWx0ZWRfX3+cTwhU+1Cb9
 b1NJWNbi+g4BUnLXbO3M4I62aBCjTsrddOA6cvBj3yyRgF9GYvnae7QscPDXHMCXxWnnPXlkFzI
 0HHZqUydmfpK74Ar6WwusEoMcTuvUI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_164640_151427_9DB13FCF 
X-CRM114-Status: GOOD (  13.47  )
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

Currently, while processing the WMI Service Ready Ext event, the iterator
in ath11k_service_ready_ext_event() can dispatch the HAL Regulatory
Capabilities handler ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse() which can
allocate ab->reg_info_store.

If a subsequent failure occurs during iteration, the ab->reg_info_store
allocation is leaked.

Directly free and clear the pointer on the error path.

Note that the normal cleanup function ath11k_reg_free() cannot be used
since other regulatory-related fields are not yet populated at this point.

Compile tested only.

Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index bbca275a8289..08fd6795ed9e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5136,6 +5136,15 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 err:
 	kfree(svc_rdy_ext.mac_phy_caps);
+
+	/*
+	 * During TLV iteration the WMI_TAG_SOC_HAL_REG_CAPABILITIES
+	 * handler may have allocated ab->reg_info_store, so free it
+	 * on error to avoid a memory leak
+	 */
+	kfree(ab->reg_info_store);
+	ab->reg_info_store = NULL;
+
 	ath11k_wmi_free_dbring_caps(ab);
 	return ret;
 }

---
base-commit: 8150c22bc80caef4ba8391eb98b25e9f7c6cb487
change-id: 20260802-reg_info_store-leak-1af81c3e6a9f


