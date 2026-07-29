Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FDEC53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=YkjQw8RXshu3u35XiQNog/0WwJ
	GYYNsiimTz/MwxIbxkNSwIHdlWzj0nZ5LcjDydepl1UFKYvZvV9AIz9LcyrkShfBembIOlxbsMgkH
	HOj9BA2X6X7+Ju7OR0o2pp3tBCKw/+fFFt53uDRVkNIPqdlTAU7P6sNmhQhSEoAH6oONJzjR2KMHE
	Bl+/CbQaWH4v0vQiDVnIXgyrBYxDxLMvwjTiM4gLZIe0kq858hLnDK0ffczsPfN0LChJnVJAin7o/
	G7bXzKc+UeTIdHmH59qOWoS8BTKtYYfjxt8A4pBD9B+Sign2gYoi+/r/VIbU5p5z+RM19SUSdfm21
	D8OzcI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6B0-00000008Ov8-1ZEt;
	Wed, 29 Jul 2026 15:26:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Aw-00000008Os7-2VJY
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 15:26:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF33R81962722
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=oBoQKMK9ee9Ob5sR
	zUwfVCqHvn0fjGg5+CtDAbD6MBit2H5Hq/yMhiK9RC0aaOv+GvaTG3ky4d5VQhGs
	NsI4p9Xk9rNC7B30y5lrXU2cwzrMa5I1zd7ZcyEC6ZyLWt1hIeU62m4iXN7AlicZ
	eyju1C4ay2xFMpeF90Fpkq+44CuS6MDOcM07D+onU/mcA1z4+YE2+aFI0Nv4p7Ux
	5GO3NCJrpxJHnzYBZmEn2/QmMTCgefikJdWBv7okHcqI/WdffZ9zZUCNpDCuBL7a
	QM9YupFw6EwsvJ6XTQS5L3O7C18JuLb+Rm9gk1eQETb/KXnFyLy3nMCaNCeYhHzi
	KTPapA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy913eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso14080915ad.3
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338789; x=1785943589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=DZA2cjuATe1aJWZwR7QBJYqjELA6KcspdIh8nqHKZN/V4NVZd7NXex8bYARGPGI0ri
         ULCcDhAGu1u9z2pOsfvgS18u3w9DDh0ol7xldMKGZGycrmnKMkiiMxSl2gypeaqUMLtj
         LouMjhBtPG5CHveXm1fYjXITxH/7Coa3jSOjzWwMgclpUJ7e+Kikbrt+F+E6rqXZFNUO
         OgVTNQSeytzRftLvBn2gzTHYYmz2NpvZ2BP7WtL+rfDX1/EmB2KdC0dKwp+fOcKDuloi
         yZNA+fNtCQ5yj3XdfxKr/TjEGquDZGK5YzfoWg/OarAu9bcxW38Pn76SZgjVr3TN8qjk
         hSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338789; x=1785943589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=GNZx6oBQ1Baczy2SOKhHsKTmOq1hanBbD1dvVaOw8B2iocQBjOUN7LTItkNirIIECy
         YnmmF38eP0iU0wGAyPExOfTparbmOlqKCU0I1FdYy1/i+KXsKaXznCrLIpdo9h/yadAi
         93y8CstlEaYS18CnXmcjoCdppClaXOtu46JmR4Ci/bIGeYKebtxQUhpOGu7U6+AC/p/6
         XFgVYsHLwAPAGkd4kFeJG+K2rRF4a/bfJggabcXOhWJYQST6sw2VNwkuyW9EKxVdztwN
         HAKfM6/9dKiwFRUDRhW99Eqm4Kdnx1DdKc2d/aTJskQuBalTlOUF+K7KtSGxfZeSd/7+
         x0DA==
X-Gm-Message-State: AOJu0Yy8QDzBK+qBfXdDh00VUkOrWy7vKblAKU4RjW1jH6AWO0rz8TVu
	hIp7rI32/GuK4KRh/XY+z2ul6sDAgClFhQrja+l3ScL7x5eLelA/GpMWoPvFmkihxtQfDvzaT/S
	dXWFoGDuz5FK1Ew/hVxm/qAkR2/6qWRN1ecX5xWjEtyypOtxe2l99BeoDgpD/McC6
