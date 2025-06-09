Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029DCC678DF
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsooE1BDcjvS4+pylG64GDXCYMB/yvCU5ly5nWPDrGY=; b=tXDNgTgeiWI8iq6DxwEq/AgkBM
	0akYRf5H8emDg06oyAlSnfZEUMSlMTFDSrG7HZDGvj9bUJNbdvI4Z+0hrvNDJMppnnz3FYY5OMuKJ
	ljZTfGgEiN//2SOuWQEsKRMrKHUXkBtSInMNjbIXlh6v1UrE9mkm1jHyJD9j309cSqFvWVaWe+IHI
	rsSfywyumrTfVgBcPl07WWOwBeH+RQjhlLu9IxVl3ZQAiOmWOCkWPlVa7AhV5QsXfzLH8coRFj4Bu
	FyiJ+8vXaQOnxQ905riZId7kepe2lKwJSnxyxGQ5uDRUd4P+RaXragaEDISaLEdwc1iuXB7mRJmXJ
	ly0CrO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSt-0000000407f-33E7;
	Mon, 09 Jun 2025 11:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa72-00000003x4x-3WOE
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599nAYR021751
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QsooE1BDcjvS4+pylG64GDXCYMB/yvCU5ly5nWPDrGY=; b=NZKDSen1iZxQsCyL
	umvq/NRS79yMsXt8GKVeb+0Ht2gMZR8HOyPCyoYTBDXIDg80nh7sCAcuuXDedPLM
	WU98ISW6XS3E19fXVbRplrsflSlCllf0rlU3eVAA9IJT//fxOnSPis4tPaxMRJTx
	/cRDz37Y7j9aiUHzFQPCw2kng2ixppx3V6SSg/fYgJrlcZFSkLcJEAW+XVAk71si
	zxnU9YaIyrHaP2lBuvtJaZBY4VEMcaKaPOi0WeU7tahv+YRVKGEHKfvzSFmkHPfs
	51bKzHMU3S05fWzgbYVOXdWvAr8fUeS52S/EryztCe9vuHMs+g5fuhJLhZbC56wJ
	JmnA7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9nwrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235dd77d11fso35402335ad.0
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466338; x=1750071138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsooE1BDcjvS4+pylG64GDXCYMB/yvCU5ly5nWPDrGY=;
        b=Coa8gj5M7RC1nSg3EcPv3UQjMg755Z44Qn0ocBDqJPNT+GyBc5SVPLbF+0ZU8hOGFL
         VT3bXEE83kMeWiV4GRzozBf6Yv8SKtyb1EaxMIHBd6+fONGaniU8dLxi/qG+IGATATam
         MWBtgJOoqB9fJekFlucZLhhnlNIcwQirhf7UULb6hIayEK6b+wBiguZLfisFgaIXor5z
         PxIUH8oMr3Ou0/hHAXD2c3wBtok/fqmDW8ANdqTrE8yh65IG7AXYqAs5TEyCiG6pjze8
         VO8vXNiwZx9nM5hVoWxT42vKbxEIJAzgXy6Uzjx00JEf2H42dcoZqG+E55jxDYFwJie8
         EcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFnkJALuhDtrCJXDNRXyV43y41IghtPBSOl+YmrU9u2cyG2cxbKu8grxCPPRN9WKSwkNCXVcE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsUD6RgGturxhWu2b8vxqK6c23pnH4hDQKoV07jE7rst5QulYd
	Q2NhZYNvAQWPSHqCze76Y0jb0w2XGddBWCL0aWs1BmaltxTAxmFkC8gZ221w8Mrfymwcd6TYwnZ
	bAMvFAzPJr+FC4StCeyRQSj6HttdLCFlY875hK3+Lw6PdUMozoN1MGR4jNJnRrm8A
