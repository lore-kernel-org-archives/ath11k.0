Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6753C54754
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=; b=QAUmr0OMnecdNnOIXp02zijYBs
	fD3R8q1vochXUnduAxhLTV3YzgV9n51+zCmLoYcnxJMuqCQuuh2jSxaTz9XiOFJlda5kQLYFTFXZ9
	nBXw46VayseS7AazFj7qpfRx56qUrHUpVoKIvdYTgRSoprazYMtmXz04lnMpMBGMf8Nf3RJQdv2Dv
	EPmwUpJkA67ianELd3T3GBaqkkvjTGuqz9Xp1AC6OUrg32Wu5m63arS44zx/q196PfTGs5TbuRl+a
	dFflVgCOwo4FgbVnTWqbHsYMnWxYaLr+80MGyQ4+WkPas0yKzhhhHYvsiL65FrVsKc2O2rseOZ4zS
	gRDMj46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxET-00000008gvU-1ayT;
	Mon, 19 May 2025 09:56:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx1T-00000008csw-1fuk
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:43:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9CFTA000481
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=; b=NNLRL+vaMQCh5Rp4
	S4L9FjCbGkZXhfazz5BYzNoYPzgIbw7np9qm33KNLiqf73K6ODM4N3KJU8D2iNcK
	tuHNBenNXkqJhVXINbV388GFCovjOgaQrY9vdO9PpugZ55sqFb0KXj4Ezk3ZvOWB
	UbSAX1BqNdvsu9OxALCWbiW1b2KpzlLsdXLJfH3OCWT8ipvdYt60usf57oVG52ao
	6WztyJa4KSwOdoESHXhcmtHw4ZMOW3S4bt4mSJdhcJB3jAC0pPoJLFsXQZUCx/cs
	qRunL12i2Pj20RM+ZogH+NwVd5UGNFALRKNrgB+V7yEAzXbExRLkGUpbF7y1UG4t
	C5NWGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9uupf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742b8c0eaf0so950985b3a.2
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647782; x=1748252582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=;
        b=er5b2S7uF2FDH9aIiUG8HOFSpPHznHMz66cEI3p1FhXtTWwrzJI4dUAjXx/NEVvp9A
         wjumgz1Q0wIbyV3DX+Uk+rktHJrUFe/OjPean54Gp62W6OLZUOsZoI9h6W9qFLfIMP+X
         OAYc3mCEjU0nzvQWmMqxkT0SC7F16P2wvnCmquiQOd80k1DAhHQGlcdke5+BjclqKFNO
         SuM9Ug4jnbdoxWYnpHVPgb9oEe+vSvq6Vy0CbKKnW50r9qXUeGkeSzSfYSirV4tPwMn3
         O74jbPx3jenb/bWTaUk93fgD1QNlWtjwmhVt5gg0s9mXqdT2Q2rdtFPnNOPXumFLEgRv
         tEgg==
X-Forwarded-Encrypted: i=1; AJvYcCUAWrm7e4gLL7J+EnoUY9j7eqTNBISbD1eRbuq89WrqbQqY9fJIi5LaFKww7Gfl7twcdJSuwZc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDHduq50CcZvAtTM9DWAJC3aTXPEMYim1DryZR5i8/NpcHTBXg
	ptMXtbVnZDqLWK28vtmEoHbHMNllIQHZ/u/D7vp8lLxc5b5zai7F+mStULbILGGFkOp3xXrqT/b
	asK7NzjPc+uJcrOgTAk9FICHuYmMIiK4Li7PixFqRsFWcvjFwSAemQkrySVu2DVfg
X-Gm-Gg: ASbGncvEbTforJ5thWEG3JkunTiEFoi/MVitIUdQPXQUnR07SYsLtcFRu9yC1WJjawH
	XL1vcchKHVza0d3m+HN3mWmgay5aWbtK1WVi98yKni877mWQOrh6X8Y8xXe4xyg6feTgtVgmDGq
	t7wXu+ps+KSUBUsFrwSM919kFr+iwCL9L+Tk7DQO7CIeuUOlAdp24w52Vzx4uCGbIxtmY+h/0Dj
	xeNeKhrUUmXUQlWnrNjQup9P9yNvdWaiGpX+dvG3S5yju5z4tvRcCkq7bD7yvTpmCj4ZAvU9cpU
	W5KuyJxOgSmKTA92RGAtY1rp5ISroyWgr+MkEk0MBi0/Aew=
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18212024b3a.16.1747647781872;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq4VZJ8jXy0RcqfiaIsLUELp4ZDyQyOCKyt5bCa/MS6rMWomKrNG+4/gCurYKLyPIbNJT57Q==
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18211990b3a.16.1747647781467;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:18 +0530
Subject: [PATCH v3 05/11] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-5-3acd4a17bbb5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3243;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SUc6IJO3BpbO4Jf4TpYtqCzshGFkITnNomre9y5viZE=;
 b=0FFqE/2BevOy7/2o0ZDzBTf5YqeAZmEQiA/aA9YnA+gjWks8X8VUxmpvDojUvsuvCAOUWiO5v
 kQRgurHaE6cDCUERnJhf+yxdVV6kYWaaRgoJ9AJFDNrEf0l85bzJbwx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 67ppJzA-9msBTDRxpiRJJF28vipWiQsI
X-Proofpoint-ORIG-GUID: 67ppJzA-9msBTDRxpiRJJF28vipWiQsI
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682afd26 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfXxA3EL+GffVvu
 7VJmOCvfi6U0U4jdmY7j0FeuUElmtRWirrrIW792mqqrsgJOfuxu78Cd28Ru6GKoJuT0MPvC5j7
 PnEYf/SxuEuaCY2oX2prlKCDUevYRWYhkWYiZZU4zWlFg9WNqqfJgLZsAU+b1l3RUkJA+c6vEo/
 FwFgnikxQ5y7tfeN8jaMew94Ia3IOPrig7aiF9yRDK0zxhx5uYaEixOKafd6g6+BduoSoiyS2O3
 2ZdDgiJ9x4GkFgBwhOFCzscng1CJ5EzL8HArXEDmDbX2c6YAr8349VGDnhTZj15URJc1u4P1Kop
 buLhvMnsomZmhNZkzSP+qe0cxcbI+G63I4TlB+Ai6z83RBLjdfJg1MMxtmwMCPnYWOqdJb4Fhcs
 2F+P3KXdI0j9uY3nRBanZSzH9eC1ixvlzy9JCYM12BpSiSi1AHQdk9jJhR3Zm2VQKeLegHHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024303_446796_97C139F5 
X-CRM114-Status: GOOD (  16.01  )
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
index dc98ae63362db0422384b1879a2b9a7dc564d091..bd984cde8d3bd688b2ac32566b0e9cdbc70905c0 100644
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