X-Gm-Gg: AR+sD10qq8UHZiFe2nd7aVmcl7ljp6UJm3z5HgvH/t/l64q2/nrKcC80sc0QpVusng/
	BhC4pbnKbs3MWowhbXhXvbxBucaEezEJmB0Wn3CRVdfwt5hTjGAl04TWuKxWijK5+TM4ovPbtaU
	ycPCvuCFnOpCYvq9cLhmqrP8FAImbYOe/4OmTBaG78nmHoZedrcW2K1EWM3PjDEkZiSVkc1GGct
	WjN76wQejCmM95bt0YRZo30EdE57RDeX+pcrVN5xHTNOlSzegYJ/PEDgPxM3pnKQ/8HJkiWbJ/u
	w0GLDjjx5EuX6UVAObRpaIGEIlnt2GGDW7Vy1xB9BR4Bsnj80uATvNtswDorIXxEAThoRBtUeoc
	CSNIbGOsZjBvyt5Ono9fbMRoY23QMzG6zTT/wN+i+LbccYsFh6lQS4co=
X-Received: by 2002:a17:903:3c6e:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d015c4e34bmr81145155ad.19.1785338789596;
        Wed, 29 Jul 2026 08:26:29 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d015c4e34bmr81144805ad.19.1785338789207;
        Wed, 29 Jul 2026 08:26:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm18005300eec.25.2026.07.29.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:26:25 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mac_phy_caps_parse-stride-mismatch-v1-1-077a1a0c50d8@oss.qualcomm.com>
References: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
In-Reply-To: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX5JxsumKp7Yyd
 rpaBRaLHRNveSVB1kWgf7nndD8WmnGaAJKRIFp8fwiNc9XMg/jFtL5X5PRxmlUbBbihxn0WegZq
 TiKmYo6Tpvzel0fE7oCreGmXPGUXXEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXykfCeMrOEeiR
 h2p55OKLVvD7w0QvEjynKKqi7+37ZyjUKLjt58Ij4zTNZkxfkCeTSIkquVKnP0pGKk+ijjhuwLp
 I9hvbeaOKM0IOg55QKCocvGUWH/SWpQdfUR1yPVg/YJXGDAFYdZ03+vbkywEMhmZnMgJTm0ssqm
 SbxZ5HYL9K/6S0IzsB0Jtgxygp0BzzCZoR59MIwK5yYEtgWkLaKV+LaK4HFMH5nneSoEAWS5jly
 XwYvvqifp+YXxv81fA7EQJR25w+MvNik9FJ3jZniZU6mIuOFllbaHndAR/eJZ7gIf1+NYf5kRKS
 uOaEkWvXNBbTLdlADY7Mm0ZM9M+3Dswi9VCQElh8bSF6V3VLfhlcB9eDcDfeBRebnpSmcjdroyD
 xxBYcADZHlHzVYU4YfA56eiYGxISumW7KRi0QhQec760NF83EFM6UcaDefVERCroCwj1XJhFZZu
 nO9nm8gz+3EJMQ0+Kww==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a1ba6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TQlc2wDWUpY00yvoUuwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cAHSMOw3TdZPWFs0Fvu2s-046qdDSchX
X-Proofpoint-ORIG-GUID: cAHSMOw3TdZPWFs0Fvu2s-046qdDSchX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082630_643113_B1FD51BC 
X-CRM114-Status: GOOD (  13.60  )
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

Currently, in ath12k_wmi_mac_phy_caps_parse(), kzalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct ath12k_wmi_mac_phy_caps_params)). The
subsequent memcpy() destination advances by sizeof(full struct) per slot
via C pointer arithmetic, not by the clamped len. When firmware sends
short TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath12k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 672eae237ac6..d466baf5e90a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4765,14 +4765,16 @@ static int ath12k_wmi_mac_phy_caps_parse(struct ath12k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
-						    GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


