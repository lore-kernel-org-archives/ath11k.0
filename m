Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92109C677C4
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o92yNqD2Tgr7h+9utlt9yCYodwnleBQ6N8D29Rin1hw=; b=hStJFc7RExmKvq7m5bQq1Brzrb
	eIOkR2tFTaoY/QtSGiv57lITHJUYCnD1twD7Q7qJN4UhIXsm6OjK3ME/CDFtvs/ugc87ryXJJIXR/
	ck9nv3V4l9bxsRdf1ajPeZpJG+teIKqSCJw2dvCWMkDM8mwucfOMIYWEAVCThLRtnz5ZgdFssw5eC
	AeFm+j+WhvKxnXWPbwHs6WJVme2YNBZ9equtzeMpwJPdWgMtbo/WZN1fbQtCELBTEP3h35vNlmMM2
	qvl7hgkr4QCJMOb6kuSuD8sr5StkdQPMdNPR1Km7ADTTEp+LbQJ42weTFri5Jp4HN7e4i4kEaMvpZ
	KhMvz0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaV0-000000040Wr-3etq;
	Mon, 09 Jun 2025 11:17:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa77-00000003x6K-3hUU
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599NRqw026541
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o92yNqD2Tgr7h+9utlt9yCYodwnleBQ6N8D29Rin1hw=; b=G+hFA0CkvxUJr/zi
	wSnDhjrRSzOgEA3bsEZp+cI8PQ7UAGoyyTmMjoFSarFBvdoHrr52XFEtW4j5szvz
	lIB8e2g58yJhls5rgb2DBkx5TP16rqjHSJGV8P4mXMi+W0VM409Y3o6lqoMT94Au
	Qa424WPhuK0+xC1a7GFrvVD+uxbDKEte+e+XOr5BexHbCRMXoeiHGZA9vDbosdJE
	GhfMLAW18ZMkj65OnldQXYBoun4jsrck+jZ6yDcS0/dPSChwXgZGK6jzwzPJAglb
	ajAk8mHfDDzNGpQqP2k0rmqrSlitkXpdhateK/4t5J3/FbfH6g/LDszHPpovFJg0
	CT/XYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv5ncb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so2478588a12.2
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466344; x=1750071144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o92yNqD2Tgr7h+9utlt9yCYodwnleBQ6N8D29Rin1hw=;
        b=uL4QmDth0O4l61WZuSnkDr7JsiCx/hPY97bXPOUIEKxkBURZJgzdqfNikdD9Y1zDFg
         h6LbyhXi46TT3t/hhXxYCZSbDPas/aDFSTU5dQ+lubGnKmnnx4kF/ytZLOWgvyzRSKqT
         em+URjr7z5YxbiWkEoBtfFxPrlIiYAw15QlQuSVU4UB/47ekpwFpYCckCpKynMXfFUZx
         MkQalE3Bc4rtRHzHFxW/rtRdUWfziHZHYY6PzOUEpeUDr/ifW06FifMvDo9kI36/9jCu
         mHHE1OyB5EByCGln/9TIREChpU5NcMkR/cTz+1+WcFxcSPCQm2gZhTEGBC4g/Gi+OdoQ
         a0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVSsg0dGlWH42FoTsX8FMSOtMWrb/5Ebq0uBUWTYXa/8rXDJ87a5Xm22TWYKy76/d3h0gUzBxc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJETmp/FcOPJCb8SLBgpLYJrnkaEL9cdLiq330++zQDj9p1Oc
	lsrQThjGo2pJfw9dwk8ZrDI7qVPhAss1BVsqGx1QSyBGWOOpyq0+L0lqYV4aJPtXA4AkuqFxnJm
	OK5a2wNso44vhQ1zQ9no3t1U1FYUmaToaIk3p/u6kZYVJXW02Hdg0Xlj4151+H3Dr
X-Gm-Gg: ASbGncs8V2KJny6rAyslqo5nH3v74WoDH7L3Cf+U7hGbDlB6QIrYeQBoiQqj4H4P4aB
	aYKQtj9gQeAA+JMEsDQjw4592wuHosgewTuK2fYRVG3Ba2IZKe2H/6F6VJmxAFRh+yctBqUBFmU
	7/11BECgSPoRsXXMEkbPtNI1x2t4S6cg6kdieHtqChDKwlTjdm/na+Cx6Le2DsD5xYRSKxhw0Yt
	FdNIQmxM5Sptd0sbTlFiEf4WGGVQuobZ56s3KIn6uopeftmE8Lnf5U+XFWXOsyslGWmIBlPSAll
	pN+eNkJaG8iVvz/3TOgSCu8Ha5sUtUsOF1AyHWzTph/xZoMvfwbhqDjqpw==
X-Received: by 2002:a17:902:f54c:b0:234:9066:c857 with SMTP id d9443c01a7336-23601e50d77mr159860305ad.21.1749466344253;
        Mon, 09 Jun 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFqOZ0LBqhpHW4dTHxE+6rU0ZPQzQW2xA5UNp/TIVNcBbhnWqqq67ylrTPdwc7ULZzKPDUew==
