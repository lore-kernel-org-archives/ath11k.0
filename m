Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41397CCD185
	for <ath11k@archiver.kernel.org>; Fri, 10 Oct 2025 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kh9iEsij45plAaoQh2Xc290ky/7j3jYE95CHbVbG25E=; b=plu+ENjUMcgt21a5WHxpHU+ADa
	WHhx+F56JMEpogBc2BBicefgNkrlU64t+VNIBxMHw92s5EIuK9J8ROwr5wEgpswIpp4H8if9oyqft
	aYdJghfoQQexfIkY1tC2YjkoQgBy4xsX1thPsLFB6y5Kl16kgn45IOndIyzjnpSH5W8mgoBW7V+Af
	ZhgsZYTipmol2FZsDI93PbQwdkh5C5szdf3oxxBniXhj1lyEZkVjvDrREkyO0rGd/tnEHtw/FlcI8
	jUdpKsuQttnChDWnFLmxO10zJ6jwblO0GSCZZQ0D/IGR/Egg5gLTxAWh21AT62GCQai+ydj4DskfQ
	WZhd/yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GGQ-00000008zKL-29x5;
	Fri, 10 Oct 2025 16:46:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GGO-00000008zK0-3ADk
	for ath11k@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=kh9iEsij45plAaoQh2Xc290ky/7j3jYE95CHbVbG25E=; b=Y5bkkmSur4iCGwPdNKQDQTmDRM
	qu9n9TLEy4Ge+zbxtnllSdcQBmYUO3Lu7Uc+WMS2AeESG7+Lf8hDmeF4ReZtsyFl7SjlDEhnhPh9k
	sD/AzItwkG0ZC99VPFkds3L9E1zH2wpbg+y6ak5wdFS3lYfprUFW1Lod3799S0LUGW/QjRs+0IKHK
	gfVcB+2b+YjFNmyqeuAfTazK+XLVOI9Aj+wlVjV04JvwvQH2QXthj8/IhId2isWu9qWnh/qH6wrEy
	h0vA1yWBIgtjEAuHI6tjeU4nygiF5JBnpy8l5HlXx74FRCmFabSAoIYhJhwWo3i/sDmp6RWaboybW
	XAMp9MDQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GGL-00000002Igj-1HVk
	for ath11k@lists.infradead.org;
	Fri, 10 Oct 2025 16:46:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFV5Lv018573
	for <ath11k@lists.infradead.org>; Fri, 10 Oct 2025 16:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kh9iEsij45plAaoQh2Xc29
	0ky/7j3jYE95CHbVbG25E=; b=mNsikZVoe5M/oxcLYiOMu1TlLhRHTRlu9Ae5AW
	Awhg61idruVfkNKBHktD4DK29ggixRwj3heXjEKJJeaRlTyEPhqac/0CITvlmmwt
	4if0YRZWkJMRmtNSBOwGmOWliJMAbSfd+quYndS6XymL53peRvp2AutAZN7v7aIm
	lvWZIUZzoyveuJdnBHSTRQLAOIki7wZCvmZH9JaRWyrE2VjRoxrWXazQ1zf2yq+u
	Bfplw5EOrp7CvC9RWfq5w/iz5OrgmC/lvbz0vv4OUFyGZj28IyUMDzYXJkFL54oY
	1+X+pZ/J3QI2A32X1GAudQO+s6FzKd7ajeCdEC92w0qQ+hng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m74er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 10 Oct 2025 16:46:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28973df6a90so42886045ad.2
        for <ath11k@lists.infradead.org>; Fri, 10 Oct 2025 09:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760114791; x=1760719591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh9iEsij45plAaoQh2Xc290ky/7j3jYE95CHbVbG25E=;
        b=A2CfI2mec5CzJEW0rIxd3fQG95la6hWW/w13uvEokCAA4jHbi8um6KTFnPXBZsCKDJ
         tPsnqJSnlhql7jwcDAwnKj1zbyAQghOUGOaMfqZ0OWCI6xkHtvBCPJ9VjrOphJRksWFV
         OMmyESywEf0whSnXxYrcsEU4+nXgSIPg5umim2Ms7tnsM+stSlELxNz+v1Aatb1rpyls
         CoCUpBBlDhB6daGEoKs+gnsoHvfZ76OmErwvrRVz/H4eLEE751oi1NIiZTtdZc3GdKzp
         GYZh21TM6KOFETTWZhu6eqy0ZVJ9CGBPrSfsy9T5fLFLSQhRVs5jbZNMRsMm5aYg/kEu
         uhSw==
X-Forwarded-Encrypted: i=1; AJvYcCVrvCyRVXMrqxuU57UxLCivv+nq/hAnQ38R94oVrc2SO9zLmhn3URK464iSOiCz+BFHhk/EhpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAuHMUCuQ5zZ61KwPLdlmY6mUHSiD2zR+nb21unlzSqt4vu1Nt
	v6NOyrwzqmF51yGC8S5f3++HW8syRU3bU6WmMhEsJ6CcjS+L7T73x5pX+tSuBup7e1EWZZwp6L+
	VoMenwiePACNUOIgRmT257Av1sWEc7w8bbJhBzhYCns7anJ00Y8yreWW66gPCgnMqOgm7WNiE
