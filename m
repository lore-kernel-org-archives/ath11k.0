Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FECC021A0
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfJAtknnM5Ix1H9l/tiQteK3hWDYQBja8j0ciMMbYFw=; b=e7zDgaIbhPnlU8kAwXridSI8if
	TWvklLpZ/OmtDHIAWU2ZL2cWmgH9XAMkcHWXLjqmcg3Qx51QBITHya0WO8fYxM+fa5ZFLxh0ipetB
	pdddhBSrR8LaN8odZsXbgnktVH1erZKCynVw22KTGupArtcgBTfUCM7GdM/dHkREaQ3l4FFQiQc8O
	EwHnn2Y9Fuo35fXdxP2Xpk+eE9m7qPBxi9xlTZ2Vu4rFBHTeGBXaKBbNr5FpOXIDP5bFOIRpiNkGw
	X8JHuDYLewzaPqyGqDnHhpb0v3dY7rRtjDP9AnX4hbd4q77ACEyoo/NYuD0CA00QDQtXQKSbyc7aK
	dWtCm77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiA-00000003UfC-1Ft3;
	Mon, 17 Feb 2025 06:34:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjui7-00000003UeK-0jhr
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03eOK027314
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfJAtknnM5Ix1H9l/tiQteK3hWDYQBja8j0ciMMbYFw=; b=KSKAXbxIm4a6mDsk
	OJLRGFuMB+06LODX2+xrvDCLH7scwZEMQTDuz0wfRLxCPcY2QI8XiDl1nNDRSb0T
	bzxvI/YD9ojp8KhC7Cz4o6QOtfwKoOgv6qv0Rlu3tE6uGEHDXlScsZVxu46tRXNb
	rr2QHxm/HURXIEQcGxqRSDYcOo7C6/jxQ5+58/+mxVKTY3ACga+pEexjSZEF1tu5
	YsQbjVmyxzGVdqDUNw1MM3tbHUdyRSyAhoniJbOzjsU5lRbqKkYK8cf2iUEFQJbG
	nUAL4JU2dsox7nTTNEBKMmDjT3R8+S5c+MM4FmTpvkFC38tq2pHRzOtgk5ZIfSPD
	wEUAAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7trptq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so8331057a91.3
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774068; x=1740378868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfJAtknnM5Ix1H9l/tiQteK3hWDYQBja8j0ciMMbYFw=;
        b=Y7yy0FNVwifS+YTOgpNPoFuTUKidQpoiAur7fauwU2nBZFvUh3pCoDDdTKPKm2QHWd
         SD4cV6S7p6WJ9JQWOvZXqmuzTZuad23r3VZGAzyEpYr4cMcze47stYGaKgod9lHb1MCa
         UEZVb9m5tE0jiPMiIIJyJKlRq9333ld6DrAqDhNNyh/qsyUUh3H8871MzZJWKCkdytT2
         Nf8twAzHYAhZYfQIOSd7EZZP4pQM8bw8VSeoDqOouRYFCF2cP6JJpMbob6NEf41ffLLE
         QmfQqDR1dj5j3stTb6CtSklL7dOoTVmXf7tTIZwOZfmYeWyQEIpLNscqtXlg0uDguRIO
         n7vA==
X-Forwarded-Encrypted: i=1; AJvYcCU5vL3Z0UEocGWlul7YMcQSc4R2i9/QFuI6PdPVYGJvVA1pqrHy1L7ueM1Knz/qWw0R0kGj3JY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw//gqaZVY98+eTkA+UxMCg9fU1xs2Txn9LvMlMVawtpqVZd9tO
	zQgDLG689AOjq93aMO20gRUrszG2qTOZX4NAqpL0pmoKUxWzfiiPRaHGuGMvVmtith21CsjeFbz
	RDt/H/oT5TfBrAiTajxpgTm04bG3BYkw7kZJpArh+GfDTOCFH5e/g509hpwMg
X-Gm-Gg: ASbGnctsK8zELhzr3efUAAfAtsAzJVCw6qtJZ9NbinwwMjXRrrd4J7SUvVQLWRne3RC
	tKVMnuc4QdkXJVV1Bap1ePjRRBnv+/7GHI7/kNqRSMrsuxnbqe5/XLy8VwlX0cRoHIdgyLH1pNR
	BCvxuCxYX12vBaxzT5nK9ddDpAuryp01yPy+KwDR2wrVUwHHf9OyI1ZFgJV1LITQyVRNSoa0P2N
	YpHl8hwKcUQeU0mpvf3MZusk54EunUdxw9M7Z2qviHcBoN18yf/IG2eGgg/YhjV787hok1yG41f
	0bNuwxvJm77Z61sbHUK98qTnpBIkaKKoliKJ1hA3
X-Received: by 2002:a05:6a21:2d87:b0:1ee:43c3:9bfa with SMTP id adf61e73a8af0-1ee8cc16ab5mr16622910637.35.1739774068526;
        Sun, 16 Feb 2025 22:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ7gToBq7D4VtpV2EASi1+JDe5Y5Jkt/4aGWzWeA8pKMBeCH8FZhkAAVk6ksqeb0q+oCvNuA==
X-Received: by 2002:a05:6a21:2d87:b0:1ee:43c3:9bfa with SMTP id adf61e73a8af0-1ee8cc16ab5mr16622835637.35.1739774067507;
        Sun, 16 Feb 2025 22:34:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:09 +0530
Subject: [PATCH 2/8] PCI/bwctrl: Add support to scale bandwidth before &
 after link re-training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-2-9bad1e42bdb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=3068;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UOzsnW0yk1kCZhcOHUKzAXiM1zBrG/5KAYYsM43pKTM=;
 b=xi2H5j+IGrnLH2KW01vOyRK0v1mmhX6st6biV7Tank1/vHMoUUt8rpVtOT60WK8uXuBhj8yK3
 8x2ATQZIgedBNLlXYuqyCQVT/znFmyy+9q/E+GmWNi3TPK/ehbPnrMA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 88QnoQdLrpMaavEwBTgLg4k5ouxpfv-_
X-Proofpoint-GUID: 88QnoQdLrpMaavEwBTgLg4k5ouxpfv-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223431_337063_62CBF5AF 
X-CRM114-Status: GOOD (  19.51  )
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
the link re-train.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 0a5e7efbce2c..e3faa4d1f935 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_root = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The controller driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_root && host->ops->pre_scale_bus_bw) {
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
 
+	if (is_root && host->ops->post_scale_bus_bw)
+		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..58f1de626c37 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -804,6 +804,8 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
+	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
 };
 
 /*

-- 
2.34.1


