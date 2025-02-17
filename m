Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF604C021A4
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnkNnMCfFUxeM0wOwRWOrbx64pi1NXcdn9eltQQvhxg=; b=T40QkPNJN3JQeuJkCHl6B3sAYi
	FVL0uQDHlIuvjkLWrui7SwHl34WRMrQp+murTiclX+UKNPGIcuQF9xdhW4szM/5rqSRg1MfFyXJ2K
	uAsAeOYydNLCLVsOw/vvyVBBbJssjL9BbxuUCVFP25ESIIl+86gIASchCa6K3VvYgYKv6vVE2W8Yv
	vz+Qx70+AiUMPAkPv+lxULJ3Q2mRHQCikdJRBynAn+YaL9dHVa62nAOviHzkSrbXtqQ106KbjdljH
	DFr8NQ5EMSq5GB+hb71/1UpKLqoSCDQ8i5+A48+bhAvutvTvmdLFFCGjMEHbxEiltP9QK7ykcGC4v
	gJiLF+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuib-00000003UwX-29OQ;
	Mon, 17 Feb 2025 06:35:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuiY-00000003Utq-1xar
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 06:34:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03ASB003070
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnkNnMCfFUxeM0wOwRWOrbx64pi1NXcdn9eltQQvhxg=; b=jtIxSIql9rVQy5UV
	UqMLQus7m7W/13yb2LGlfhPBRgGxbyimevQB/YbsDdSYEJmETeK0ieL3Hola4gAk
	hpcMVSlFheMTd4sxcI1663zQ3BxqSfzVtEK8ILbo7PY476x101F2HanakgI3DBK4
	OIbFmSYHHj4YSrUtpeuTIQUVvmjAP8j+DEm3kzPIbqN+pBsen2FExy2BSAhl6eKZ
	AqCIDIruWSi8z+9rvTgp09tkM9kqJ95x1cA0KVdaEbDV901TtwWfmxBj7BMfuwZW
	mUAyr3RtBl/Qi6e47T4Ryc5ByfqdGD8rMsIbfUfFcatn/HUu66fj8KEV5zOB4uuT
	P5fLTA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7v8pbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Feb 2025 06:34:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc45101191so2804519a91.1
        for <ath11k@lists.infradead.org>; Sun, 16 Feb 2025 22:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774096; x=1740378896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnkNnMCfFUxeM0wOwRWOrbx64pi1NXcdn9eltQQvhxg=;
        b=ibKOYgDUxVmcU+QKUzE2kCdo1zzW6c6lI+na9/GzOEVWMcwCv3LIowEvv9N34mNBH0
         X65SkYUC1jJlWghmgFTXyVAZef6sAnk+XwG3ZaP/zD5U++i7AOcM9YZhwtgscK0/H9ON
         3XyeWkaGuK3+8SL1UqTFeB+6sUuujMH8fsjVCvY0BhsmIaD7Y3oBD3flVwV3kkMDxEfs
         IMk4vwWJRcg8f2220APIrTZ8HMCkiA+kzIUhXueu0IutoNhwQfUHjrUi51hKb3aeYKDH
         KY4kTO1CEFfcoSomrv/d8RxbLAFcRA1PkzX/GTRG4+0wpx1TqyBjIkDRRUfd7NrTt15S
         d/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD3ZJbj3n50KLnKUF6Vgb2mDI0vOSItR08jW4dQCyGFHTMAUIO0q0W7YM5KL4oNqrmC8tDlP4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwDx8gE7EXnQUpu875oxcY+BhxkkO/p7oH2xTEJtfZxJJAxk7y
	MyOUI2F5Y61aTM+oJuBh2+mzVj7hpYGTmK72+YtPdO1o3NNcCg7a4kBclfGWrnAyYmMFhDTXj9L
	0yiistMvlCcMazE/wDeMPVo+fUwEImMtpffSUI3SoEzd0Nx8wTImkZhmI7JUG
X-Gm-Gg: ASbGnctHt+rVe3+mEhY2XqQWg4ikfGlu967IcdYZeNp6lMleLxLySSUPcsVbOTKFBf6
	c8He54vc40rxA2320UqgCqYxJIqsTIBI3jWrgyL8vWEh9n9jx6t7uVhYYxWCBVbMZJ7qGmoUCUF
	bdSjo+Rw0TXt/JIpemTF818LpSxBqnsgqiEjRIQTW60zrX7etrV3/iaYaIRv9mUtW6801nLV3TB
	fc7G1AP8uCwtWzFwBPwvsJVquRdAeF9EETxgNKn/cKmAH3EXhyHhfaBZjv3rd/BTNw9pcksEjaL
	t/4YytiBVQWZNkqM9kl6OzAAhFdNUTVZqTUKTrIi
X-Received: by 2002:aa7:8f99:0:b0:732:6231:f2a3 with SMTP id d2e1a72fcca58-7326231f591mr10834887b3a.3.1739774096143;
        Sun, 16 Feb 2025 22:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lYcW5hPdY6ZjNE6LJPu12IuQ+vFgWgZldyLyVtQtpguJsqNYOC4jj1hFpi5FOLfE6r8WdA==
X-Received: by 2002:aa7:8f99:0:b0:732:6231:f2a3 with SMTP id d2e1a72fcca58-7326231f591mr10834848b3a.3.1739774095765;
        Sun, 16 Feb 2025 22:34:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:55 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:14 +0530
Subject: [PATCH 7/8] PCI: Make pcie_link_speed variable public & export
 pci_set_target_speed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-7-9bad1e42bdb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=1633;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MDH1EAT3iFlnei9rPbQ3oLiWKzuPU08kTSTKS0pttwE=;
 b=snYvwe6fz5/0tGaNyLSFO6GDeBFP6NvfzVDDK2eS6qx1l1MqJLBNCE6ieF3cDDsCtYItw70rc
 DiK+FnwplEVCc+mmzxuokhAenPJKdpKx0tYfSSyXHuaTWeeuVDz/U1y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: naHbUawbZMCJ14tKCYFuFk2_45yFkqud
X-Proofpoint-GUID: naHbUawbZMCJ14tKCYFuFk2_45yFkqud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=950 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223458_628976_953C732F 
X-CRM114-Status: GOOD (  14.71  )
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

It can be used by the PCIe client drivers and reduce the code duplication.
And export pci_set_target_speed() so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.h         | 1 -
 drivers/pci/pcie/bwctrl.c | 1 +
 include/linux/pci.h       | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 01e51db8d285..ada9a0433a99 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -82,7 +82,6 @@ struct pcie_tlp_log;
 #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
 #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
 
-extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
 bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index e3faa4d1f935..dc01c93bcc37 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 58f1de626c37..8a3b3195122d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -305,6 +305,7 @@ enum pci_bus_speed {
 
 enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
 enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
+extern const unsigned char pcie_link_speed[];
 
 struct pci_vpd {
 	struct mutex	lock;

-- 
2.34.1


