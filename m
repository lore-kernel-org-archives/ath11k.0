Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F24BC6FA82
	for <ath11k@archiver.kernel.org>; Mon, 12 Sep 2022 22:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8u8zOQZ2agL2yzP4MYxfYp5OyOX8CWoG9m74hOgHNf0=; b=tVG/pzWbYEd2hp
	OMPHyCL+ngeUYSO1dbExbb7jlZiSsYcXwC7bFLT3cGB+qm5xc0gohMuknjRJ3AN7ty5xBfoq+VC0p
	0Qjjf1teHNvcD3aXkN8iRbI+1Vvktu3CFPRxm/NwT68TXTQ4xuKqnEb5YunFNRJ/cBjoSSLYnhvW0
	cg1zi7atiG1xTw5hh09wdAYY/1exchm77WJPg19IEw6O9vH8i+mBBu+bxyRCCUol5CllArieQxmCw
	xkGda2Bijf0K1dfKdOGpLr1uEqjujZuI7Rs/tWZaojVsPsqyloDUrVqtpzm3Lwu0q45yLQ9hyFhCv
	3Tpgp2VhyVD1HUUhtXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXrgn-00EdMm-VB; Mon, 12 Sep 2022 22:14:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXrgi-00EdBU-Q5
	for ath11k@lists.infradead.org; Mon, 12 Sep 2022 22:13:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CK012t007156;
	Mon, 12 Sep 2022 22:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=DRxI8WtvP7N6NAkSiy/KPGp6Kl2U9dUfyD4FiVUj7rU=;
 b=FTR5Coedskovmd6TNt0kqIDGUjqgbennARYfP/lf7luknVymlGVp8P8v3WIHpqVXdbMu
 o3H3SLRaH/fxHfrwMb+VDqfDqXM+lPmYmjP5GUKY9WRtr+zdvZ3C9EPtojRx/tn6ZL4N
 eW6deFNvjeiz2jvIPbFYHfkAVviqRB0/WKIe5HnMc0L7YV/LVo7Xnz591GtgD5/7VOFG
 XY+40JflFZQs8vE9J0njVTcgAIIwA+kAg0g617zNWi6HPqCfd2kBy5NIze325cxmdIav
 iFgCcynEuQqH2Spe9CbqYLJvYQ4OXxWT8nLw93gphPe3MG2Vn5vMw7tLFANOvc6kiqdK 1w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgkgknc8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 22:13:43 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28CMDfsc016239;
	Mon, 12 Sep 2022 22:13:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jh43se8b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 22:13:41 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CMDf8R016233;
	Mon, 12 Sep 2022 22:13:41 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 28CMDfmM016232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 22:13:41 +0000
