Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C4C48BC4
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 02:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6gJzHioBJRwCmu0esn2YqKsWJnJrcVj7kqyNEMDwaE=; b=BGbi6EO3MvM+5PajI/nhMNzDfY
	8Ly8bsTSmLvKUo4m1e6ZHMJu1nsTfCZLnqHo9qIiV6hkK7V4Y9qEVzMZPsLVaqb8q5tOPIJk3W7V8
	NBojA2xPEgF8KfeEqJKEMQ1NjmR2qIFJarQAdfTWWdYxQq1c1SWz3mmbK+qmvUmCrW/4c/V3ejbni
	mFlrmRwUrCtiYBpGAgijEzbzWj/R94qIv3yHCyW5KjoqnpUY8M3oEYK2z2cu3A5YketMjRZEYXM9B
	htH6TfGCzu25gZ4jpRlFR1Y02VgYEFkZo3vU+uxcqrKa9IIf0OpePNAVvEVzOO1hoE/g9+0Iuwh5r
	qWw/gTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcceB-0000000Gupj-1zMM;
	Wed, 21 Feb 2024 02:47:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcce8-0000000GuoD-3CzJ
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 02:47:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L2TE5H032555;
	Wed, 21 Feb 2024 02:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=o6gJzHioBJRwCmu0esn2YqKsWJnJrcVj7kqyNEMDwaE=; b=G6
	4mmN6i3V2HvOjz7D9IyiwqHvhkYQPYLRfwxs/mSf+B81gowzRy/pxeM+aHhnCion
	8g7rk/H4KdVPJ2XURg9q9gxvy6sqHljofcMoEi9Ewmz60HKvUqooB8gDgHr9sxBK
	tvzlC1pv+bqRSFG03HKj8JyH55SqJhup8kD4bzFf+Am2o2xAgaCBYDm1LcjGQTEo
	5hK1cIZ59VAjzS/RurYhq1Bp/E6ozUktZac17p36uobMVf8IdZtI1GUViBzGzoez
	wjWKJxwRd4dUByJ1jbU+j8ZrUUSlzHIxNkdkFnZBxGZ+8Lv+hLKmBzGJNkvKubJz
	Sfms57XhXRZEItoRt3zg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd230rrkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41L2lgYL009053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:42 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 20 Feb 2024 18:47:41 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 2/5] wifi: ath11k: remove MHI LOOPBACK channels
Date: Wed, 21 Feb 2024 10:47:22 +0800
Message-ID: <20240221024725.10057-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221024725.10057-1-quic_bqiang@quicinc.com>
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NZzo9Rb5PsQ4OJR2XtA8_X-lQVDwp9wD
X-Proofpoint-GUID: NZzo9Rb5PsQ4OJR2XtA8_X-lQVDwp9wD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=852
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_184744_958950_418AFD55 
X-CRM114-Status: GOOD (  11.83  )
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

There is no driver to match these two channels, so
remove them. This fixes warnings from MHI subsystem during suspend:

mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 56 ---------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index b53659145fcf..3de7fa6f88d0 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -21,34 +21,6 @@
 #define RDDM_DUMP_SIZE	0x420000
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
-	{
-		.num = 0,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 1,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 0,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
 	{
 		.num = 20,
 		.name = "IPCR",
@@ -114,34 +86,6 @@ static struct mhi_controller_config ath11k_mhi_config_qca6390 = {
 };
 
 static struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
-	{
-		.num = 0,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x14,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 1,
-		.name = "LOOPBACK",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x14,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
 	{
 		.num = 20,
 		.name = "IPCR",
-- 
2.25.1


