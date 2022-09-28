Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B0C04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ebqkJA2I/s50xu6wFAQ5VwOW+eYdVWmKMU3KSwVkHY=; b=PBpUAMWkeJ6iBG
	rkJrlI6/s9WwM8JP87LAoVG1MF44PnGCKoRE5s9zuEHcGf5rMuJpuezSEg98mbLB8MD7nissSly3i
	M/sKf6z7vPu9uBb/sg4e60UeVUHMWOB3anNEDbIO7ZeobvSjCTTJpeZUFDhtyuDFjfRhEX8O181Bg
	qWEgOLvC5afp9oj992nNaxWw9SV4Kgcc2and0Rd7JCIhIKecdxB/G27q+FpGZRuNlNFxmtMX5xkIm
	SPjVAscJ93JheeCZbCeMa4IkzSWSWL2IaLCG2ekh66gADXAGU7nCnHcSuPfJ4gybzSK8gRd2/5qrM
	EvBjnhbEZ/CHnJW6J0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDp-00EpqW-PG; Wed, 28 Sep 2022 08:15:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDF-00Ep98-8M
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 08:14:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5Y5OY029030;
	Wed, 28 Sep 2022 08:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=CxAohSPYOCh2XaboYoY/2SkjjhppvjA5sdowS2JM7FQ=;
 b=Tc70uR4vC8TjWhmYXlB76zNpiI5wcKyb9zRB27CmE/7RFHBEJVFY9Hq5tY4CJs2UCwhT
 Y8ko2wqncehobJ5+7SEgisPXCKnsGIUbbCVSzifIDo/3en/1h2ldvYJcX9T3WAUwdH81
 JU20yVc5zbSg6vFGECuG9TmY2oVmTA1F7ewv50xqh/927id75ljH7jhCptEgz+1rVmEu
 fqt43h9AlY2Yov6w1bPxDDvm1E4m3QZGaomqipASHTZRAd4NZDfaQB+hQGtTDuL7IY73
 UGEKB8TKAS7nsz72E9NNo0eR6NcS2iWrTL7bXyLWyDK+cCI4zG21xm6cx1d6FdrwIhdt gw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jva41hfgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S8EY7f022990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:34 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 01:14:33 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second
Date: Wed, 28 Sep 2022 04:14:13 -0400
Message-ID: <20220928081413.27339-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220928081413.27339-1-quic_wgong@quicinc.com>
References: <20220928081413.27339-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Fz8g7f98SY7ta85Me99YqVtcyAnDAQ0
X-Proofpoint-ORIG-GUID: 1Fz8g7f98SY7ta85Me99YqVtcyAnDAQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011437_332749_97BE4B09 
X-CRM114-Status: GOOD (  18.55  )
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

For 11d scan, commit 9dcf6808b253 ("ath11k: add 11d scan offload support")
increased the timeout from one second to max 10 seconds when 11d scan
offload enabled and 6 GHz enabled, it is reasonable for the commit, it
is because the first 11d scan request is sent to firmware before the
first hw scan request after wlan load, then the hw scan started event
will reported from firmware after the 11d scan finished, it needs about
6 seconds when 6 GHz enabled, so increased it from one second to 10
seconds in the commit to avoid timed out for hw scan started. Then
another commit 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan
and hw scan while add interface") change the sequence of the first 11d
scan and hw scan, then ath11k will receive the hw scan started event
from firmware immediately for the first hw scan, thus ath11k does not
need set the timeout value to max 10 seconds again, and this is to set
the timeout value back from 10 seconds to 1 second.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b0c3cf258d12..c2a0fb099a0b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3560,7 +3560,6 @@ static int ath11k_start_scan(struct ath11k *ar,
 			     struct scan_req_params *arg)
 {
 	int ret;
-	unsigned long timeout = 1 * HZ;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -3571,14 +3570,7 @@ static int ath11k_start_scan(struct ath11k *ar,
 	if (ret)
 		return ret;
 
-	if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ar->ab->wmi_ab.svc_map)) {
-		timeout = 5 * HZ;
-
-		if (ar->supports_6ghz)
-			timeout += 5 * HZ;
-	}
-
-	ret = wait_for_completion_timeout(&ar->scan.started, timeout);
+	ret = wait_for_completion_timeout(&ar->scan.started, 1 * HZ);
 	if (ret == 0) {
 		ret = ath11k_scan_stop(ar);
 		if (ret)
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
