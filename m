Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2076C54F52
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=jpSRf0qmPzmbHC4wfH7qPBaFNd
	PU2LbBKmgs5rln2IIX84MUT8OKADuABTPXsKs9yZEag1WYKTZvkrOT099wj5e1JKUFJoslhf3XLuF
	JAgCBnHbQMEExlrMVpj6DPe+E35I1rCkU4Puke7trNwausO176V/87UntGxPeFOnZfeGtO2mEzyff
	MDum+ZiGTd4T4OEcZZPTtKR9Ml4Sus0VQs1RwaE8n61K+BNZk/vfrxEBmJoycpHYAV/axOqvdYlib
	aVm13jjJq3LNudfHBuwSxekjJc6pKUHRFEP7PTVw19JRbBAUbqlwuPT83GbElj4TirEv+BBB3GCuI
	shRHGFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjt-00000006YaG-3Txi;
	Wed, 29 Jul 2026 01:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjp-00000006YY2-2lyi
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL2pID4132131
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=CxEtqH6n9hiyd44x
	EQGqVmBZKFsPX04IOP1SV9UL9cS/ATROLB6TyA1XKjJRB8P9jt95+cKa6oQiSw1s
	uMqHxlNACwVs5STz4UBnE2+bwMI7QGt0Hb4AOC04MvZS2trqlfRyPAlXrjongcjq
	ah9G0tBAccVMgtkTMcP11al+8a8sJ+h5xeeUVmPwdlkrg3H2spTqK3+QveV3DrHK
	n4iCgpQul7tydTvpK6khE7Pgc50U8Fa/WSqb8iRSQdnjbjeWgGZ4BVjHgE92qWHb
	BZL0Uy5mX8VhXMnRhA70jC2LD6M7mVrC6bnjDQPElLa7Hn0TrhGl5qTn1Dnlp08j
	SVXzSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq10c9fe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso258441a12.3
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287136; x=1785891936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=VK7oE+4ggGtjcn05ekdI0d2VZtmVcLcg1dfQ4y1MF5eNRdLig8RGYl0KHA0BA2bZq2
         j3UDag2DargzcUxHIH22dwqVlju0dpQz5XdoCJ0f0oNpsDnFl6ovCZnk+XPLmwbQfgGY
         bGUNXNGGb9bx6et3pcZ7ZldlWcYlSf7+WoVZ3Zx7XQDphLSIsrOrrRo+2ljMzUfPZCpO
         sI7rR1lqO7q3EVhhQJWnZcpSk74dH9l8aOM5TiBcaWOmSJqivJdGDrwTR22yMJJNiBim
         lJZR7ar6z+4HsToXre4GzGWpyfVnMQvEreNO10GaV1+VqNZnR+jZyWnnRCPvRzp7uPKL
         /M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287136; x=1785891936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=nu7YNElRlj1pJadjxpeDulnKbKoE3hiCpPNo8yHb1n5LlE/Udjxzz2e2gTcv96BCNf
         KTXEsJSuNQpeGiYc8Vt69t5nCWygQ0y9clg+IFmFuF3LS5w0NhsSRKUxmmJ6oruP5oaj
         20TRJ3Nf1gY9dt8wSuLR4bymAad8SHYop+Asjsmsk0pcmLI8rrjIc9HsSfRZc2z6pt/M
         1D8f7jgSUFwPlFwSv3hXAFLvZ9smf/IELNB82ju6grkkdsXXEn97jm2E+qi+Z22N+x4r
         +/iDfnNHRVWMI7DfsfL1fcRvlD7C8YxMNiAtJSCXHwZ2qr5nb2a2IM2TRHHGp0e566F3
         2XYg==
X-Gm-Message-State: AOJu0Yyugs7KTWTpiI5WvVJbXdIfgYWsZtpRGLAyfM4+Ob4HDQTP/yp+
	HRO5WwMp3U7Y+rD7QcY/RCC7B+MNN+inM8chGW1C20zv5lkQ3Vt+Vu4P/EoA30QQ0WO1pRbyDCq
	WLPSZdiRCZGnrtILelAccZuwJCNrHe1jEL9bqbUZdauuzw1O1yQzeRGu1IkV4PUhcI4VwPcrA
