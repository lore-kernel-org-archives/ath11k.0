Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE86C7EE23
	for <ath11k@archiver.kernel.org>; Wed,  7 Jun 2023 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxqejKmcEwoSGS6gYsCGheFgZnfC9tdots5dP71+QIs=; b=z3nh6mhaLUT7C3
	YxQvixdoNd4Rj16XPyzLznp0fVW8kY9Z8lNwsEQxzo11hy4WucsNnZNJoPotE3XozKsc3Z+xe7APP
	xxe1/Vji0cNGwuNgjRsGzZSvEx29y4CZjuTRPZbtUAToj24j/YQbZ3wDM/6A/T3qUoNxMepCKNT5C
	9CUopFvEUVE17TkawprMZP/gL4SAnCWf9QW6xJsaXtYBhCw/8S4eN7/7rTR8Hek00abj5WE39BbfG
	9kfHAwHXv4fmwIJ2VGR0M5nzoqAOqnEjyf+P6IntOR6X3H4wX3CYHtj03KEQap60Oe6+W7vS3d6Gs
	TZg3gULlJaZNCcEp/wOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tX7-0068sS-1y;
	Wed, 07 Jun 2023 13:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tX6-0068qz-12
	for ath11k@bombadil.infradead.org;
	Wed, 07 Jun 2023 13:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H0ijGqhLhH5gW3vSAhIBrdHc9At3Gf0qWB7slmkZOzg=; b=P5pdsNfL59Pk2GBExlrqM1/jRv
	1lTg+jtjNxBVAft11e3xr8YBAv4UmqkBHvpmiUmPo8p5EW28SNjvAdBpI04B4LipJ4Jj9SLrfBXa8
	ZAodmSjgLAosVxlqdRD0g1vpdKguxyip/cdwiAQtsDiGJrCUGfmoTnHHNadsKvOhWh2Zl4GYGbRnr
	zZYJOq6VgZ9ChskqDQ+BFUpl+AHtRzSZTfWyToyAX7ULATMRQnm4loxgvw7zeLnU+aKVd6vP4FExs
	cJlKBNcP9zwbxgVo0natYbHpbPbzleFbOJcew92FgkGiwGQ+4oSev/sh3X1f0ZMZWRWOeJ8ZlNqT0
	kRPEzS9Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sZG-0059QX-1k
	for ath11k@lists.infradead.org;
	Wed, 07 Jun 2023 12:47:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357BfVik021976;
	Wed, 7 Jun 2023 12:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=H0ijGqhLhH5gW3vSAhIBrdHc9At3Gf0qWB7slmkZOzg=;
 b=BPCSrSp9wWkW5dSJuMEOtIKaS+vBt9wp9YCnK/rug1LeMNaThtKlpZzacz4hLGF23PLx
 E+5LJ4NWFMzcgYtn4vwImVnvUV519VrN5xf/vHSDI52EW9nxEFm67x5WLHotp0ihc+NA
 QC42Xg5MEFPLfbv9dR4BoVqAx7lUcRXvW40Byruxurv8BAZMqyfRvS8d6DTnNxaecEUb
 qb13I6ZraIk/CM3TMwybdoGvcncKdr0i7/XMvheLzqjo4LLLnGk/n3OymmDZpOgjc+ef
 IaORi1owcLK6FbpPNvsUUGdnt3b4UDMDb/ZHep9AC4YNOMhKXwWhRA4wXlNm6r6+T5Gz mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2rbtg7b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 12:47:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 357Cl9hE011504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Jun 2023 12:47:09 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 7 Jun 2023 05:47:07 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Aditya
 Kumar Singh" <quic_adisi@quicinc.com>
Subject: [PATCH 3/3] wifi: ath11k: fix Tx power value during active CAC
Date: Wed, 7 Jun 2023 18:16:47 +0530
Message-ID: <20230607124647.27682-4-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230607124647.27682-1-quic_adisi@quicinc.com>
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LNR44IuoPjRitceWiXkf9jFLKuFCFH2t
X-Proofpoint-ORIG-GUID: LNR44IuoPjRitceWiXkf9jFLKuFCFH2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_134714_851340_4FC84A9E 
X-CRM114-Status: GOOD (  16.53  )
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

Tx power is fetched from firmware's pdev stats. However, during active
CAC, firmware does not fill the current Tx power and sends the max
initialised value filled during firmware init. If host sends this power
to user space, this is wrong since in certain situations, the Tx power
could be greater than the max allowed by the regulatory. Hence, host
should not be fetching the Tx power during an active CAC.

Fix this issue by returning Tx power as 0 during active CAC since it
is known that during CAC, there will be no transmission happening.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: 9a2aa68afe3d ("wifi: ath11k: add get_txpower mac ops")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 31982545266b..9707910928b4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9045,6 +9045,14 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	if (ar->state != ATH11K_STATE_ON)
 		goto err_fallback;
 
+	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
+	 * the stats.
+	 */
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		mutex_unlock(&ar->conf_mutex);
+		return -EAGAIN;
+	}
+
 	req_param.pdev_id = ar->pdev->pdev_id;
 	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
