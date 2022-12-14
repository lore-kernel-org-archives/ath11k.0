Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED06FC4332F
	for <ath11k@archiver.kernel.org>; Wed, 14 Dec 2022 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxEJ8uPynxAXF/0YaENrzFF81vZdChckWOdu0LT+Knw=; b=xR8uBzTnhCW10y
	8w5EKDj778dGHq0iz/UmEY2GZRM5MEWT5jToJnb5JM7BIRkR4+T+la3FKELSZajFx3MfzMluAO7oa
	t1Fl35hkE6KIMxmMK/XbFQl7jJPIVQMVJsID4XMDuqrf3pEKd4DukpWim8598qj6yP19HHpAlhxTH
	03/T/5Z1tqRiZeVSCsyP8yZY2Q0FbqheiKgLt17afu9Y+B7/0ZCclEHzxl1VXQcVlZEowVzl9Y+bz
	RhTholoVd5oJf5QVnWgC17QEa8iCV7pPEL1dQRLwMgAFS32mw7VR19l8cM8CdUV65EJWbDlb0ltel
	ysm8CiBFdEJVo8ZiCIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Qiq-00GHQV-8p; Wed, 14 Dec 2022 12:18:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Qin-00GHP5-MY
	for ath11k@lists.infradead.org; Wed, 14 Dec 2022 12:18:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEB8clI005634;
	Wed, 14 Dec 2022 12:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=E/fAdF/zkHo45BBMEQJvly0JrNdpGoTOtqVn/he4rmM=;
 b=oQwsLXvgmzC2HaFhna8X4JX4tZ5u3PpGwZOeMmrW3Jqe6AXUWmaWPHyKP/lYOkh8L3ex
 PX9pJmN5a4mADDcKpM3kWGHpLJVauA1wkbdDzmiJIgxFZ8vWkuLuwG4K4qIR7pjeiSxU
 e9GjfP6fqBL40U3VJxwiNwCjBCN+yrGWuq3EJk2xJkKYrVGPwUIvRjLGcCmFnyDT0lru
 zqh5uml7MdG1cK6vxMWF7KGQdit3PfE/0EUdWu/kXEIcEL1YLqIoSrjGsD8thjCxLtuL
 nT/M5mWU7i+n+zEdtj0CRIGOlds+pyNRaQIYpDrKWLwJuNQ0mznXSEUdD62p8stoORrF 5w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rrh2p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 12:18:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BECIlNn008261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 12:18:47 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 04:18:45 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 2/2] wifi: ath11k: PMIC XO cal data support
Date: Wed, 14 Dec 2022 17:48:18 +0530
Message-ID: <20221214121818.12928-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221214121818.12928-1-quic_youghand@quicinc.com>
References: <20221214121818.12928-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dl14QDdgvcQP8mRvsIbbi4iU6akxwUp3
X-Proofpoint-ORIG-GUID: Dl14QDdgvcQP8mRvsIbbi4iU6akxwUp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_041849_876133_08E74821 
X-CRM114-Status: GOOD (  22.14  )
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

PMIC XO is the clock source for Wi-Fi RF clock in integrated Wi-Fi
chipset ex: WCN6750. Due to board layout errors XO frequency drifts
can cause Wi-Fi RF clock inaccuracy.
XO calibration test tree in Factory Test Mode is used to find the
best frequency offset(for example +/-2 KHz )by programming XO trim
register. This ensure system clock stays within required 20 ppm
WLAN RF clock.

Retrieve the XO trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset (e.g., for integrated Wi-Fi).
Calibrated XO offset is sent to firmware, which compensate the clock drift
by programing the XO trim register.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  8 ++++++++
 drivers/net/wireless/ath/ath11k/core.h |  3 +++
 drivers/net/wireless/ath/ath11k/qmi.c  | 24 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/qmi.h  |  4 +++-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d34a4d6325b2..89580b4e47a9 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1039,6 +1039,14 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
 	ab_ahb->fw.iommu_domain = iommu_dom;
 	of_node_put(node);
 
+	ret = of_property_read_u32(pdev->dev.of_node, "xo-cal-data", &ab->xo_cal_data);
+	if (ret) {
+		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get xo-cal-data property\n");
+		return 0;
+	}
+	ab->xo_cal_supported = true;
+	ath11k_dbg(ab, ATH11K_DBG_AHB, "xo cal data 0x%x\n", ab->xo_cal_data);
+
 	return 0;
 
 err_iommu_unmap:
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 22460b0abf03..783398e98915 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -969,6 +969,9 @@ struct ath11k_base {
 		const struct ath11k_pci_ops *ops;
 	} pci;
 
+	bool xo_cal_supported;
+	u32 xo_cal_data;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 145f20a681bd..67f386b001ab 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1451,6 +1451,24 @@ static struct qmi_elem_info qmi_wlanfw_wlan_mode_req_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
 					   hw_debug),
 	},
+	{
+		.data_type  = QMI_OPT_FLAG,
+		.elem_len   = 1,
+		.elem_size  = sizeof(u8),
+		.array_type = NO_ARRAY,
+		.tlv_type   = 0x11,
+		.offset     = offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
+				       xo_cal_data_valid),
+	},
+	{
+		.data_type  = QMI_UNSIGNED_1_BYTE,
+		.elem_len   = 1,
+		.elem_size  = sizeof(u8),
+		.array_type = NO_ARRAY,
+		.tlv_type   = 0x11,
+		.offset     = offsetof(struct qmi_wlanfw_wlan_mode_req_msg_v01,
+				       xo_cal_data),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -2610,6 +2628,12 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 	req.hw_debug_valid = 1;
 	req.hw_debug = 0;
 
+	if (ab->xo_cal_supported) {
+		req.xo_cal_data_valid = 1;
+		req.xo_cal_data = ab->xo_cal_data;
+	}
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "xo_cal_supported %d\n", ab->xo_cal_supported);
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_wlan_mode_resp_msg_v01_ei, &resp);
 	if (ret < 0)
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 2ec56a34fa81..db61ce0d5689 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -450,7 +450,7 @@ struct qmi_wlanfw_m3_info_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
-#define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
+#define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	17
 #define QMI_WLANFW_WLAN_MODE_RESP_MSG_V01_MAX_LEN	7
 #define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
 #define QMI_WLANFW_WLAN_CFG_RESP_MSG_V01_MAX_LEN	7
@@ -470,6 +470,8 @@ struct qmi_wlanfw_wlan_mode_req_msg_v01 {
 	u32 mode;
 	u8 hw_debug_valid;
 	u8 hw_debug;
+	u8 xo_cal_data_valid;
+	u8 xo_cal_data;
 };
 
 struct qmi_wlanfw_wlan_mode_resp_msg_v01 {
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
