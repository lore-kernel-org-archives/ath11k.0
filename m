Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26EEC54795
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdf7PFBmZ+dWTupOwPp2L2RRFGZXAccr7B/5Kw7lJr4=; b=hCBK4lWfmgprTbr5ea2a77v601
	xYrDgv77M+3PAxngr8eejWof/dl7o6GDgU/g0C1LPXuqxSNF/wvctHtf2Zy7ip/w3YYzYrLsB/fq1
	tZgh2TAt62CAy5nYEqCH5FgFV7YAbOpJvTXc6NzGC9OLmUHK7P28CICBUkV6YPwDKVRvNzOT2QVj2
	L7espiB+69RtSF/ZamReLwRYD/UKuB7KcBNUqCrpIsBLu7ff6mamV6G7I+dYH+3tamMpg5BMveW3E
	D9DuMerQXwQe1/7UAK67siuo8kv7bPvmL5XOIbpaMwvGUWHAldOs8l6jiZJsaPFbnEZ2De+Uq0SIE
	i7L3Dxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEW-00000008gzI-02S8;
	Mon, 19 May 2025 09:56:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx2A-00000008d4y-0IuT
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:43:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9HDOH003280
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdf7PFBmZ+dWTupOwPp2L2RRFGZXAccr7B/5Kw7lJr4=; b=NT+X5ju3qOKvzfHe
	xc5ntELMAsH2oxInT4ogGF8raCjNMz+8pSHBkmWC7inueP4yKG40TmtQpMEoxBxZ
	Oj3K6ZDzdek8HDAP4rTU2xpSbjJB9kHw3jb9NyV9jp25oMDkQp4nSVMEPo7bYXr/
	YA9MNSXVqfdsUZuSJLj57rDsD9XWuGegv0GeY+4ppbGcShh1WrF+na4/dmRq/Hjq
	IL6/UsqwvDSzt62q0jcKEg9tv4ji86zVbAHP/nCoINLm8NSlxhOR1r9rIGAa6G9z
	7dknjoM8VhmGRlu7SmX02PS3VgB/TZTgcevLW+xDbSujeAaw4eZuV84rmIJG06Lj
	CfvzFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkykyhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742aa6581caso2389061b3a.3
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647810; x=1748252610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdf7PFBmZ+dWTupOwPp2L2RRFGZXAccr7B/5Kw7lJr4=;
        b=oPhHFDw/s4sRVtQILbGGtsdkmkMO3Y+4edVqm7xaMaAMMA3Si1JRGQVgNJh296VqCW
         M8+iCGwyBs0iS/HMrek+T60KCusRU39t8FJivRo1/c7ceVsuomiCe/GO6MMhuw6x8lIF
         wa9h85xnXrhd8COn5g2hsNbeaDsVkzlep8BwXxUgAEIUwz3R7bXS8DGEVJnTNhHxqNLH
         a5jNhzCVt3QaQXltVIC3EB6Wwut3+86w2E7305B+wAr5E72jsQ5xo9eWnSw2u6fpakde
         uox4EdCSeODOAPIvU8nyf7C4s8HLrt5MvyqOVJldZg7suWFAmLOXPOEFXEs6bh8nSVxr
         a9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXHzubzXoWc4PRv3I4P5/RQRmZB3qrqBcBUhbXN45sZlu+xfEc8aFetnCty51isfupeBebUN2o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEMMBzB1at5mbAcXFUZ/TQroUC5Z776e4bHI4VrAZoOiOwAh3J
	yNsUdfS+cHxJ/UNhueILXUbgxMMTpvGqhQQCfEhSKIK0K9wNomNwB9BiiKKQ664e/qnrhnQltG+
	G+qmQq3THjUb8WqxOpeOONaJVfnua1B7YY2q89JcFusgsIzrb6I9T1Lq3P06pWCVO
X-Gm-Gg: ASbGncsY7YesTVPzrbUb7IOSjQ6R75o0GkAE+2MWUA4HX0C77qM/ejrizBHI/+z3N/c
	azazHopX//jLV2wJR6k6MwbtuNJoXTmiGglc9klo2GL7uyaN3FTHvX/cI92DT5kbsC+6eS7U+Bg
	r/AnM0A76dC6aOrTQ/LG43ADtT4xD7VIcEauXV/MX2IqRCxGXaIyzZoq+IEpKu/9mYnsYMhDWCO
	XaM9OalSZ4KgVHMijjwc3trYQfT0UZPTHSdpzhuYcsfKEf/1mxDWssvJtVKWhRtVZodU8f96DgW
	r50ck+q6/eBdqjs3kSMhRMmwUZfjf41/n7sG52ZjeJsewqY=
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr15013597b3a.19.1747647809997;
        Mon, 19 May 2025 02:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBiZoJIttAqGh73o7b+oxSz8Gg3VOIHkxWf1cUJrHMPT58Y/cYk/xydm04u9gJFvMbMdWJzw==
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr15013579b3a.19.1747647809549;
        Mon, 19 May 2025 02:43:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:23 +0530
Subject: [PATCH v3 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-10-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1624;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ciggJN5AEA2xtLRmbdfXbsqmVBeTQ+3RUbZugVrrsac=;
 b=9tbNb0ShTaqF9yKpDzZgn5+IkqxjlBzSFrrncqIPIUBywJht4BGIpIewbdNC9EZoJ5T+rqib5
 hi5eVz2dqkxA/eMOSAv3OvErH80iQTydRIqFwBY3czPX7odtNQdyhO4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ySrhiEB2OlvnBpfhf13xie-nKVuriROg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MiBTYWx0ZWRfX1V/bYb5psh+m
 53FMC0Lw0DtUHrqD2q8/jI3Yj/n8qm5YF+XOafE9suoNSySE1tNRn+QYJrzRvbml6mS3nmAZSsr
 QJ4Ylri8RGkoJfAmyLHB6QiY2FN/2FGnq4iXEP0GCUe+p0fuqcJSZ9jxdj6J0OKukg8op2LQLTg
 LfxGWr9rGD4+spDHRHGh0Q7h3s7wpXcUxtMyGJVi8HOXj6ApRvNOPAsaLFH/XYgSqrcSfclF8Ct
 2Zs6zpV7YWq4UCNjdeq8vN8wbxnVeaKfTPZpOg8Qc506ZE40zdoPuYW/CeaKfMD4Z+wRdcxanef
 hZXOTPlrg/GdQwxmd7rRUFOrALPUEU8b0f+8gsWwW0DUYkOkkAsqgpdKK+bFqTXOO7bdXI3KiNa
 FPzERJYOq2ayLSE03lASX/7pOpWlgtnd7PinEGTDXbOo7cScIYdS4M3sp1IauCkBEyz+jHRH
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682afd51 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ySrhiEB2OlvnBpfhf13xie-nKVuriROg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024346_118956_69022B84 
X-CRM114-Status: GOOD (  12.62  )
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

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 12 ++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e77d5b53c0cec9c7cdd043ac44329d1b285cae83..363565fd71bc184bb07e4f21e9009ce382e6075b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6035,6 +6035,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert lnkctl2 speed to pci_bus_speed
+ * @speed: LNKCAP2 SLS value
+ *
+ * Return: pci_bus_speed
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ce9d0812a61c2337ba533ef246393a0101e617ee..48c3f5b1f6f86b652355fc9edbcf834d64fddd11 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1655,6 +1655,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


