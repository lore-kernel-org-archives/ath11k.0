Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E72C3DA7D
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 02:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kNALpZM9svaXMO1e9DYyrB846zTxaXfqDuEq67YnlPQ=; b=euXrtRdPK2+o60
	OaIVXruyxaYG0rKwxZWVmG9gt2NcBc2Mw+h8MeljuFKqumRlIzAKLGAXAOZqiQ+K3qOWrxOwPtFXD
	vjCp0dd7Zq27KFYgg9ABOcMpH/wMlGdKlME7qcDtKp9kDRbKuQiqmPUdvhhQ+x27ggmb/T2KTAENX
	wxFc9siIZl6DyhCyH6YCzPLntqGst/ouLGdJf+8TQZUdhJ/I8MiQzpFUzipiod+hUgFZ9YM6jXNUz
	tsUnyBXRQFjNrpTrEf2rUHXwZDA5Aqn3W4s7XbS1gmG/wjOXXZaPJJP/ypGZ5vp7kf/DM9n4FXmD7
	M3nHOCeg61cdWIxLg6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtK9-006KPO-AS; Wed, 04 Jan 2023 02:16:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtJY-006KEj-CS
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 02:15:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3040sKrK020285;
	Wed, 4 Jan 2023 02:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=hN6RbBK57yOPqsfkmxKFRunZ8afjbgtvj7w+YhUmxHw=;
 b=M2l4ps31cE4vvl332as1VQ+EgGpmgnPUpDuZqcRu/YDps6dXHDiB2dXPlNcpFAj3sJ0D
 gOuoPA6V3POe9q+WQSe6CGNU+Qmpoud9ATd15zv+UT+eRoFIZNBILYaGq6twMbv3rqJj
 axNTMm/MOzwDsLSimL98Rux/xM16Mf6zNqJvtHVnG5p7/MCD09CTGzEenBcz0CGql2vd
 eyf3zWdSNbLOF7cuUponwhMVAC3yyKECmLD0IW6Yruu8V4LSJK1zDNQeMEkSm4vhZNwp
 aQM19ANZdcxHypMH85lQdfbQ32VYExOdfoxeQXm1BvztszzCDfm6tx0/RY5AH0m4U2zE 3A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvegmj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 02:15:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3042FA7r025282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jan 2023 02:15:10 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 3 Jan 2023 18:15:08 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>
CC: <hemantk@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
Date: Wed, 4 Jan 2023 10:14:45 +0800
Message-ID: <20230104021445.47484-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aKRbxkZPlTaC0FJLiLoYp7mQ8QbDcfxj
X-Proofpoint-ORIG-GUID: aKRbxkZPlTaC0FJLiLoYp7mQ8QbDcfxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_08,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=916 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_181536_881976_4A367F8F 
X-CRM114-Status: GOOD (  16.99  )
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

Currently no log printed when SYS_ERR happens, this makes
debug quite hard, so change log level to make it noisy.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 2 +-
 drivers/bus/mhi/host/main.c | 6 +++---
 drivers/bus/mhi/host/pm.c   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 1c69feee1703..d8bceabcee63 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -102,7 +102,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 		goto error_exit_rddm;
 
 	if (ee != MHI_EE_RDDM) {
-		dev_dbg(dev, "Trigger device into RDDM mode using SYS ERR\n");
+		dev_info(dev, "Trigger device into RDDM mode using SYS ERR\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
 
 		dev_dbg(dev, "Waiting for device to enter RDDM\n");
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index df0fbfee7b78..54c948ed7f47 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -497,7 +497,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 		TO_MHI_EXEC_STR(ee), mhi_state_str(state));
 
 	if (state == MHI_STATE_SYS_ERR) {
-		dev_dbg(dev, "System error detected\n");
+		dev_err(dev, "System error detected\n");
 		pm_state = mhi_tryset_pm_state(mhi_cntrl,
 					       MHI_PM_SYS_ERR_DETECT);
 	}
@@ -871,7 +871,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			{
 				enum mhi_pm_state pm_state;
 
-				dev_dbg(dev, "System error detected\n");
+				dev_err(dev, "System error detected\n");
 				write_lock_irq(&mhi_cntrl->pm_lock);
 				pm_state = mhi_tryset_pm_state(mhi_cntrl,
 							MHI_PM_SYS_ERR_DETECT);
@@ -1085,7 +1085,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		write_lock_irq(&mhi_cntrl->pm_lock);
 		state = mhi_get_mhi_state(mhi_cntrl);
 		if (state == MHI_STATE_SYS_ERR) {
-			dev_dbg(dev, "System error detected\n");
+			dev_err(dev, "System error detected\n");
 			pm_state = mhi_tryset_pm_state(mhi_cntrl,
 						       MHI_PM_SYS_ERR_DETECT);
 		}
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 083459028a4b..570fdd4db442 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1223,7 +1223,7 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
 	if (mhi_cntrl->ee == MHI_EE_RDDM)
 		return 0;
 
-	dev_dbg(dev, "Triggering SYS_ERR to force RDDM state\n");
+	dev_info(dev, "Triggering SYS_ERR to force RDDM state\n");
 	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
 
 	/* Wait for RDDM event */
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
