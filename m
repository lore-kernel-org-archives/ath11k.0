Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977EC77B7E
	for <ath11k@archiver.kernel.org>; Mon, 29 May 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WpNirRksX0pIklNw7ChVZOpykEljnDxmd/P3jsJBAU=; b=d4ZKbjzTK2DJIs
	UPOCUMlLe62pAlDxURT1grVKjRtxMaDPuTYrbXiKj1kOOE9qKgwT7lqZX6dkZC3iyb8flSU3DYDyy
	Ha6y7rHwjKJZNc6BQWID15Us921D5IKxWRchFEfVj7oPAJKh3lNl5KkPIrtWnjbozs4jXPnkdNCJp
	LrGG1Ct2mb6SAAvMhbDVCGZQHuavU4qK+QEA0WdGmWdBkldAOJez8QgrPPdEab/Ju5jAIdM4HQVpg
	wcNgf+8ojF2f8zpmZ1Z/FU4YbDClEauAL5oFw7kBE/ZCPQfCzL9nlM6QbJnDKh4Qk3gqopJfZEY8i
	cb9K86V2pLZlOHtpldWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ZtL-009zR3-2U;
	Mon, 29 May 2023 10:14:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ZtJ-009zOV-08
	for ath11k@lists.infradead.org;
	Mon, 29 May 2023 10:14:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34T9W3kq026353;
	Mon, 29 May 2023 10:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=nVy9ziG9/jlOuEGpIzjRrUTWRV8olfNMe0YV0nRzZ50=;
 b=KgiPnmLu6F/RUqA7rpiCrwGctsB3vaCOINOSYkg2vplQ/2cuV7u3QgWnwqMyWBtB68xZ
 qUvxNzuWcZguIkcOcrb1QqNOsLlpSubz4NJ85uzmBwvtVOvdzSfYwcUF6pSamVJpABJW
 dyDI7695G3clE4DyIoCeyPMtqkXZ4061cWchuwy6IGRv5y4ajBbQgmCemTS77wZADpT7
 Qzb6dimKDhhN7gnF75TRoKfgSggXfMwKMjwtqtI6Yd+CCdBafX7/6tQUnLfNkIcCya+K
 AjG8QuE/QrDFfVLu7CdrRqF/98N1c7dW8W5kodVpJ+da+Rak3W53quyy1Q0WnDGfqjew Sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3quanxb52f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 10:14:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34TAEFYS018312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 10:14:15 GMT
Received: from haric-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 29 May 2023 03:14:13 -0700
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Hari Chandrakanthan
	<quic_haric@quicinc.com>
Subject: [PATCH] wifi: ath12k: delete the timer rx_replenish_retry during rmmod
Date: Mon, 29 May 2023 15:43:58 +0530
Message-ID: <1685355238-3282-1-git-send-email-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xIQEgal8lM9wjJbT-rfUlN_qNopXIFie
X-Proofpoint-GUID: xIQEgal8lM9wjJbT-rfUlN_qNopXIFie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_06,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=797 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305290088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_031417_089666_3437B74D 
X-CRM114-Status: GOOD (  13.08  )
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

The rx_replenish_retry timer is initialized in ath12k_core_alloc() when
ath12k module is loaded.
But rx_replenish_retry timer is not deleted anywhere in the code.
It is supposed to be deleted when ath12k module is removed/unloaded.

Delete the timer rx_replenish_retry in ath12k_core_free().

Found during code review.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a89e666..d992380 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -885,6 +885,7 @@ void ath12k_core_deinit(struct ath12k_base *ab)
 
 void ath12k_core_free(struct ath12k_base *ab)
 {
+	timer_delete_sync(&ab->rx_replenish_retry);
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
 	kfree(ab);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