X-Gm-Gg: ASbGncseEU9Ka9U0sDbd2yaM/+dpG3siu/Uv19+5dpMy3AlxIUeJy78J0MD50XTswQO
	5Rh6QA9hDuZ1FVCnLS51eJv0gZk66vXCaD2VbWKlE2yjS/7lN9f3Ghdbua25dLYW3y22lisveYM
	NVWxdfeWTUWCL1K+sbuWxcxWe8Xwa4zrn1WrkMEJdZY3JEGutCo5i7/x8xoyIqn1WE8iiDBS4ky
	/JVX3ZI95/RBsLw+2TU3b8vNvUBU2fPmOEVFMuz1t7vcH/UaKlUBo0DR5tuTPddrI5C9IGQmnxa
	Y8Uf+gMEkmBdamW6WOt36yoPFOluZBkJbSnSiD0e/OE8OiRt7xxgAsx5WQ==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr200290105ad.25.1749466338495;
        Mon, 09 Jun 2025 03:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFsj9gbm1Xe2gggDXCvM8eocxd1s80k1LTfUZKFfmG+nVAZVHG2TZKNjCJmXQ8psxA+pG/sQ==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr200289795ad.25.1749466338116;
        Mon, 09 Jun 2025 03:52:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:28 +0530
Subject: [PATCH v4 07/11] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-7-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=3243;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rfpuuz4A0QmsWV8lRO0l5whEsWzWwv+rc5GG1/o0xok=;
 b=YVwMdol+AseMlfIz0/NjSMg6XCl8+u+DF7+jT+n81+w4e7KH9oYdQk4afC9TamYNqaM1TKy8M
 bo1nu3Kf+/ZBUYGTEKdroWLMKZLaUue+XTINQy4n4hMD1rB2U+XFiUi
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: O2Q34XMQfKWekI2gQHzPcwtWEPzp_9Mr
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846bce3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: O2Q34XMQfKWekI2gQHzPcwtWEPzp_9Mr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX61cmH6gkBEHR
 +vg0E92ESn4kBhnEVowKVokAYjNaVgpT51MVFgKfl9bM6ahrkZhygHPxK+oaIza3hkG3g6xFPqf
 CpRs1gQfuiRTjiV6TGNUv9V7ksCPOk5V0v+cMaKPAMtJtbLGKnSjKmbItz4OOK+QgqPzU0X+FOH
 DHoCgu7LCeDO4D38JgSUQ6/QCe7/bv6ESjq30oThnSYkYr6VuWG+nDYgxBVhD9KyujQUIwPMMHJ
 KM+AQcuag4W+bF3YY2yU+/l7vuAjO6B7X7t29nFDUkQ5Bf8ZEUuJgc4TJaT1j9+Bl4aR4fqzz6J
 W7sHp1sKNUjuKYxqffSwwDI9lXXV67GIgh50ujGsDAgoVa8hbVJIVoxF7b0gbd2FHNNcAh+F026
 npltXpiC/VJNWLIm1XXr2kSQ57+tamXZGD4zQoJjbGCZmJIY5k/tIQe5YFKHbnCAGwL74tDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035221_004715_1023E308 
X-CRM114-Status: GOOD (  15.57  )
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

Extract core logic from qcom_pcie_icc_opp_update() into
qcom_pcie_set_icc_opp() to use in other parts of the code to avoid
duplications.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c789e3f856550bcfa1ce09962ba9c086d117de05..02643579707f45fc7279023feb7dbc903e69822d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1294,6 +1294,40 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
+{
+	struct dw_pcie *pci = pcie->pci;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	int ret = 0, freq_mbps;
+
+	if (pcie->icc_mem) {
+		ret = icc_set_bw(pcie->icc_mem, 0,
+				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
+		if (ret) {
+			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+				ret);
+		}
+	} else if (pcie->use_pm_opp) {
+		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		if (freq_mbps < 0)
+			return -EINVAL;
+
+		freq_kbps = freq_mbps * KILO;
+		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
+						 true);
+		if (!IS_ERR(opp)) {
+			ret = dev_pm_opp_set_opp(pci->dev, opp);
+			if (ret)
+				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
+					freq_kbps * width, ret);
+			dev_pm_opp_put(opp);
+		}
+	}
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
@@ -1478,9 +1512,6 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
 	u32 offset, status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
-	unsigned long freq_kbps;
-	struct dev_pm_opp *opp;
-	int ret, freq_mbps;
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
@@ -1492,29 +1523,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
 
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0,
-				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
-		if (ret) {
-			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-		}
-	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
-		if (freq_mbps < 0)
-			return;
-
-		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
-		if (!IS_ERR(opp)) {
-			ret = dev_pm_opp_set_opp(pci->dev, opp);
-			if (ret)
-				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
-					freq_kbps * width, ret);
-			dev_pm_opp_put(opp);
-		}
-	}
+	qcom_pcie_set_icc_opp(pcie, speed, width);
 }
 
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)

-- 
2.34.1


