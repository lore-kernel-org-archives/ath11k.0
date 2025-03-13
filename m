Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6B1C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GoHPsMjXm5WsDmWxnM0h27fytbmRrNNVtygHs2kjM4=; b=mzV+5LfdLQf6HJanhndTYGcsTf
	tOmyQxrXBezgVIwtTKf74X3LvBfcaAwLiian3wrdLCr0qDvlAvB/wI5INtSSbOAJ6KzSvrtr2B+DU
	9DDMUdlX58LxJc6MrbL0ubUFOi+MWtY6t0mO9fGYSFdde3Us6sG6PEW/Ty6I0A0wBljKqn8lVtZRU
	ckIZLfWH2OnH/yYYYu3hfeAM27drc8a6DfRdGE+kqiIDWceLYYaUU2w1mX+rcYt2eX/tA+MduGN1H
	saGNMd3d5rj7EBCgVK4LEVS1EpHXhlKs6ha0teGg24yiQJDnbWhXjCtHmbwCud73PtgtugmjQfgpd
	pMRf0IMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2L-0000000B6Iq-1FXH;
	Thu, 13 Mar 2025 11:47:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvq-0000000B4T0-41fC
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9leSr018481
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GoHPsMjXm5WsDmWxnM0h27fytbmRrNNVtygHs2kjM4=; b=D7zcjwyd3nxjbkyD
	L8F5kMF6t5s4kPxVP+XefOlrFWqJVP91MKFJkhPTbX8xBSM9TXE4CQcrUe9tZ7Oo
	ombXmms9Y5wIkIlEJTa9nKMR+WUcPZIFm4Ajv5dDlRZ6w2fzz7wZkjDDlU3q8R1Y
	NsUTNAH0Q8vto8cgamYPDPfFXVpq6q9l/MNtGjQBzh/u1dHG2YpfKUdgxvdWjTvz
	Ytfwan9UYXjHB4JjLU6+EqFPO9NXNZzRU/hHnixiT4C650QHefjl9TPB/EqT3I4b
	DkQYbsuk/rvjAhYT+nFHm3711xSSonYRh9q8rswo66NgpvenpaqXV+1EiRCQJW4U
	z/r+cA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwr59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:40:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so1663580a91.0
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866057; x=1742470857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GoHPsMjXm5WsDmWxnM0h27fytbmRrNNVtygHs2kjM4=;
        b=eJsmvvBwNgdZopjyyRq5jFdut7sCihDhYd1ahTXy+7apBF30Hjz2vxkNSyU5Y1D5v1
         2IjNxCQDK77OdhMZ4RlC8TL9/++sHjSzfqgtZaJSRvmth1KoOQRxv8tTda3kOCgJg3fr
         bIUsK0oHlO9jzsROrsdNpZGqSdc9CMQo3x24afyYvIIPXsGxXWgF38J6u17OPlyjzq4D
         r5Jowptf8yZHqzvk7qysgybbbalCjtTWliVHN/resqWBVUc/tqlXjtO1cbT2ATro2fvY
         E2werrXruhsQm9zeykg/JKLK6aVTuxnU89KzWciV35Km4sZjw8PgrxDN4KbjvH6B1dx8
         APoA==
X-Forwarded-Encrypted: i=1; AJvYcCXxeqASo8ofKKdekukKCHaOWZ6WoNevCTuKTezLi5WU4ZAa1E3CWzanfPJs8QoCyr4h76Ov2Fc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4IRephfc1MbU9XnfBOVdClqtC21HC6AQlcCINtQf9xGzV43tb
	oLn5hpsDoQj2nGES859y9bQpWTUp56Qr0cusDwQeBsBKtDs3WhGobh/CLRF3fJV0w7wj+vKGqcQ
	26xjV3Q+lD2BDpBhTPi9yALsy5OoMZ3GYw1v0jSurAOp0nHsuD7dKKtrIbfxg
X-Gm-Gg: ASbGncvKnujmKgBYx3FPy8uPjMq4hXKnbhABMFKACN1dKZJUH25JTPahnQHFBzmimyx
	0C6ViL9Qc0tBOKCHRp63G+e+sRwCyliGDf1ZiqWabNDTrz8uFLlBO0h4Q8TohkWuzjdOK75g7Pa
	MIb8soWurLIVCfXOyuiL2crE39KAQex5Ubwm5PzzymGjOccY+ED2+uppyb2R+jue0q19Mbf7wv0
	lYNvUCcEtgutJAlCkKchA30E5XMnITOUJPd9KUVH0wMFbH7R/vK/toNqT+Sf/DY8ubEuf25kSu7
	eXLWi64oKNTWKPAIT7eooveE1AzsVasoXPbylsdwjw5jPNKxEXQ=
X-Received: by 2002:a05:6a21:6e01:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-1f5787332c4mr25422491637.29.1741866056554;
        Thu, 13 Mar 2025 04:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVPPVaqt3ccoP6Qi6iR+F3/+FepdazbfVoBgBB08wJlm086Lrkra8NnpQV4ECmwIxgzuhyRQ==
X-Received: by 2002:a05:6a21:6e01:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-1f5787332c4mr25422454637.29.1741866056162;
        Thu, 13 Mar 2025 04:40:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:40:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:09 +0530
Subject: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth before
 & after link re-training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=3703;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QF3t9Npqd6WDL13WAUYjPdc5+X7unsf6GqmoGDJ96Z4=;
 b=r9fy/TEQIugEusXyzLXabUGKObbPiDQA2y0cW3J/suds1DrMZVbsdRhS6C69uzJ4DGZnytm19
 VjGnvA/1AohDqYs2XNcrykXd1/23Tf2WTarVjm71yVNjL4/h/JZY91N
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: GmE-GyY7bB9i3AC4cLIqhQ0EG2lGOBRH
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2c44a cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p-QNkzJndyCg75AdzNkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: GmE-GyY7bB9i3AC4cLIqhQ0EG2lGOBRH
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
X-CRM114-CacheID: sfid-20250313_044059_122015_7ED99215 
X-CRM114-Status: GOOD (  20.10  )
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

If the driver wants to move to higher data rate/speed than the current data
rate then the controller driver may need to change certain votes so that
link may come up at requested data rate/speed like QCOM PCIe controllers
need to change their RPMh (Resource Power Manager-hardened) state. Once
link retraining is done controller drivers needs to adjust their votes
based on the final data rate.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 0a5e7efbce2c..b1d660359553 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootport = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The controller driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_rootport && host->ops->pre_scale_bus_bw) {
+		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
+		if (ret)
+			return ret;
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (is_rootport && host->ops->post_scale_bus_bw)
+		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..9ae199c1e698 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -804,6 +804,19 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	/*
+	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for
+	 * the link re-train to come up in targeted speed. These are called by a single
+	 * client endpoint driver, so there is no need for explicit locking mechanisms.
+	 */
+	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
+	/*
+	 * Callback to the drivers to adjust ICC bw votes, clock frequencies etc
+	 * to the updated speed after link re-train. These are called by a
+	 * single client endpoint driver, so there is no need for explicit
+	 * locking mechanisms.
+	 */
+	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
 };
 
 /*

-- 
2.34.1


