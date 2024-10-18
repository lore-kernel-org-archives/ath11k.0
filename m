Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D0D2FFEC
	for <ath11k@archiver.kernel.org>; Fri, 18 Oct 2024 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mhCSdLki5ucZFmOT4Be6yQk4SMPL7p3Nk63dhKclx1I=; b=BF9vImHpYLnXOUQyBGgK4HFGYj
	tqFtIGsm90GsC2dH2fePTeLzKjTZg9TxfvygNcwzOznA6YOly6dldIQFchiUYgBSDobV4eyflThqg
	lLi66ojy1LY5e2YqXdkFJ6Ro+jx5iBm2CTLAv8JZ6fuQKAlMk7iwv99pXR3D/LejFlOuaFxT970HG
	5qGncBsZ3oogVqw62XzxFVD2u9EmAu6WCwYKASsRu7C93krMIE7eRecvwytIqah6T3gMrhrz4frLN
	M1+KMve1y0Bs/nv0624kyRSKbCqpPPs7kUXmbr3Ha6AFE8qKBcD16L+s34Clg6iltGOfO9br2Erhd
	d3mRDZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1kho-00000000Smj-0RNv;
	Fri, 18 Oct 2024 10:59:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1khk-00000000SkY-0jQp
	for ath11k@lists.infradead.org;
	Fri, 18 Oct 2024 10:59:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I33Xf1007760;
	Fri, 18 Oct 2024 10:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mhCSdLki5ucZFmOT4Be6yQk4SMPL7p3Nk63
	dhKclx1I=; b=AZac7GHZ5qs5m9LskqNb8uMa1EniRbzHMyukY6iEMaGHo+yDkar
	fA13UkXFakBlNgIS267pVeTKkbq0xIl3XqH3QSDBAVGwOy1kbgeKXovm3Xg8g5kY
	gB3eYi+kJZ5bzHj+4W82Y0M/1q2F4evHjMTQv1fFWMy1/YD8LrqZu6alK0BeK1IL
	OP4ElDBDIU/+G4yIaxN0OT63Rm7eb4SIJsxXMO3R/FKpmIsmGiLeZ6LDLm9C1bQz
	mK4iaoD9Mqc0uL1Jg3mDoGMe9p5lvMBvyp4f4nCgUXAiXV0BOOOifACtq/jc2xcg
	r5J8QE2a3luahrUirbKc7W7Geq33s0Bxoww==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc4w1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAxR01001938;
	Fri, 18 Oct 2024 10:59:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6mr178-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49IAxQ7Z001933;
	Fri, 18 Oct 2024 10:59:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49IAxQrJ001931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:59:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id B776F509; Fri, 18 Oct 2024 16:29:25 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        kvalo@kernel.org, Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Date: Fri, 18 Oct 2024 16:29:11 +0530
Message-Id: <20241018105911.165415-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nojQCBI8kMDn8Wbtci0ST9Ocdx1nlO0v
X-Proofpoint-ORIG-GUID: nojQCBI8kMDn8Wbtci0ST9Ocdx1nlO0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_035936_374674_F0DB3530 
X-CRM114-Status: GOOD (  11.76  )
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

Currently, the rproc "atomic_t power" variable is incremented during:
a. WPSS rproc auto boot.
b. AHB power on for ath11k.

During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails
to unload the WPSS firmware because the rproc->power value is '2',
causing the atomic_dec_and_test(&rproc->power) condition to fail.

Consequently, during AHB power on (insmod ath11k_ahb.ko),
QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI
states being out of sync.

Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
Cc: stable@vger.kernel.org
Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
v2: updated commit text.
    added Fixes/cc:stable tags.

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