X-Gm-Gg: AR+sD11rvDNTtwfy2fIrAgdmbBL9ET+Ko1An4ta+WR+pOCEuUmvZbDTUeLW6iIDcVJO
	IuzpQNrRSxlAISsUvuwhQwHAG1NPCi+PJcHotON0j3i8gXCStalNPvuqzfVgi5h1sgi3qhwrjUM
	VSAZ2CdZ8NAyIon4E9CLu0i6+GGpib4kwCuFHLSoSS+uDlyw6SfjkbDEw4tmbVixEYg75ezIJ7l
	xi0RpuT7GVRpxjJxvuW/0RZCRgqePa4s0nsTfSCmoLVyWvVv1uhSGCbRfV4VFPS+b8v2rsfnFGC
	aZzk3GDK2wlXlgRT4r/NsM1d37QuGoPUonul27l3MAAWmm4uiCS8wh32FfURESK/D+uvTcovtrH
	7K99aAPf0OpEwLwwCAcp0q/m87UMLOQsDHGU0WrAoykOulkrXmCz2m60=
X-Received: by 2002:a05:6a21:a85:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c8ba63cf5dmr5963980637.73.1785287135741;
        Tue, 28 Jul 2026 18:05:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:a85:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c8ba63cf5dmr5963939637.73.1785287135320;
        Tue, 28 Jul 2026 18:05:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:05:29 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-2-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: n_NSqXuUhWb4LpqkGxTR4zxGcvRuW1xR
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a6951e0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=y0DE-vWUm0S5MY-z67AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: n_NSqXuUhWb4LpqkGxTR4zxGcvRuW1xR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX+cSmvj3LHd86
 qNj4/1R8ux/xS4ZuSrWygH6TtJBpe2SdgNaSVXvLXzuaap1foV/bIpUt/Buc2P43xwTv68gIVAa
 F5EpewV5nc9mZ64Ll1pTGa1yn6gmarw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXxVu/itWLrc1I
 bi6SRHrq+0kcnif1C1zcQmfA3OFq4K78KjPhApxHTHdYDYZl2CZlA3po+rPfKQQdf3yxTmhGZNU
 +MNnn8lUitqrUvqCx7X//7WUYkZQxBdo8MJxtTI2a+H8kN4tEAF1JDT/7AsTjTKxEG/CWD+9NhS
 pxw+qLnEUZtvMBqORe5VJpgzSDydsB2eO3oUzLRehyVtCqu+A7nQ6IIk/dt7XDGlqrAlWMX/Lsr
 cR3+1C4bxG8SCjPMMSXoRjEfbXXhNe6GvpdB0QDz4tyo6m+FMEVKjP2NxqjcQMzupxGVBaXj8MF
 meOAnlv/TROoJoVY2/geie5Fr63ve1bbi2e14HS6uszK7xXLX/J1vmDspNZwtEBb+VYxJzM2hXp
 ZJjQeQCcbgyc6eEKDIAjsB8gZp6+j0dhHUDJe+rph2OLq3roj0EVKnxAY/kdAOFLsAkMTY2XWa9
 cxtRoG5jpqKCYAH4j0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180537_830484_2C0A74A6 
X-CRM114-Status: GOOD (  13.37  )
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

Currently, in ath11k_wmi_tlv_mac_phy_caps_parse(), kcalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct wmi_mac_phy_capabilities)). The subsequent
memcpy() destination advances by sizeof(full struct) per slot via C
pointer arithmetic, not by the clamped len. When firmware sends short
TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath11k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Compile tested only.

Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2d2c6d7a4a3b..f80e9b4a8a39 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4800,14 +4800,16 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kcalloc(svc_rdy_ext->tot_phy_id,
-						    len, GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