Received: from quicinc.com (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 15:13:41 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Make QMI message rules const
Date: Mon, 12 Sep 2022 15:13:35 -0700
Message-ID: <20220912221335.27520-1-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLMHrxkRrfkpg6lWYgDZpKnPn-Q-8KQF
X-Proofpoint-ORIG-GUID: fLMHrxkRrfkpg6lWYgDZpKnPn-Q-8KQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_14,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_151357_280611_F2F0878C 
X-CRM114-Status: GOOD (  14.26  )
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

Commit ff6d365898d ("soc: qcom: qmi: use const for struct
qmi_elem_info") allows QMI message encoding/decoding rules to be
const, so do that for ath11k.

Compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Depends-on: https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=ff6d365898d4d31bd557954c7fc53f38977b491c

 drivers/net/wireless/ath/ath11k/qmi.c | 68 +++++++++++++--------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 2be45683260c..fa6c21a4897d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -279,7 +279,7 @@ static struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_host_cap_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_host_cap_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -296,7 +296,7 @@ static struct qmi_elem_info qmi_wlanfw_host_cap_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_ind_register_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_ind_register_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
@@ -521,7 +521,7 @@ static struct qmi_elem_info qmi_wlanfw_ind_register_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -557,7 +557,7 @@ static struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_mem_cfg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_mem_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_8_BYTE,
 		.elem_len	= 1,
@@ -589,7 +589,7 @@ static struct qmi_elem_info qmi_wlanfw_mem_cfg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_mem_seg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_mem_seg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -631,7 +631,7 @@ static struct qmi_elem_info qmi_wlanfw_mem_seg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_request_mem_ind_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_request_mem_ind_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_DATA_LEN,
 		.elem_len	= 1,
@@ -658,7 +658,7 @@ static struct qmi_elem_info qmi_wlanfw_request_mem_ind_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_mem_seg_resp_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_mem_seg_resp_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_8_BYTE,
 		.elem_len	= 1,
@@ -698,7 +698,7 @@ static struct qmi_elem_info qmi_wlanfw_mem_seg_resp_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_respond_mem_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_respond_mem_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_DATA_LEN,
 		.elem_len	= 1,
@@ -725,7 +725,7 @@ static struct qmi_elem_info qmi_wlanfw_respond_mem_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_respond_mem_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_respond_mem_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -743,7 +743,7 @@ static struct qmi_elem_info qmi_wlanfw_respond_mem_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_cap_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_cap_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -751,7 +751,7 @@ static struct qmi_elem_info qmi_wlanfw_cap_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_device_info_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_device_info_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_EOTI,
 		.array_type     = NO_ARRAY,
@@ -759,7 +759,7 @@ static struct qmi_elem_info qmi_wlanfw_device_info_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlfw_device_info_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlfw_device_info_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -813,7 +813,7 @@ static struct qmi_elem_info qmi_wlfw_device_info_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_rf_chip_info_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_rf_chip_info_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -839,7 +839,7 @@ static struct qmi_elem_info qmi_wlanfw_rf_chip_info_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_rf_board_info_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_rf_board_info_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -856,7 +856,7 @@ static struct qmi_elem_info qmi_wlanfw_rf_board_info_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_soc_info_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_soc_info_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -872,7 +872,7 @@ static struct qmi_elem_info qmi_wlanfw_soc_info_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_fw_version_info_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_fw_version_info_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -898,7 +898,7 @@ static struct qmi_elem_info qmi_wlanfw_fw_version_info_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_cap_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_cap_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -1099,7 +1099,7 @@ static struct qmi_elem_info qmi_wlanfw_cap_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_bdf_download_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_bdf_download_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_1_BYTE,
 		.elem_len	= 1,
@@ -1234,7 +1234,7 @@ static struct qmi_elem_info qmi_wlanfw_bdf_download_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_bdf_download_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_bdf_download_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -1252,7 +1252,7 @@ static struct qmi_elem_info qmi_wlanfw_bdf_download_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_m3_info_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_m3_info_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_8_BYTE,
 		.elem_len	= 1,
@@ -1276,7 +1276,7 @@ static struct qmi_elem_info qmi_wlanfw_m3_info_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_m3_info_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_m3_info_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -1293,7 +1293,7 @@ static struct qmi_elem_info qmi_wlanfw_m3_info_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -1346,7 +1346,7 @@ static struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -1381,7 +1381,7 @@ static struct qmi_elem_info qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_shadow_reg_cfg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_shadow_reg_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_2_BYTE,
 		.elem_len	= 1,
@@ -1405,7 +1405,7 @@ static struct qmi_elem_info qmi_wlanfw_shadow_reg_cfg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_shadow_reg_v2_cfg_s_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_shadow_reg_v2_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -1422,7 +1422,7 @@ static struct qmi_elem_info qmi_wlanfw_shadow_reg_v2_cfg_s_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_mode_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_mode_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -1457,7 +1457,7 @@ static struct qmi_elem_info qmi_wlanfw_wlan_mode_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_mode_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_mode_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -1475,7 +1475,7 @@ static struct qmi_elem_info qmi_wlanfw_wlan_mode_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
@@ -1614,7 +1614,7 @@ static struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_cfg_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
@@ -1631,28 +1631,28 @@ static struct qmi_elem_info qmi_wlanfw_wlan_cfg_resp_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_mem_ready_ind_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_mem_ready_ind_msg_v01_ei[] = {
 	{
 		.data_type = QMI_EOTI,
 		.array_type = NO_ARRAY,
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_fw_ready_ind_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_fw_ready_ind_msg_v01_ei[] = {
 	{
 		.data_type = QMI_EOTI,
 		.array_type = NO_ARRAY,
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_cold_boot_cal_done_ind_msg_v01_ei[] = {
 	{
 		.data_type = QMI_EOTI,
 		.array_type = NO_ARRAY,
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_ini_req_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_ini_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
 		.elem_len	= 1,
@@ -1678,7 +1678,7 @@ static struct qmi_elem_info qmi_wlanfw_wlan_ini_req_msg_v01_ei[] = {
 	},
 };
 
-static struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
+static const struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
-- 
2.37.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
