Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69DEE14A9
	for <ath11k@archiver.kernel.org>; Thu,  7 Sep 2023 01:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGOaCA3UapWmlu36A3ZmLnq/sRfeOIn9hf+N9D4G94o=; b=VRGN6fBh0f9VUm
	D5MLFTFXtkkPGTW9za3+YQ8n8k+/EM/dDgTrf6XsUoLHrleRgxobdN6pmaP4D4BsGQn6/zt57Nik5
	QzVd5OeyE8Q8ZkvqeefL2eFq5Lh+b42fH4JhAeK6ZoGhg/KIsXBjU7nTcPBtdrczxmgfZEiFswry7
	tm3l8Mr0Y1tA8TfOrm6t3eE2lOsCcwR6oDaPqje7qu8z4mi8MFfoYuA+2Yoijl0ZJkkFj42+qED4S
	waIuiwKHE5WPyB9BR6uwEXoEcn8/yVAg/lA733THmi66tsw4k0c9jCJXRMQzVSdHi6bSSarElahRg
	ftvuU7IHmnuM4CePANDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4Fr-00BACm-1K;
	Thu, 07 Sep 2023 01:56:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4Fo-00BACA-0u
	for ath11k@lists.infradead.org;
	Thu, 07 Sep 2023 01:56:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386NYwF8007158;
	Thu, 7 Sep 2023 01:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RJP7sRlnxb2SFlpM05EhfW+ZbCG06bALmeEJ8wtWppw=;
 b=XmPlEFlLP9YIr0QGU2wCK8yHanNE80o4frhS1sgcxXUdXQ8sHSSz89/NSnH+Qv4R7RVF
 W9ooSxAYSf/F6ITu6VlNhpK2wXPBf16/+KM/VCHkZNcKD6Mjp+RrytlHVLda+v9VmJRD
 h1fv7PnCtH/Bn8HS9gVt6sap++nsdN4sfZgYpjZgWrfYtFwmbqtkIgEGybAMmDTg1Mdi
 R8/tcR98zXAZOU4khjji/fQsMBux7Ew40nYhKDE6dfY4FeQikQWS6xkvMxit6GnGs5kC
 DZKA1pk5pT97fNxd3wfK44tvnUYm8v5w7NNBE7WlsptdOSVqOkOmreCEqlb/IndeW1Wu rA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxhbhk2me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 01:56:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3871uGPN012680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Sep 2023 01:56:16 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 18:56:15 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] wifi: ath11k: fix boot failure with one MSI vector
Date: Thu, 7 Sep 2023 09:56:06 +0800
Message-ID: <20230907015606.16297-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H7l9WQpHy7zAL3kK2yJvQAdIKpeEWfYN
X-Proofpoint-ORIG-GUID: H7l9WQpHy7zAL3kK2yJvQAdIKpeEWfYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_185620_365339_91A96DCC 
X-CRM114-Status: GOOD (  19.59  )
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
v2:
 rebase on latest ath.git due to v1 apply failure.

 drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 9573bd959cac..aa049593f9b5 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -852,10 +852,16 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
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
@@ -876,12 +882,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
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
@@ -890,20 +890,17 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
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
 	ath11k_qmi_fwreset_from_cold_boot(ab);
 	return 0;
 
-err_irq_affinity_cleanup:
-	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
-
 err_free_irq:
 	ath11k_pcic_free_irq(ab);
 
@@ -916,6 +913,9 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 err_mhi_unregister:
 	ath11k_mhi_unregister(ab_pci);
 
+err_irq_affinity_cleanup:
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 err_pci_disable_msi:
 	ath11k_pci_free_msi(ab_pci);
 

base-commit: 0263687f4441d5a5eab8074d56b4693c8f0acf85
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
