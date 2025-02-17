Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C503BC021A0
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=; b=nRbtiuTem/zBmHEsQZTCpCR5U3
	HlB9qTjxQtORdiZUxQv2xRXUYo/pzh+2iLMWi0YjvLwUgjSWuYBslAun4V7JDj4qLOlxiB+5dFKBO
	J1Yp7vjYwr1b/AIH8zvZdp4vDsy9E6lZ8pZs1jXBtTmyVK7D1usRopVz6bN8lsWS9f7Pz6TgItCJV
	KZVOAvt0EZ/RpWkaaFDOG+r3TY/Py6NZuE9DEMD8kJVmi/u/UutpkaLSzW5dudB2nBk1oCtc2+eaU
	9wwKp6t7FT5t1K+HQnQd8NAET/BTbd+eF0stW3nUeePBq2M5gUVhQlmdh1q/+c8c8oqsNWvdw5czB
	NUv+wo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiD-00000003Uhr-2I63;
	Mon, 17 Feb 2025 06:34:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiC-00000003UgO-02QW
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03Rx3000302
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=; b=lpgZ3EW0mpxwv0E+
	gOQua5pAEUvV8uXKt1DFU5yZi9T70izQxPhRTgxYwuaykNzHK7K+x9p+kp6RGPG6
	vGAH78mWGghvsA37SywtIrcO9orkbPba3eY/r+lkUeOI3bt4ha+6lewAp5FoT9+w
	mIg8ZK3Xoz+3cKR58j8ELCl81IHXBbC6tnbi9TV8rle4eUdH6R4gkwzAfcKWKV4R
	hX96s/lVoNo/uAGaeH4QzeTAU3UpqlEr9RuHuamen/XcSwNrVXmLgqhmoBxgKjQf
	wVY8Zfr3X/HamYup4fC/pDhTYeiPOE+mxhoVoTxjJY4vIiqCFXru98FFpwaD96iu
	v0pr/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7wrpxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so7473476a91.0
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774074; x=1740378874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=;
        b=ZbdihBOYEOFTIMtFLNpI/dRW1Rk0Rc09KwpdqnKaXbMe7RwXL7AP5eer7xb6P4FTzH
         b6jQvnDi4jGL2HjX+eAcyQATJhNuo3BjeM8dm4woBGkf2/QgMh2uHcVNB/HG99+lVq8S
         HNzrR4m1yoEYNVa/O8NO0rV6MyVmls9Q+YMn5i/Dtx13IdM622CpWKqNqbHq9G3LVpUo
         6+Iavraacu2LxFOu9zr6fx58jkys5NQF1HrbO1yu2+vHeRnEbj+U5UHhaS4nS1KX/ZXp
         2pBHlmDzAVSPjbxfvyR2fhOr+rlzM4tEQjFGg30LGTDMRdLc3WZ1pisaBEUjFVZW1aDO
         zQWA==
X-Forwarded-Encrypted: i=1; AJvYcCU/V/mPDjmXUPqTlQdDzQfbOfg5RtswQBdDMzcsHs1R5TYwR6evMbcgIZC7HKBUSpuQpT74u7w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhJYQHMwFb8jLc1pkpqaX4eZdiwah3pr/XOrBmMYpwsHkgs/W+
	PcqoRKpob3CQtGIjjWV+WjhrPL4hyT+BpB0tOlL3tB77hKHnypB9MvPqFOH64nDFtSt5D3lzvAc
	Z4T0lktiWGbIi9K3YYaw3kp+YJYLuDjpENzxJ4AJaQoiONqEOflNfp9GlcmNk
X-Gm-Gg: ASbGncu04AVeMYAILWFOc4P26jxaqAYpkb2oYBl5ZmItXbeio2K+leU6Wtiq3YrqYiz
	kGX0MJDM2MYWzkZHobLx4gCxWNQPipZIsO+qlBfzRE1qapWPCfd3ZDkaGLJPLnr4olV7bbXhqjy
	XfqipK3IHKY79MZpIrz+JGcfbalWSei/1NNy5khfZH+y+Ry3N40YKP7ZU6UPS/0x1aqWgJCrT8o
	TlOAAb7y6o6YB2zyDVQZMIXqwoPlu4XFUaO1c7uKg4SWVJMmh3fmiwDZ1BnQxd+QYQAKKHMAK0g
	0OJhGUFo4y7OH/w/vFdhbXRokxihS1oxQwY+l5jY
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974777b3a.16.1739774073597;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHafDTAFp1GvU3CHv9ZBptsIxiiNWeH9I/2oU2Kp5bCj1qR25DKxmHgRfZiANV5piuH5zfVkA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974721b3a.16.1739774073159;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:10 +0530
Subject: [PATCH 3/8] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-3-9bad1e42bdb1@oss.qualcomm.com>
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
In-Reply-To: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=2235;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PmKuDjh7TYnL36BsL4uFK3e2cvQCdB+O1CmCQrAD7C4=;
 b=klwj+7NCfeWvDoVYvXPeVg69yujP2GAfYPvAEuiF+KnPezPhilQ8VrheQA2mmkJNa+z/rwiGr
 7Ap/JoRXXsNBio5kxhs4s02TShlZdF+K/JhEklaBhvKYW0tWNirUE6I
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ixmFQ660x0FlPjcK1PC8uMr-kcrAbWJ0
X-Proofpoint-ORIG-GUID: ixmFQ660x0FlPjcK1PC8uMr-kcrAbWJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223436_167062_90083064 
X-CRM114-Status: GOOD (  14.02  )
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

Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
Add support for DWC glue drivers to register for these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..4da4df62c3f8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	int ret = 0;
+
+	if (pp->ops->pre_scale_bus_bw)
+		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
+
+	return ret;
+}
+
+static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+
+	if (pp->ops->pre_scale_bus_bw)
+		pp->ops->post_scale_bus_bw(pp, current_speed);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
+	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..16e02646a8b4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -354,6 +354,8 @@ struct dw_pcie_host_ops {
 	void (*post_init)(struct dw_pcie_rp *pp);
 	int (*msi_init)(struct dw_pcie_rp *pp);
 	void (*pme_turn_off)(struct dw_pcie_rp *pp);
+	int (*pre_scale_bus_bw)(struct dw_pcie_rp *pp, int target_speed);
+	void (*post_scale_bus_bw)(struct dw_pcie_rp *pp, int current_speed);
 };
 
 struct dw_pcie_rp {

-- 
2.34.1


