Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCBCC2BA1B
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Inz7l/vu9v73fPSt9ovFbJUFU8bzhwtdsdKcnEdBMh0=; b=eZBeKVE8ezay9bHxDNKvRpvton
	L4VLWSwJt2lNieEPmYkN0jmjSiUOsaiwssMSyFiJiySXirnjwlX9jR1q8Hn83fQExCFiQe1MgIrl2
	a+88btEIXoAAY7eXG4MZl/2pJP8oeronrrAKwddz9KntiqE03t1Ly2H+Q96f1KOEUiLjqTYmaobKB
	RXLBl02v4HkNGeYiiqWkkLHcVVq3dHh9eEsjXfq1zaloxDOzkVnsH9wQQx55llcSZdTiPJOus8NLc
	Q+iRZ72uR1KauQDiMLN0zp09vvM+yltO0ivXgRV16k6IqrOlDeD8GpJe0ip7pAxDpGpEzuW6ffI3W
	U04lJwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2M-0000000B6JV-0Tcb;
	Thu, 13 Mar 2025 11:47:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgw1-0000000B4X8-1emm
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 11:41:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAml1m015350
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Inz7l/vu9v73fPSt9ovFbJUFU8bzhwtdsdKcnEdBMh0=; b=dFCPNfx3k971WYCS
	A+XQv//5LqX72EqMMNugFH/z0NBMaTLcHALb2sJLqjqP6qEBY85EnRKkEdR8rQxy
	YC5BEoRRyuuzSXBnzVBgYvj2hiW5N7GbvXOQ24gnI6V5jhiB2elcuLKTsWMngPv3
	NjVT7pgL7sUubGXGnfUsECtXQQOiS0MnCefA60XYky63Ws6aG9PGTBjhkne00Bu2
	zHY1WDlSLhtBuuNWWqDp13OpWF/BEQaLvQETfmDD9mUCTGEaITc/0704DlN2n0ef
	KfsAH5XsuM/z2yFn0h6Uej1gtzD2kmnbOx8LA1qdbqiY3dpr7WGy2u3zT6uBeJUD
	fq1VNg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwpvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 11:41:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso2526811a91.0
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866068; x=1742470868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inz7l/vu9v73fPSt9ovFbJUFU8bzhwtdsdKcnEdBMh0=;
        b=vrwmwAkt9kwFGXjW/BFi2p8z2tTvtNXG4qf7hXk3PKesf8PAmYjJiOuBSJOW5zQ44J
         g4rsQyrycGQoFQhQ6M+1g+7KyXS/Ut+I64Gd+6T9bToEQK0DUIlFiZpw+MOwaQr4nqe7
         q35zeEmc/W4wEpdKij5BhEBA4FTP9aHzwJxGSZPo+N2KBlbCAUzL6QYa9JgY67Vf/rXG
         6wAhmaGPeoIaDHsrf1v9QZJkLNVd32muqUP7De13CY3IVV/iWaJXjcp2TzUuFOSMrTyc
         m+D7Gqw/a24x/uKcp8xiVY5ZGxeP/cd5lXD+5/s/GGJ0kkDzFuOU+Q/LxnBUYjXtcQvw
         5kqg==
X-Forwarded-Encrypted: i=1; AJvYcCWjQjaY3lWjYZ29HUkWy1RLYwYGoNTqadIbSpDDVzXtkhAko3PQrIqqiJq6ioIpdAnh7cgCdrE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjy75f6O3RrRqvUltjpvfzZvcQzuFysGcgrjlyMq18jb4HLxo
	/kANuUlTelBgGvxo/ruOfNRtW9fqUvqQgzdp/mq6UT2myVBlnN+BKX1u0vFIMytoKigB536zo1F
	luxC0APg5aeutq6PML7SPvSs4lp+5KNasDWxeFi7avE5SRhbc0/16hswHCu2L
X-Gm-Gg: ASbGncvWj52d1GN9ch70DqyuL7Fqpz6yiazXrh5QiQ5Cs/C48qrham1/hkfkIdc4LCt
	+e232aqIUU7t9hd/mG4SlBwIVLTCKoesH8Qxp6GoUq56VJt1szocltvWdcx6BaIVHPjCjhSl5EA
	FQO8+YMjs2OYfqk4tXiB5ZCtR3ty+65bAcHfWdcFqFH5gpOi9tG8zPaHttgbBSoTuPqoRR1CFnz
	X/nifKpoc1zMawQdbrK54F90vlrP/prZkF5H1FvYmr1ucHl8SV86uGR1v36NjBLHPROCFCHDjIr
	hhViNQYiealY0sa+4M4bapmYMDr4GYpB1EVb84zI8K3UR+bxAeY=
X-Received: by 2002:a05:6a20:244f:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-1f544b1864dmr37037083637.25.1741866068017;
        Thu, 13 Mar 2025 04:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYMSraKTahqSusHZQjg0Nxxu2lq1B8e00PC9WyPgDLU3mKpXvp/IOMCPvRJSDANheLJbPDkA==
X-Received: by 2002:a05:6a20:244f:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-1f544b1864dmr37037047637.25.1741866067656;
        Thu, 13 Mar 2025 04:41:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:11 +0530
Subject: [PATCH v2 04/10] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-4-869ca32170bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=3187;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OgsUrN9q3q+inPJyVIdWwjHz4E1SChNjRFIZ0QnU4Yw=;
 b=3HhOo9gMyOoRqSlN5KPpWGl2RGQzhP2VzW9Q+Y6coOM0y6QJgcxYZUSMSGKiD5fh7+bDTJjSI
 yW6u4HCY2AICcDFCzZ/byJDMF/LJ4Sea74xLy6suNHgVkhk0/OFQgKV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: w5aelO4MX8VJmAOOgJKlI71ZemkjKYIz
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d2c454 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=h065WJ_eg54NNNGU8Mde:22 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: w5aelO4MX8VJmAOOgJKlI71ZemkjKYIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044109_444607_C93CC626 
X-CRM114-Status: GOOD (  15.69  )
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
index e4d3366ead1f..b66c413f1e2b 100644
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


