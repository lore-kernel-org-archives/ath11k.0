Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB8C636CC
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxEJ8uPynxAXF/0YaENrzFF81vZdChckWOdu0LT+Knw=; b=UiELsv9hdDaUvQ
	B9Uh1dcsqLUL6yVMUlH1tY9UUVTMXKArb5laDBj8h2X+BL+DNOLWeUItPsj5ZL549nxLtqIBBn56q
	BRJcVH9v4KVWKHxf1S26pPoZJE/cSZofC9d6emJ1POeaxT1YO0DhP6Jq5/7NWL9uBXuO/BQcuvXRt
	ZWiURkud4CiVTC1zH2X51Jse9YWMA/kpa/CfcXZlSstmkMECGRtARTIgw/RvrFGQi2hu9MS0Z2X9e
	e+wxhmrnxQHPVdDbTuHVaZNPss1RSeRYUrz9joq2ZyUH3NaxH6E/WIQjdUfNDKdnl2HozfpSSrYL8
	zHOJADcblc9s4twWSMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFr-008EPW-CB; Tue, 31 Jan 2023 14:04:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFi-008ELC-TU
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 14:04:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VE13V9027139;
	Tue, 31 Jan 2023 14:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=E/fAdF/zkHo45BBMEQJvly0JrNdpGoTOtqVn/he4rmM=;
 b=S7LEfyBsUvS9xFsWfGI9C+K1dhogN4AL8Nz8uzxS2hYPC/lBXpQivAYvoNS4nl6rC5xN
 t3Bgh3b1+kovf1Qqug0osl1F4pVAxZHfBLlM7IqIK/RbiOjXEzM7B6qkZDONGMJwZrC4
 4vQrSQjni9XlcPmB2Tb38yJ2ubklRUgKHIuTPna3Hw0MqnLrK0IuOG1AdhuwqTIqZ858
 M8x/4Rs4edHut73yu5ICJ3p0QJsdqNJA6p4dAlq0xRe1lw4n8F9oXHLfalTIlW/P+6Cf
 Msin70EvhyIV3+bCxRr+TGWYF5oJS0E4KWK4apz83q57Z2B6OnG3g3SpsQm0z1O9CXFU Ww== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3new3u980f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30VE4h5N012301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:43 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 06:04:39 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala
	<quic_youghand@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath11k: PMIC XO cal data support
Date: Tue, 31 Jan 2023 19:33:45 +0530
Message-ID: <20230131140345.6193-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230131140345.6193-1-quic_youghand@quicinc.com>
References: <20230131140345.6193-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MI8SnSJM_t216eBmqmuHicvttJ7NGjEs
X-Proofpoint-ORIG-GUID: MI8SnSJM_t216eBmqmuHicvttJ7NGjEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_060451_107189_4BF39495 
X-CRM114-Status: GOOD (  22.43  )
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
