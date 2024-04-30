Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A1CC4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N+KEWOlYNdnDE15usheC2AQQq2OILk3vqXwsDWUnv4=; b=xXmfB/yHZ2bzNgvO0Z23qk/8QC
	nqKKF+SZglHIr5hZSCNfh8JuxxgcjCAzbiR0hQAXXKviZGZGf9wmSsiiqZ0SG1zwEiNixnCNa5Q3Z
	T7pUH4+GcSe0ygAlqR1x7VIOU0ZtMAdkA2y80RVLd2G6Ol0jEUCnG5CmPjro9X55umi0dfSJnqee2
	/+rQ1An3OCZyxkI0Iu7+XLSD76fxzs+ZYt0K18Ek0WPo3C+VIYK6JGT4hSV8LmKxYDuS+ksLKB2DG
	YULKJmAQK3UJXBw/mRenBwfPH6Kfrx1+VbGiFBoyj6LjvQI9Yq8H7ifH7gFHhc+Qz0BJ2ntrG18GD
	167cT3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nZA-00000006XYq-2wPJ;
	Tue, 30 Apr 2024 13:30:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nZ7-00000006XWD-2HOa
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:30:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UD8u6K013161;
	Tue, 30 Apr 2024 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=/N+KEWOlYNdnDE15usheC2AQQq2OILk3vqXwsDWUnv4
	=; b=I8Bm+oH5dtp1koo6b2FXCmIbB5qcidZZK5YxfJKzFaaPhgphQvIJyZbpLjY
	VG3ygfy/F/8hPI6ztrDs7PWpvDRESJeH0Hh0gDbyHGeNJlZWurJdJjGY/xdzQrMD
	YZIVVdQpWSU6C4kvh27eOMU2I36zMMagrN5bYeNddQCOpoU3eOQp2Pf2kCK1hQjH
	g3qr4Hkq+0vLPYinOJ1FV7hV0EhLOfHbDZ+4ejlbPk80uD4Vp9wxUyvs4CVkw0OG
	puCRk3djQnliGliYY3Hu6FwPOKFQLJSfQtjaopURNiyrn6vPCHkQw1oatPt3KFbX
	feYDJW78Livd+MXEdA/riOazclg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xu199018v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UDURXY021835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:27 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 06:30:27 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 30 Apr 2024 06:30:20 -0700
Subject: [PATCH 1/2] wifi: ath11k: refactor CE remap & unmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240430-ce-unmap-v1-1-e468328f95d9@quicinc.com>
References: <20240430-ce-unmap-v1-0-e468328f95d9@quicinc.com>
In-Reply-To: <20240430-ce-unmap-v1-0-e468328f95d9@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZUXB3rjOkBNFDaSdMamiSZyKj7rHutcr
X-Proofpoint-GUID: ZUXB3rjOkBNFDaSdMamiSZyKj7rHutcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_07,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_063037_781579_8A2EAE38 
X-CRM114-Status: GOOD (  18.56  )
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

Currently the logic that handles hw_params->ce_remap is inline code,
both for doing the remap and the unmap. An upcoming change needs to do
the unmap in a second place, so refactor the unmap logic into a
separate function. And although it is only called from one place,
refactor the remap logic as well to have functional symmetry.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 52 +++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 60b4c2800a33..aa62ed710090 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -949,6 +949,36 @@ static int ath11k_ahb_setup_msa_resources(struct ath11k_base *ab)
 	return 0;
 }
 
+static int ath11k_ahb_ce_remap(struct ath11k_base *ab)
+{
+	const struct ce_remap *ce_remap = ab->hw_params.ce_remap;
+	struct platform_device *pdev = ab->pdev;
+
+	if (!ce_remap) {
+		/* no separate CE register space */
+		ab->mem_ce = ab->mem;
+		return 0;
+	}
+
+	/* ce register space is moved out of wcss unlike ipq8074 or ipq6018
+	 * and the space is not contiguous, hence remapping the CE registers
+	 * to a new space for accessing them.
+	 */
+	ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
+	if (!ab->mem_ce) {
+		dev_err(&pdev->dev, "ce ioremap error\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void ath11k_ahb_ce_unmap(struct ath11k_base *ab)
+{
+	if (ab->hw_params.ce_remap)
+		iounmap(ab->mem_ce);
+}
+
 static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
 {
 	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
@@ -1141,21 +1171,9 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_core_free;
 
-	ab->mem_ce = ab->mem;
-
-	if (ab->hw_params.ce_remap) {
-		const struct ce_remap *ce_remap = ab->hw_params.ce_remap;
-		/* ce register space is moved out of wcss unlike ipq8074 or ipq6018
-		 * and the space is not contiguous, hence remapping the CE registers
-		 * to a new space for accessing them.
-		 */
-		ab->mem_ce = ioremap(ce_remap->base, ce_remap->size);
-		if (!ab->mem_ce) {
-			dev_err(&pdev->dev, "ce ioremap error\n");
-			ret = -ENOMEM;
-			goto err_core_free;
-		}
-	}
+	ret = ath11k_ahb_ce_remap(ab);
+	if (ret)
+		goto err_core_free;
 
 	ret = ath11k_ahb_fw_resources_init(ab);
 	if (ret)
@@ -1243,9 +1261,7 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 	ath11k_ahb_release_smp2p_handle(ab);
 	ath11k_ahb_fw_resource_deinit(ab);
 	ath11k_ce_free_pipes(ab);
-
-	if (ab->hw_params.ce_remap)
-		iounmap(ab->mem_ce);
+	ath11k_ahb_ce_unmap(ab);
 
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);

-- 
2.42.0


