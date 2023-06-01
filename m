Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB60C7EE24
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 03:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6MBj1YfObcPc64aexkf+TNHAmuQs3O8/l/7Z3AWv6yM=; b=yo28vctfrrdON5
	wht7q2sNCBiytlkf5YgwjUEbP+IlLLqFhmbNniusRwsm7XNas0dcoqrHiHHUnLYWe/L+1QRAJvgqb
	dkz92N5FoLtMWSSdumiNUXZX5cIPO6QzZJg+lHFyaSp58PLdKinAy42xg9NHKcc8ewkNEejEoXZCc
	DV3/+UH66ddvT+DIWGeXMbHyKikygxckPRkZjCR/g8Nce0WKxoGYx7P73iuhXCRx4OdWi/U6Y6Nba
	FBBDVnT87n2hWHo2eihzT+O+jZ8XMPAeKZIztmvgP2cCaAWnBqIrIrEuE3eSDJP8vY2dWTl2cBiYT
	G2MDIFTuEiAaLbBaC9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZA1-001qBI-2J;
	Thu, 01 Jun 2023 03:39:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Z9x-001q7C-2w
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 03:39:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3513M9Hc021558;
	Thu, 1 Jun 2023 03:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=aMIxp0e1AUChi9hZtcZV76sjyrYmsthynFspu1elmM8=;
 b=PPIlJ6gNl0RHCBJCF06m3X7YNizy39f5TNEuz8i2ipe0F6U3DnOH7KLopK8qExE2qYaQ
 5LB54Phrm6BDzI1aDEWDSGCPzeBdzbcgP62zXE3PvXD1vSZLDnGfBs4WSYqx34aSMmzQ
 dJaEFONvt2jGaEynjlNEXT4QCfANN1TuPRmge192OW/0KrAiiile9XlO1s78W+VlzQD4
 /nf0bkOzY3/H4lfTz/8hG4fdXsEexoX3TRlteD9A8M9HxLUFjxsaswfZK5AkJmkxbJSc
 wp0uhwzQPqbNZUyFYObzkSswInmHytk2g9wlkxkepc2UT61qkEtEvAdgeqB8nsunjX4H hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxkbu00rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 03:38:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3513cpII026310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Jun 2023 03:38:51 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 31 May 2023 20:38:50 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
Date: Thu, 1 Jun 2023 11:38:40 +0800
Message-ID: <20230601033840.2997-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3UlFep7QibqqMsovCa6mOJSCcK8_xazS
X-Proofpoint-GUID: 3UlFep7QibqqMsovCa6mOJSCcK8_xazS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_01,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_203934_117161_FCFABBA3 
X-CRM114-Status: GOOD (  19.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
PCI common code") breaks with one MSI vector because it moves
affinity setting after IRQ request, see below log:

[ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control response completion, polling..
[ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
[ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
[ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110

The detail is, if do affinity request after IRQ activated,
which is done in request_irq(), kernel caches that request and
returns success directly. Later when a subsequent MHI interrupt is
fired, kernel will do the real affinity setting work, as a result,
changs the MSI vector. However at that time host has configured
old vector to hardware, so host never receives CE or DP interrupts.

Fix it by setting affinity before registering MHI controller
where host is, for the first time, doing IRQ request.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 5b32b6dd9663 ("ath11k: Remove core PCI references from PCI common code")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7b33731a50ee..a67576226380 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -850,10 +850,16 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_pci_disable_msi;
 
+	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
+	if (ret) {
+		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
+		goto err_pci_disable_msi;
+	}
+
 	ret = ath11k_mhi_register(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to register mhi: %d\n", ret);
-		goto err_pci_disable_msi;
+		goto err_irq_affinity_cleanup;
 	}
 
 	ret = ath11k_hal_srng_init(ab);
@@ -874,12 +880,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
-	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
-	if (ret) {
-		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
-		goto err_free_irq;
-	}
-
 	/* kernel may allocate a dummy vector before request_irq and
 	 * then allocate a real vector when request_irq is called.
 	 * So get msi_data here again to avoid spurious interrupt
@@ -888,19 +888,16 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ret = ath11k_pci_config_msi_data(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to config msi_data: %d\n", ret);
-		goto err_irq_affinity_cleanup;
+		goto err_free_irq;
 	}
 
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
-		goto err_irq_affinity_cleanup;
+		goto err_free_irq;
 	}
 	return 0;
 
-err_irq_affinity_cleanup:
-	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
-
 err_free_irq:
 	ath11k_pcic_free_irq(ab);
 
@@ -913,6 +910,9 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 err_mhi_unregister:
 	ath11k_mhi_unregister(ab_pci);
 
+err_irq_affinity_cleanup:
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 err_pci_disable_msi:
 	ath11k_pci_free_msi(ab_pci);
 

base-commit: 4ab7f08db5310ded48a5c1f3ec3f2e177ba6b1c2
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
