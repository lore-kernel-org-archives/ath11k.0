Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D30C48BF6
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 02:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3vSBlEzkaGHFGN34YgOwaijg7xlCZ270ALmHFqkhwQ=; b=cvtk0KjoMDmQeNXrJW3EeIZ2YD
	6UFs1gvcLbXIj6JlhUWEKm7FVXunDPBk/HYpiptK1ciWSsE8Qx+wh/XELTk4CWkNBMtwdc+X8SrdG
	taGv9vtzIVwOEanYG4tJTe5GnEsainSWC4IZ/qfBVlcwJme3pyeErJHSO+Ki6RJMRx6zMljU6VCVy
	v7ds7hgaffR0HfWt6E9MifFVRmjXN5IbYKyR7D5nlALcaIGiJBihsq0OxfKqLpSxEKT9ZhRwjCKdU
	ZRTIOu6KSXXovqapCImYCHvP4l/0GG/gwLAuH3IoF1KgTHRGaGrUJa4oqznMx2K44KXYMwhQKtREk
	3AvLX3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxsP-00000007I6t-41sm;
	Mon, 04 Mar 2024 02:16:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxsN-00000007I5n-1a9w
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 02:16:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4242AiX1011320;
	Mon, 4 Mar 2024 02:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=T3vSBlEzkaGHFGN34YgOwaijg7xlCZ270ALmHFqkhwQ=; b=g+
	XtzxXse9x/0DjUuoSHAC0PLiMHm+7z27fguW1BAsWmmKClqlm4Lstqp9m9rs6PWs
	GC2SZ+kOgpJeCzsZBB4sm1ENOP2j0XUIT5vNYcPSM8bs0woZdsk8P/y/FpsxwAcS
	psMnf7GSNgHnHBpz5hIvABq3m8JI1hH5sZryLk6paonsC80vKdjU8GGeos/wH4cv
	kDKVitGjt/kcNZtVa5xeNbR4dXOre1NlioVd2eFZtataZt45+Ki7Gvk3A5X3DcZH
	WR0KEhYPQnbNMdu68H4ccorVsp9t2mo5E8kcrLxiP1jKHYkDd6szVY9a+SCEsxYu
	uAUOBEYMF0e3M9cOcMLA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wkstk2kcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 02:16:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4242GHVp007333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Mar 2024 02:16:17 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 3 Mar 2024 18:16:14 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <quic_bqiang@quicinc.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <netdev@vger.kernel.org>
Subject: [PATCH v5 2/3] net: qrtr: support suspend/hibernation
Date: Mon, 4 Mar 2024 10:15:53 +0800
Message-ID: <20240304021554.77782-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304021554.77782-1-quic_bqiang@quicinc.com>
References: <20240304021554.77782-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5U8wzw4LXnIByksUqnJudWwj1afTTa7I
X-Proofpoint-ORIG-GUID: 5U8wzw4LXnIByksUqnJudWwj1afTTa7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_01,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=981
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_181623_563942_79B1DBEE 
X-CRM114-Status: GOOD (  16.81  )
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

MHI devices may not be destroyed during suspend/hibernation, so need
to unprepare/prepare MHI channels throughout the transition, this is
done by adding suspend/resume callbacks.

The suspend callback is called in the late suspend stage, this means
MHI channels are still alive at suspend stage, and that makes it
possible for an MHI controller driver to communicate with others over
those channels at suspend stage. While the resume callback is called
in the early resume stage, for a similar reason.

Also note that we won't do unprepare/prepare when MHI device is in
suspend state because it's pointless if MHI is only meant to go through
a suspend/resume transition, instead of a complete power cycle.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 net/qrtr/mhi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 9ced13c0627a..69f53625a049 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -118,6 +118,51 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
 };
 MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
 
+static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
+{
+	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	enum mhi_state state;
+
+	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
+	/*
+	 * If the device is in suspend state, then no need for the
+	 * client driver to unprepare the channels.
+	 */
+	if (state == MHI_STATE_M3)
+		return 0;
+
+	mhi_unprepare_from_transfer(mhi_dev);
+
+	return 0;
+}
+
+static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
+{
+	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	enum mhi_state state;
+	int rc;
+
+	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
+	/*
+	 * If the device is in suspend state, we won't unprepare channels
+	 * in suspend callback, therefore no need to prepare channels when
+	 * resume.
+	 */
+	if (state == MHI_STATE_M3)
+		return 0;
+
+	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
+	if (rc)
+		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
+
+	return rc;
+}
+
+static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
+				     qcom_mhi_qrtr_pm_resume_early)
+};
+
 static struct mhi_driver qcom_mhi_qrtr_driver = {
 	.probe = qcom_mhi_qrtr_probe,
 	.remove = qcom_mhi_qrtr_remove,
@@ -126,6 +171,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
 	.id_table = qcom_mhi_qrtr_id_table,
 	.driver = {
 		.name = "qcom_mhi_qrtr",
+		.pm = &qcom_mhi_qrtr_pm_ops,
 	},
 };
 
-- 
2.25.1


