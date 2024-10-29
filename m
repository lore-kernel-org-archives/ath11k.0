Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97027D5B16B
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ND7P14RGUCa/3njBpgO0LodGoDDkZ/lSdMMfyom5wfM=; b=NMLP8QzexQk7DWrY4sfBb5yq6W
	ONzdwJinPTDZUyorC1ORBNP7xFTXPqUHDYR4f6/Ea5AnvbZ786KPdFEuc6ztE+K2wKu0xK49RpInD
	0glTSnWiHF9myCWd0Yq5R6CxACO4l41SvFVQYe9ktU1QnHnF1Gg+votLiie77dEd3/4OlvwzMIPBQ
	XHRaI4+mUwZctwZePCLBVbG/8bNvFjK+jq0Q4j944ugEPsklERiRLyjRb+yklkP9SS4wFdCLVZp0O
	sBa2isf+AUoEHE4Bca136d2kNkWBKb5dCXhdyzP/6M2DIdyFnuNdTv00e40BpupRKMXI44nggt/t7
	9kVZJd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hrf-0000000DkNA-3b1n;
	Tue, 29 Oct 2024 08:46:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hfl-0000000DhNU-26at
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 08:33:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKYPkG012047;
	Tue, 29 Oct 2024 08:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ND7P14RGUCa/3njBpgO0LodGoDDkZ/lSdMM
	fyom5wfM=; b=BvKhgSSqCsAl0YzUAj0gW9Xw3KcLV07EgCLb/XoW7OGXS1XDM47
	4JMcZowBdQY8WgmV3vbjsojEnd16OzXxIhv+BpsqXz4m2LFyHyTMKmvfNTD1t5NE
	6kUB/tebAQZVULoynoOjIxFEZaGxOIjDikOvANrv5p/LqTuEJUjOovwV9CMQjTHN
	4cJdVAhKHngr4UjOktqaaV5uwlDVsUCKm1wjN0pP2sHK7YDpmCXZ1DoWHgM7Qt9M
	jhbf6wBHKY0oVEUFAxP0l33zUhXwIq861urO0mv3FVdf+BwY3RNVBOfO14a3aR1C
	NF4c5+4UcixYHBw6fcpmYeFIJgALiSbI6KA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4dyxy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 08:33:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49T8Xmd9008331;
	Tue, 29 Oct 2024 08:33:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42gsgkvtk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 08:33:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49T8Xmel008325;
	Tue, 29 Oct 2024 08:33:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49T8Xlne008323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 08:33:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id 055964A8; Tue, 29 Oct 2024 14:03:47 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] wifi: ath11k: Suspend hardware before firmware mode off for WCN6750
Date: Tue, 29 Oct 2024 14:03:40 +0530
Message-Id: <20241029083340.3010798-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _onm_X5DIw0JJ4VfGMo2aKwI7XeYTKBK
X-Proofpoint-GUID: _onm_X5DIw0JJ4VfGMo2aKwI7XeYTKBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_013353_584821_61E5044F 
X-CRM114-Status: GOOD (  18.15  )
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

During rmmod, the ath11k host driver sends a QMI MODE OFF command
to firmware.
As part of this command, firmware initiates WLAN de-initialization
and accesses certain UMAC registers during this process.
Currently, on WCN6750 WLAN hardware, the system is in a sleep state when
firmware receives the QMI MODE OFF command.
This results in a firmware/hardware reset while accessing the UMAC hardware
registers during sleep state.

To avoid this, add logic to send WCN6750 hardware specific
WMI_PDEV_SUSPEND_AND_DISABLE_INTR command to firmware prior to sending
the QMI MODE OFF command.
This will cause firmware to cease all activities and put the device in
a powered-on state that prevents access to registers which have been
powered off.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 45 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 2 files changed, 46 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index be67382c00f6..a9aefb1a705d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -123,6 +123,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_dual_stations = false,
+		.pdev_suspend = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -207,6 +208,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
 		.support_dual_stations = false,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -296,6 +298,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
 		.support_dual_stations = true,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -379,6 +382,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
 		.support_dual_stations = false,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -468,6 +472,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
 		.support_dual_stations = true,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -555,6 +560,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
 		.support_dual_stations = true,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -637,6 +643,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = true,
 		.support_fw_mac_sequence = true,
 		.support_dual_stations = false,
+		.pdev_suspend = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ5018_HW10,
@@ -719,6 +726,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
 		.support_dual_stations = false,
+		.pdev_suspend = false,
 	},
 	{
 		.name = "qca2066 hw2.1",
@@ -808,6 +816,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
 		.support_dual_stations = true,
+		.pdev_suspend = false,
 	},
 };
 
@@ -1669,11 +1678,47 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 	return ret;
 }
 
+static void ath11k_core_pdev_suspend_target(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev *pdev;
+	unsigned long time_left;
+	int ret;
+	int i;
+
+	if (!ab->hw_params.pdev_suspend)
+		return;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+
+		reinit_completion(&ab->htc_suspend);
+
+		ret = ath11k_wmi_pdev_suspend(ar, WMI_PDEV_SUSPEND_AND_DISABLE_INTR,
+					      pdev->pdev_id);
+		if (ret) {
+			ath11k_warn(ab, "could not suspend target :%d\n", ret);
+			/* pointless to try other pdevs */
+			return;
+		}
+
+		time_left = wait_for_completion_timeout(&ab->htc_suspend, 3 * HZ);
+
+		if (!time_left) {
+			ath11k_warn(ab, "suspend timed out - target pause event never came\n");
+			/* pointless to try other pdevs */
+			return;
+		}
+	}
+}
+
 static void ath11k_core_pdev_destroy(struct ath11k_base *ab)
 {
 	ath11k_spectral_deinit(ab);
 	ath11k_thermal_unregister(ab);
 	ath11k_mac_unregister(ab);
+	ath11k_core_pdev_suspend_target(ab);
 	ath11k_hif_irq_disable(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_debugfs_pdev_destroy(ab);
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 300322535766..52d9f4c13b13 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -227,6 +227,7 @@ struct ath11k_hw_params {
 	bool smp2p_wow_exit;
 	bool support_fw_mac_sequence;
 	bool support_dual_stations;
+	bool pdev_suspend;
 };
 
 struct ath11k_hw_ops {
-- 
2.34.1


