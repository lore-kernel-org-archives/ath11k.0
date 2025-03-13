Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C4BC282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6csxGEooemVwhVCZXPAno/xD7GGqltefCOv7rH6G52E=; b=Flr9rPndLKqD3cPi1f7OSGPFVN
	SxRGwYvf5rUvGA7nT/T79Aywjn9H+zNQGvzrzeQkrzCzs4RA99E7QXZ7DdpcLzB/+FlDuzWnVulwU
	rN5Ux1CxgsSMJf9PamKPKMPoEhv7PbU+05nbhdP8ioGG3oKI0RIoMEp/7PMUscxeGDUV2vO3giySd
	qGfpbBFRHfTvXo0imgcfKiXlpNnkRPCCOzI7MBBCma0gOUCQP1USRiQYM1QWQJ1R5fMoPEibdbhQl
	hiWTdlVqJo1CkaeckMg5CuegdJVBnM8FH5W4w5+8jdCriqiZO7VbNK2Y4/SssapSR/CHZJUCxAPQw
	ZnCLiM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2P-0000000B6NX-2PqD;
	Thu, 13 Mar 2025 11:47:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgwV-0000000B4gu-1mBj
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9A5Q5018566
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6csxGEooemVwhVCZXPAno/xD7GGqltefCOv7rH6G52E=; b=EVEq33vx9yuK88OJ
	7jNNxLMvNyDzkk86pb2QlSDH9SQcw8BWIchhNFiWLi/cZbGdwPHC3U0+T11I4FeS
	D0732izuKp3qV41qcrmhIkuP2jGrxpSSdqA8C0w4pV3cdELSeJ+b3tsFuE38fHzy
	skY0zVfKNn/YjaWg9+5Hb3W0dWinwf4MfinLPONKJsC/WZw6RCxIPA5Xc5JJbX2s
	iD4n51F4INZhPgBdkeXEgVOVsiIWnnTlFrV/WPn1ag6ZTRDXyxhU/YgzlX5ZK13B
	otFrH9JgdfJBq7z4Ug7+JIMsog/Lq2w18j1OusVIDTDeQ0yIIEGllen3YUvO3hzL
	YJBbJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwr72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff69646218so2503589a91.3
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866097; x=1742470897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6csxGEooemVwhVCZXPAno/xD7GGqltefCOv7rH6G52E=;
        b=do77gcnSWjiXM7EDqevqkwDaQvWycqVytX70njr4BdrvNJ5XLxEzRjr8xAbnZL+oKm
         ItcVhSDRWb73wzCOCDbiN7+ZtSaGf7SyEVfB5zeGmeAtrOlEIU5rdT/1gEFdVdCyXCc5
         sxRy4+Bmtnqf9+njLHRJb+CCZDaOwxO7+DY/8B9/bEFSv5kquSLOx3ZtZHNOnaXyAAZR
         CYBdt8E3JpRpvl9LtDhoyRc2itjugRl6lsUqIKmmjcEoWTT62ZIFt7P0ox7G7QOf+QC7
         pH4sSF1itGeNkAI+XPBL7foPXkEisnW45ssZCitQx9I5PGbT2tDrvy3pF9RDvAN1NPbQ
         JLag==
X-Forwarded-Encrypted: i=1; AJvYcCU5C559H7X2jhiqeg110QswiXmG8kocwOUbW5E3jyQHH6IXRfzHUj+IksXLrR+8QRyHtYI99gw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCLH7m9Va5KVSlpXJl0nvUzX9lEDTMwM/LheMGoudpvTqrB+gb
	fGYK/xJ1dg4XNMKItW0i4n8q6047wWDhpT8crgXwTDYjabxSYFEFV2iDhc7VFp0M960JURHoVYc
	mIZ1LDYBP39Cxs9Cmcs1a7SDaUzr2v3Zr+90nDjujqQLyxNCTaE1lOTg/3GED
X-Gm-Gg: ASbGnctLxI3+Jgdn+/hbaiyG5mamF5oWaWrnPsucI72OTxxbZOwVFQR9OUxBrV9o/tL
	FIFqHoQShYcWpNr7BlAy4bswz6Tt0otQVqLGLY38WBc/Jc+xNUHQwsUri85m23Er3AAVgn2kAKa
	z9bWTPXoDhlOGhfcAk/A+vJWZc2xp2L1zqwpZu16TobYja03AXvud8U/C4EE7jLD50wPK1WMDWE
	69E6dh9w2lcd7RX+9EC2sc/1KFNUoiyh5W5EZRV9N7l4JiU3x7KlFTdR7/NMfrZ4hGqxPbUxzPn
	e2z+dTNfq/fFeE3tYR7O9g0EeYE7OIfRVTVtwLwBda6tHJndTYE=
X-Received: by 2002:a05:6a21:516:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-1f5709de3e1mr24106485637.42.1741866097055;
        Thu, 13 Mar 2025 04:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO+VZsMHm3zLtB84wJpH9RObZO6+qVAnGGVqwEYlnPvnXu3mMtC1TTdcKCjIwnGlhmgp426g==
X-Received: by 2002:a05:6a21:516:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-1f5709de3e1mr24106444637.42.1741866096735;
        Thu, 13 Mar 2025 04:41:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:16 +0530
Subject: [PATCH v2 09/10] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-9-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
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
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=1512;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8h6iYqT9QgxKQ7chsjPReDkmLMBOz+R1kQyF7lNPqNQ=;
 b=gNFMqlJS4PqDCxPL2OtSQ6eC/PtryQoUwiUm6/NuGn6xNnLkYCte4RpeEygA+SWaLg737Q1XU
 MERgI9pKC7DArMKbUXJJttHUPva7o7L2vUckaXu6sD9dwPouLJ3V5cj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: X-7ygllUd5HjeweCYyOoVOIcWS72G9lZ
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2c472 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: X-7ygllUd5HjeweCYyOoVOIcWS72G9lZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044139_584916_10BEBA9E 
X-CRM114-Status: GOOD (  11.68  )
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
index 869d204a70a3..75505437a9c9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6011,6 +6011,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - converts lnkctl2 speed to pci_bus_speed
+ * @speed: LNKCAP2 SLS value
+ *
+ * Returns pci_bus_speed
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
index 9ae199c1e698..b84473f228c8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1653,6 +1653,7 @@ unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 void pci_setup_bridge(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


