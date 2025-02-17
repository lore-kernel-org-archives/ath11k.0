Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255BAC021A6
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=; b=yoLhDrxWKEHOKDFiIAs7pUVsWq
	XOY6KfhKOc4RQykkL52zmdHrKdftO8uhgahi1mFqcWeRcNY6gJYYjPjb3enm5YJ8ldQAfXDaX6rU3
	KQwOZtVx2ICppUovDsd3D5VwpMpouAXVzO98OH4hYhiWJ0d7e7TDa4rr+0nbLuyoYk0bPb14rbd4p
	XK4SuRMl+zShyHdibc+XhpjaMyptXN6kGU7T2NvX/sWtHf0pMoxDZzpX4z0WzVqYh1npssE6HpdVg
	hgADJvZroHNiBoolSSS1afkUkGWSp0WAAAMoJwo1sZoLRfWTvhKHyxgnX62DcJF8mUsyhn6V+Xw0b
	6KQrpNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjui1-00000003Ubq-3lXe;
	Mon, 17 Feb 2025 06:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuhz-00000003UaL-2vdz
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03DON022862
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=; b=j7KHwzRY5vXBgrHI
	MmRCxQQX2Mp8LXTA9yqjjGzlH/LhsFIl1mF3GemMHOY7Zheu8OpQkqtySnaSBtD5
	lR6pQ3cgbnThz4iZpuj67xTxvx8IvZLSMHOkttAXjFEuZzuSfPZV0AmoXoLQYix/
	ga5XW3BNKZxnGPtBgcpZP9sWkW8gsG9+fsRnrw+OlJJDDpWA10OetDt0ufiRARs2
	alhuRaZd+/05a95Zfchlb4q65SBT29bt0qoo3Zabjr5LZFntIP8JetFXTLtJtYJd
	cAXwgNIGELntwAWg2rs1ajnn3rpqlP1zLpsISDkZkmcYsMDvaIZmwQ46+WwbKqkd
	HM1bmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vgpju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc2b258e82so6207875a91.0
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774062; x=1740378862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=;
        b=f+PriJishhrY7+9FdhvFYaEEQmXVzYWnX7CsvjC5G2VzzaRapCe18EWXFmvJ0b4SbT
         uR0AEhUDTP2Xy3EYIBaoEb3zbzcBRQXw/od+bxF5atipRwUSb4Vf1NhE3eF/fcemVLDR
         /OMqAbgg3Ox80L11NBQ0a/LS2JtRh1dkUNqGRslUaC7+2992SXpNLujpXsSag5gtATBq
         8geCBb1Siu2cF7VplJasWriGkd7IOZVXwf1oRfPZZdyTzCb8zi7PpuAcfPVIdarcq4tW
         HqmMC1wCZvp3RQM3tg8+h3vpfG3a8S+xMdtPt7T0Bw0HeOaGTUggcFJSLmBYszCDr0+U
         zuBg==
X-Forwarded-Encrypted: i=1; AJvYcCUGKF+/X7Q16cEq4HUwBvWDviAGXe/K0pU1sQKuzEbiKeZRfyRzKhpy7zYj4MWSWQu4rUadGsA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/NiwZPy7AeKoorLZuMsGvrgjd8hEu171OT5DRipo9ql/8LTZy
	/6uZJxYPSPVJpyIwCI2OSAwFLj58ETorNuemIDSC5O9YAZgFPvCBS7yMH4u7QGpQIggDm3SZQpJ
	/FaQAzIm9EjOWS0oL4BYk/98JS/6ST2kHA5wEJNYkwVgu0zJIvgZktcx+R+Ia
X-Gm-Gg: ASbGncuw37w5aAZqnvsWHHyKZJ0+Z73ihHc+7sHdQ6DxQJIRzf6+ZHIHcvYPBE4V+SZ
	0yxTLt1CUSoqytb6Nlg3QB4iyn9Bbw6SOO6iQ8M6TqJx9sqRmFJ80/ZZbuGxEQVqfAC+hCIarJC
	KROfZOxqrTJOoxbZc538eJKjzamEetFpqueqYX3m65sj3X8Dubt+0IpX8++68ymMEOxFUaPHjvt
	p/FbbFgqVC06uK+vc2mAneUzs+ZFzis4rCsGMqocyWsJ+0pzQimtiq+QoaQD13ct2PQbGihCvCk
	BIRDaFXWM7ZMKHYKhJc4sT8HSshwOsn1SMSmyKUh
X-Received: by 2002:a05:6a00:234c:b0:732:13fd:3f1f with SMTP id d2e1a72fcca58-732618fb56cmr14240322b3a.24.1739774062245;
        Sun, 16 Feb 2025 22:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYqHKfP8yt8Qc9a4irh4K2X23Pjq+LDBH/UrCtt41Jc31megJXVhKOSJ0WGBaKxJlBENpI8w==
X-Received: by 2002:a05:6a00:234c:b0:732:13fd:3f1f with SMTP id d2e1a72fcca58-732618fb56cmr14240280b3a.24.1739774061833;
        Sun, 16 Feb 2025 22:34:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:08 +0530
Subject: [PATCH 1/8] PCI: update current bus speed as part of
 pci_bus_add_devices()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-1-9bad1e42bdb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=865;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kC8jbRyoGWHcr5F6bMdpdYEPmSroHXkD/t16CewXuhA=;
 b=hAVSW6/mEXLaE68LTQRU1W1pp3AwKigPt8H4z9WgsiwikLyZ6pqw33aV64WLb27DPL5BJXnt+
 HjostU9NnzzB+r3K5WlQydd1j70lmCZqQ728uCojPDlkaI92/xfpO8z
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: pD0PZTxv0xms4OLRiLkqs6TiLDIk1QqZ
X-Proofpoint-ORIG-GUID: pD0PZTxv0xms4OLRiLkqs6TiLDIk1QqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223423_751298_CF36C82A 
X-CRM114-Status: GOOD (  12.50  )
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

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_bus_add_devices() will be called and as part of
it update the link bus speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 98910bc0fcc4..994879071d4c 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
 	struct pci_dev *dev;
 	struct pci_bus *child;
 
+	if (bus->self)
+		pcie_update_link_speed((struct pci_bus *)bus);
+
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		/* Skip already-added devices */
 		if (pci_dev_is_added(dev))

-- 
2.34.1