X-Received: by 2002:a17:902:f54c:b0:234:9066:c857 with SMTP id d9443c01a7336-23601e50d77mr159860025ad.21.1749466343879;
        Mon, 09 Jun 2025 03:52:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:29 +0530
Subject: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-8-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=4037;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mQP/2kjW43Zd9RccVZlz6IzdDvgPGrMPigpQllInEwU=;
 b=NU7mc78Y5DDzuXdX5+Bk8k6qlUSb4HRMRU9Cz98SQ5kXfngX5ckDgsx9jlTQpzKPe1SyhbpP1
 1B/b+g8nppgATx055WOYhDiMM9kQWBER9f7ygNyW0F/wiOdkazNdjrH
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 70-5Ib38spcxIvXitjv-0svELaEuXc2w
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846bce9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 70-5Ib38spcxIvXitjv-0svELaEuXc2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX39lU3O8uNLxi
 LlMtEeZ/jnx0nCAOpvtneK1zvby0iGCJ6CNoghc1zaU2qc0eyBRPuIPPq3m+7sv4fGd1BuVBStb
 /rgaAHeLDvtY8TOdqIDhxjwunZtJiOY7QKTgJiRE8W1kVQklZUlqzfPkGoP0AAhqkS9LZPJekaA
 HemPNcuvVnzBWwaeGURhR5Gzjk1MP6g/dV9MJeyz1oxFVwVstuioK1vOxgC92IWexDLlooVgyts
 xeiQa0KMS0Xtneq/9YDkiwOCIx2EHfsNljiWx4JR5rvaV9vo8Ki6rSYCyhgCAfPjoeqNGB5LjBG
 z3iYVY9Y9Qbfw77gCmCSgOR2Nb6rT7nL4Wo/V04DpF7DPJTz9hHCheuZw80OA+ciqyQx1uDXv+O
 mZoJWXvK05RGZoYo9kScVPwIhnsEEzTJ1bfuS1r5R3t/c4MfI8fdF5BDYzE78PIm/FL3LFad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035225_939623_A570856C 
X-CRM114-Status: GOOD (  15.87  )
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

QCOM PCIe controllers need to disable ASPM before initiating link
re-train. So as part of pre_link_speed_change() disable ASPM and as
part of post_link_speed_change() enable ASPM back.

As the driver needs to enable the ASPM states that are enabled
by the system, save PCI ASPM states before disabling them and
in post_link_speed_change() use the saved ASPM states to enable
back the ASPM.

Update ICC & OPP votes based on the requested speed so that RPMh votes
get updated based on the speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 02643579707f45fc7279023feb7dbc903e69822d..c4aa193bbdcc928603ae50e8d7029b152d62f977 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,10 +276,16 @@ struct qcom_pcie {
 	struct dentry *debugfs;
 	bool suspended;
 	bool use_pm_opp;
+	int aspm_state; /* Store ASPM state used in pre & post link speed change */
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
 
+static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
+					     struct pci_dev *pdev, int current_speed);
+static int qcom_pcie_pre_link_speed_change(struct pci_host_bridge *bridge,
+					   struct pci_dev *pdev, int current_speed);
+
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
 	gpiod_set_value_cansleep(pcie->reset, 1);
@@ -1263,6 +1269,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->pre_link_speed_change = qcom_pcie_pre_link_speed_change;
+	pp->bridge->post_link_speed_change = qcom_pcie_post_link_speed_change;
 	return 0;
 
 err_assert_reset:
@@ -1328,6 +1336,61 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
 	return ret;
 }
 
+static int qcom_pcie_scale_bw(struct dw_pcie_rp *pp, int speed)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 offset, status, width;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
+
+	return qcom_pcie_set_icc_opp(pcie, speed, width);
+}
+
+static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
+					     struct pci_dev *pdev, int current_speed)
+{
+	struct dw_pcie_rp *pp = bridge->bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct pci_dev *child;
+
+	/* Get function 0 of downstream device */
+	list_for_each_entry(child, &pdev->subordinate->devices, bus_list)
+		if (PCI_FUNC(child->devfn) == 0)
+			break;
+
+	pci_enable_link_state_locked(child, pcie->aspm_state);
+
+	qcom_pcie_scale_bw(pp, current_speed);
+}
+
+static int qcom_pcie_pre_link_speed_change(struct pci_host_bridge *bridge,
+					   struct pci_dev *pdev, int target_speed)
+{
+	struct dw_pcie_rp *pp = bridge->bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct pci_dev *child;
+
+	/* Get function 0 of downstream device */
+	list_for_each_entry(child, &pdev->subordinate->devices, bus_list)
+		if (PCI_FUNC(child->devfn) == 0)
+			break;
+	/*
+	 * QCOM controllers doesn't support link re-train with ASPM enabled.
+	 * Disable ASPM as part of pre_link_speed_change() and enable them
+	 * back as part of post_link_speed_change().
+	 */
+	pcie->aspm_state = pcie_aspm_enabled(child);
+	pci_disable_link_state_locked(child, PCIE_LINK_STATE_ALL);
+
+	return qcom_pcie_scale_bw(pp, target_speed);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,

-- 
2.34.1