X-Gm-Gg: ASbGncvFbekFLLKpg0K5vfHb2SI+3OOvmLNntIHGNxgAIRiGS9svQoKPgBM+7Wef+rg
	SEVDz6cRiiXziRxrqITqFmSWNhP8+tR6uYNThC0lHuQSUR8Wte9xNq+7lR8ka/ZNm6HdDt/1heV
	FUcZwHyEt6UKXEzKr2Qpyay9sdkCLmdZUnIKl70FVUQ1PxTTVSBknGsOq7MWdVzuYxWDXz2atg0
	KFUXM1EZJHxxO3jqTwHPvbwbjaeKtSEQya71hA1oB63bwERPj8DdrrktQKgqYuum4ZxhkxQGxHl
	GXwGEXef8yACwbOcvfb+OPLSGLX7L6NzTv4gAl6fdVvE7I5hrdogfmUSFdrlCM5Nwc9wBRv7UzG
	r
X-Received: by 2002:a17:903:1aa5:b0:269:96db:94f with SMTP id d9443c01a7336-290273ffec4mr164572455ad.49.1760114791462;
        Fri, 10 Oct 2025 09:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsxeyikdMvc9n3cRyalMxLlb1YcFKQRAqMJOZUbfHHv0r/1PIx3oESwUGS4QtjuZ977iaUcQ==
X-Received: by 2002:a17:903:1aa5:b0:269:96db:94f with SMTP id d9443c01a7336-290273ffec4mr164571885ad.49.1760114790829;
        Fri, 10 Oct 2025 09:46:30 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6c07sm61831635ad.1.2025.10.10.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:46:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 09:46:27 -0700
Subject: [PATCH ath-next] wifi: ath11k: Remove struct
 wmi_bcn_send_from_host_cmd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-ath11k-nuke-wmi_bcn_send_from_host_cmd-v1-1-bfb5118d9018@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGI46WgC/52OQQ7CIBREr2JYS8MnthVX3sMYAvQrRAGFWjVN7
 y5h7UY3k0wmeW9mkjE5zGS3mknCyWUXQymwXhFjVTgjdUPphDPeAmOCqtECXGh4XJA+vZPaBJk
 xDPKUopc25lEaP1DFOG5BcBTYkwK7JTy5VxUdSGHQgK+RHMtiXR5jetcHE9T9V9kEFKgApQdoT
 ac2233Mubk/1NVE75sS1TTx/+i80HvdCdSKdUybL/RlWT5wFwSCSwEAAA==
X-Change-ID: 20251009-ath11k-nuke-wmi_bcn_send_from_host_cmd-a02e8192e9e7
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2LBiMRmazy+6
 msgLCPxsnQ/emtX1e+xgSqIDZFTR/LS/7HsF+zytlK+RuL6kX1AVBYyQ8qxf9XN0GG3GifmpIGk
 Gz7AstpVzplZo5/jLbWEQYZSUlk6xpgU0AoozKCNMw3w+tEjzK0Cexzc3IE44iMdqt0V2ZCJvNw
 00TbbGpPxzT1dp2Fp/S46v44bWQbWp9PU7B9+uZa9bwIfRLPle5tZymdvZfjF6cF4wBNGeHuaad
 OSBaNOO9UKqToWVauCAMIfA6mLJ+Z7kWEGbkw7wUIu5WrstpijVnirLl1RIHPGsfvICFzfWrXTf
 6aHR4wNjfXxnFKIjmXUHHxVe5WjM/JYpmgHqtT++110XIy3Gl2li+re99a11PFIqpYvaxIxa1z+
 jqvTcWtJhmtJzDOSU8xZBkF2/shWTg==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e93868 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=IK4e_bFUgs84OYqGAtIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HkXt1toiMeSXNARAfWajcRPNzSlsJBYx
X-Proofpoint-ORIG-GUID: HkXt1toiMeSXNARAfWajcRPNzSlsJBYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_174637_806970_69163B16 
X-CRM114-Status: GOOD (  11.96  )
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

struct wmi_bcn_send_from_host_cmd is unused, so remove it.

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 9fcffaa2f383..3c4885a12855 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_WMI_H
@@ -3463,20 +3463,6 @@ struct scan_cancel_param {
 	u32 pdev_id;
 };
 
-struct  wmi_bcn_send_from_host_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 data_len;
-	union {
-		u32 frag_ptr;
-		u32 frag_ptr_lo;
-	};
-	u32 frame_ctrl;
-	u32 dtim_flag;
-	u32 bcn_antenna;
-	u32 frag_ptr_hi;
-};
-
 #define WMI_CHAN_INFO_MODE		GENMASK(5, 0)
 #define WMI_CHAN_INFO_HT40_PLUS		BIT(6)
 #define WMI_CHAN_INFO_PASSIVE		BIT(7)

---
base-commit: de7674ee69a0023a2dd1c6f0cb66f3cbbba89923
change-id: 20251009-ath11k-nuke-wmi_bcn_send_from_host_cmd-a02e8192e9e7


