Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A937EC53219
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=W8DNUPDffV0v9XQN7lyo0oLUCb
	DYB+pBA91dy2Pi7c609skkSgZWK8SJ0EQxAVvG5CMh9ukzCy37Vkx+Fn+e9AyhPG7Am8N/4dB3JLr
	n97HGxOfDx920OJCKUx9+OCcO/9X1z9YjDXsQLcRfa86uOkMJjvIV+oMve/BICE5RKVUQjjg2He3D
	eAGeAOi5EJ/VU3ouTGGHOpsUXqM5imHdRUnFRSjzZy4ex0b9k6Pxx+aW16lS1Kgoh7rAzvpNvj6mD
	Tmf8IFcIuO0E/ZDaeR54CHOI30Gwdlq3kq5ApesV2EpzXf/fezhLLAXjT3qd1vFl/r2ObZYmBKodw
	G9xTPP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjt-00000006YaC-2y9i;
	Wed, 29 Jul 2026 01:05:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjo-00000006YXF-2yMc
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL3Jud3725280
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=MoYixZJcNOUlMLG0
	qidxHT/azZIonZAFdAIexGA63m/Q7sNbsnT8fSexQCkWhthLONVU8GBfYI+6oy22
	G8mCHaRqw/7xczbSSbrb6l64nMjdIaD6Ztb5XF1txSsaGH7fIa7zc5OPHrHFSNoV
	2xALjOkJ7Grj1lALSEA7jSUsIe0KQ+rsBT4LPUPf/66FLGn1YgrKFNVQBMPX/o3Z
	1NzwrHBnB2LIsAELcrnPxRAChLl62lljCdK26BK5DIzh/CXsrf9hP8Z5GsHpqn+K
	FS0I895Gp8Dy8N6xOv/Q3jL8qGQPmjVq1XYPFrs+0fpCh3NhuzNq3q/ieRSG7u9p
	B199XQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3k9v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so8630105ad.3
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287135; x=1785891935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=J6nFfYH3lvs57+q8vMVUOqfGBMeqKtarqkgJpKNxMRne+CAGtvdEZU5A/Egx7ZDriI
         50KjeLinuh66K5zVfecNutj03MgtGLKB87MhTQeV0vQ57kP9RVBRXvLOvf8aCfLMkT/P
         09SPo01LS1GbTc553Qg17cjBCVNLsYMZ8NddhwZ+G3ZSep80pGxf3yOsKeHglQWdKrFM
         vBLrPo9fhjezO2UrLLHsvhHm02UZ24Mq/TWZoL9zF3nW19qRGq66nKzPsjZdcyhc7oue
         Az/WTcxeXE/YzWnOT9GyJtXwpm6HwpCQ/GldYJhiiye0DCIy+q6cBMJza1vM92tHvFxU
         9TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287135; x=1785891935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=q6/ML8ewhrYp9iwcajwNUiRRNUXZQ1GJcRUwypm/wQEsMYU6tSlBfG6SAZYXbTDoit
         jIXXApBJzkHGCr2clUvPb5QeGYuu1ki48wFf3XBd+UHSB2N96EwswQ+K1roNBbp8penI
         Do1ZdGaGHhLYb4dAEAjoZiYlxlGLyzQknU4/ZePjp1VBxFXOckEinjQQquTDuDIS/soa
         zRpqsPzjgmivK2VPjhQuoDBiZ1ukA6eziRF76ozewHqhH/BYYkpzpK/oe8UNDFWyb2M9
         hBNGKK9qDwDgOqoNJVr1b5ujnoEb8jGsLbD+tGHo5AJo9A+SXLUWXgFGGCOWFRNkcMrc
         dMvQ==
X-Gm-Message-State: AOJu0YyfI9NIT2zujHBRcc1Pqrev8Mcg/b4tpCnlmvV5b1RKI5htCM43
	EKXNSK3FbCoXWqIu1nFeis9D5qCtbG66GEppNr13AvX4gmLVQTXW9WxRaEhHSLh7/nRH6Wot5Dy
	blt6SduZVxXslUk1267wtHz19sBQNebc4vCGUV9/BCh9Fe3OTsitYBlqJezhvZeBpHVmTXkUD
X-Gm-Gg: AR+sD121TjehnJ027Zg6AWHuPes3hdYAMowzf5+DibAIyiIUraOawTLROl91ByDmlIh
	4y55AVo6vq1/nKOjdWOdN7x9Yu7BlKdKeF5UaBEC8qiDJVjfC+LdUGhlPFcwOG2Q9TyKRyKhWY8
	33wIQEp8UzBzJi9HdRsKH2c0Y8vMt61uMMznHIH8zu2Eo01iUdJnljGBeVdxG5vAjH/Wz8DvBjY
	eoMhPggXZBzeMdxxDEBPaNe0LHNRb6QqoL4SoHVKbikw4XyUXeA7EJ3sYwEOwygxHZBPQJQF8Zh
	jHxWGyfX4z93lfQDMtcXcQFuIBoTfegpDstHmJFTCMI4iy2bozKUlQa2slebbTOkvbcYsR+fL/F
	aKlOSEDUVAmievtPjm2NRBm7OR9dbml8M5mugCMOwzkpRX4yKrJvnJus=
X-Received: by 2002:a17:903:1a0e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d015c12a10mr59129575ad.13.1785287133936;
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
X-Received: by 2002:a17:903:1a0e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d015c12a10mr59129255ad.13.1785287133453;
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:05:28 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-1-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX7cxwvdQorXhE
 FnAYlVUW7zQLwqjiO6LCNS0M0oWqcF7gUOTOgQpFtFStCdeyKOjJaqkwCihgR6DBRXrJG+qsUYq
 GViXIu/17hhKEdsrgsz6wM95uNXWoBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX0a4PHYT+UDIw
 QQDW1Ko9OotjmGQKfdnSwllYWgz8jOKMUsUmvPqfldQvgpBr6s4fbM9dwso3Fxl4sS62+vQL0aN
 Ohc+AgqOIsl+vM57+Dc4mRRuXizVTmZxsqvMGwa+7MImTJ+Itc7R1mCkFkRf5mSb6S3IyQkb3gr
 DG8gGmjdX5jvX0MJmHvXIFZqg/qoD5NX8hQYZVjYpc0B4Z/zQNSqzYVK046Mb2uqjixPEAMuZFn
 W4H/MPY8B4BodFmSPXmpKQuFyMDumVVKbawOgEGK+YxKy6BBtLyiVywmMfFs4r4s26WnysQADwG
 gKJEKsI5cazYkDmPW2+L+RYooAZkUVZ6GO0Qz20/cbym10YyuFxRexl8bNmGGwKoYV0XvObh87z
 Cod2C7dKfqGixM35zYJwHo6nyIdD3RLVphqM4boHWJP9ex4JW0XOh7DLedFr6YGwQ2nNiyT/9if
 U0q55WTCzARt9+Rkf9A==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a6951df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TQlc2wDWUpY00yvoUuwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PoFB68ghEWxLMUjVowZE8YkJMY4flIuZ
X-Proofpoint-GUID: PoFB68ghEWxLMUjVowZE8YkJMY4flIuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180536_788068_D0140D51 
X-CRM114-Status: GOOD (  13.84  )
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


