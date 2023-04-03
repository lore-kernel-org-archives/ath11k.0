Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F99AC76196
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCX+ZUwj1vyIu1ap7DSxdORMGlffVs5gt/54OLRBS+I=; b=grqIxgeHVyp4gF
	bk4qBqdgbPOZia7Z2r0zgMXZaPuzpASTdcqsI9KP7qEItW80Uj/+paZrdB9Ulfiz0lqhEiXg2Jhyc
	7+TTgRv0LGio0S3ubLw3SU9sO5h4iJKmCFOSzMkIkglOcEr7tH+tMHIhKXvT/J2Wjx4bo/RCJIQKd
	wVsRulTtJzLUySdZRjlV9CgZ5wHsmW/0oZ3CAn34yQArsaFmpZcuNgvpe4vycLnrrDYtPUyWoXhLd
	9Nobr9oH/NmRarzhKkgwGYdtvevo4lqnaRn17XKPZJfBY1vF2g3ZjiJC8ZZ4zCh3cixDok72mOxEc
	Pb5Dqo5JjZGmI66XKIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr1-00GBpT-25;
	Mon, 03 Apr 2023 18:24:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOr0-00GBoK-0G
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 18:24:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333BljHN014926;
	Mon, 3 Apr 2023 18:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=A5APZ+Xhfly3fRRj86i2YSPpoV7OZRDxHqxy76ekAzY=;
 b=fJ/5zIxgoocay255V1HxSVLmyr+hBQoHb2oVqVqr0QAyCe3IRqEDzY9nw8zZ9Ttn8K5Y
 dsHJFvgscSoHuJqRR83hL62EhG3TjsAWUCYuLyrqVJkhS0rsUjIqfyGvkUoQ1q9PEm5R
 cVT9irgpxnyI37aN5DhdnOFZSR+0d8C9T8z9x7sOI0Evg4KbTRjrPVUd3VSb5Pn9FxpB
 VGRncXXrCj9rnwqYrZ5MipHMWk6i5bjQzPZYcYOfhc3e5kERdpTFd1vXD97EuVUHseB/
 i7HzPo98UqLzp+ZUqnYahXiqzY82BIn7BEHNZcVqD8hj53T1Sd+hlOEZFUuIEg6VOPd6 jw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqw36s5ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 18:24:29 +0000
Received: from pps.filterd (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 333ILFSw029565;
	Mon, 3 Apr 2023 18:24:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3pr09uajn4-1;
	Mon, 03 Apr 2023 18:24:28 +0000
Received: from NASANPPMTA04.qualcomm.com (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333INHIm000475;
	Mon, 3 Apr 2023 18:24:28 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 333IORl4002480;
	Mon, 03 Apr 2023 18:24:28 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 7F31BB003D4; Mon,  3 Apr 2023 23:54:26 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Subject: [PATCH 2/3] wifi: ath11k: Prevent REO cmd failures
Date: Mon,  3 Apr 2023 23:54:19 +0530
Message-Id: <20230403182420.23375-3-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230403182420.23375-1-quic_hprem@quicinc.com>
References: <20230403182420.23375-1-quic_hprem@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B8wiHBQVMUedvF4CQjAUXXtk27yEkRw3
X-Proofpoint-GUID: B8wiHBQVMUedvF4CQjAUXXtk27yEkRw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_112430_144020_74FEBBDE 
X-CRM114-Status: GOOD (  14.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Prevent REO cmd failures causing double free by increasing REO cmd
ring size and moving REO status ring mask to IRQ group 3 from group
0 to separate from tx completion ring on IRQ group 0 which may delay
reo status processing.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp.h | 2 +-
 drivers/net/wireless/ath/ath11k/hw.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index be9eafc872b3..6022e27ba91d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -214,7 +214,7 @@ struct ath11k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE		1024
 #define DP_REO_EXCEPTION_RING_SIZE	128
-#define DP_REO_CMD_RING_SIZE		128
+#define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
 #define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 60ac215e0678..9a12cc955fa1 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1224,6 +1224,7 @@ const struct ath11k_hw_ring_mask ath11k_hw_ring_mask_ipq8074 = {
 		ATH11K_RX_WBM_REL_RING_MASK_0,
 	},
 	.reo_status = {
+		0, 0, 0,
 		ATH11K_REO_STATUS_RING_MASK_0,
 	},
 	.rxdma2host = {
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
