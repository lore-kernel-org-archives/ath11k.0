Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC45D1AD5E
	for <ath11k@archiver.kernel.org>; Wed, 16 Oct 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3PlT2PvVcsTyb0hBqZtBOw6xm3CoyCRYJqybxaeJp9o=; b=i/zlUt6DmtBzvdzJBiXnIkA0IZ
	dxra9oK66F2/ANRjJMjiG1MWjFyqf1g+bOpOHnugyESGgcYWILQdSJrZYvrBXhRwpZ6aXWAW+vg1d
	o5M30HMgOyAcbdR0/xPj+0SBCNBX8xAUPH8oN6Kdm8oiW8IatvJdzJhBaEhBOK+3Ff/jhfxbJ1+cT
	jaad9CPMG47U5XORxTmAVdtRwappLRTM32sJhnzpqpNbssAouxvoSxs14JB9/dUi3UvcMM6T3wJ3U
	ZROw+NDAZqIaKnfPTt6a8dpuK6/uBvQI2oUoPe2otxlHwT88j4HiG0ETCAv1vb22Zbu4Om/VvXAoW
	98MuvKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14UM-0000000C0Cn-44H3;
	Wed, 16 Oct 2024 13:54:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14UJ-0000000C0C6-2oH9
	for ath11k@lists.infradead.org;
	Wed, 16 Oct 2024 13:54:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q88m026699;
	Wed, 16 Oct 2024 13:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3PlT2PvVcsTyb0hBqZtBOw6xm3CoyCRYJqy
	bxaeJp9o=; b=ZNz30qwTMP6iidvOVN/UrCwPaomfV2zNgz4+EZNh2tGuBPmytYE
	u3eq3ZWIlZT/X/neJDIqcBhxwxD20co8/bRPtDscx43LwE/LznEQmAGuLuSHLuyp
	8WFa64HgZ67qsbziQWAs6eVqL/Go048ZsxDAYBBhpVGjP3RlrN+43oCd4R9bJ6JD
	n/UuiPYAeoilZbWrq7IxF3z+iFpuCx+/mWxb9dtFVi63KjxtPGWaTT0639XdMSCc
	J6IdyJUFV1z8Mu0FZ1NZCh0pYjQ35p7neWvK07amgWRuWtbvGmu7ngjpot0osKUE
	nuvuuuMRx8IJI6fzyk3G7Ik/8CZmmUIXc4g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6hb8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDskmF004651;
	Wed, 16 Oct 2024 13:54:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6m6fag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GDskcq004645;
	Wed, 16 Oct 2024 13:54:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49GDsjfN004643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 13:54:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id EB40D509; Wed, 16 Oct 2024 19:24:44 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Date: Wed, 16 Oct 2024 19:24:09 +0530
Message-Id: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bit6GI6rfTYYby7TsLjDRI24SYbGOIn-
X-Proofpoint-ORIG-GUID: Bit6GI6rfTYYby7TsLjDRI24SYbGOIn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_065455_747532_39071E0F 
X-CRM114-Status: GOOD (  12.71  )
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

auto_boot flag ensures to take the firmware and boots it
up during the wpss remoteproc start.
wpss host driver would like to control the load and unload
of the firmware during the load and unload of the driver.
Hence, disable the "auto boot" for wpss.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..05963d7924df 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1344,7 +1344,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
-	.auto_boot = true,
+	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mx",
-- 
2.34.1


