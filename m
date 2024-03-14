Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB4DC54E58
	for <ath11k@archiver.kernel.org>; Thu, 14 Mar 2024 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iXAg3/t4zciRq7NdBZckuchQaOw2dcXJbb9usAECZu4=; b=Cc5M22y+Lg74CGcYehdWXJKNdn
	6jNFIFo9v1ASTbIHXjCpgy5+AXlydctVE7MVhBX1SlxzHIJs41fpYhQAQ5Nn4tmmCKk4p/OLwwr6L
	4TF7/gmD3zyQ7Fauf9DxxRG0l4iGnukFVn7dfU7R9YXmfA30saFUBfcJrOQU2USuAFIBb50iZs+Tf
	hGpY1XgxwBz2l4jYZ0LuhV8fHVfFWKgArUpA3022g0ma95V3EahpwHY3iqTrm+cYR2ElkOzV9b8ci
	fs4/ARc0f+r56hGXOcbw1Kqf8pCYbSsMxzOWtJAC7NixxbOmHvadAj0Q+TZ4C5FH9B2KLsF0QZxE0
	MQobUxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkaeg-0000000Cex1-2Gnq;
	Thu, 14 Mar 2024 02:17:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkaee-0000000CewY-0pEm
	for ath11k@lists.infradead.org;
	Thu, 14 Mar 2024 02:17:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E2GDD8030338;
	Thu, 14 Mar 2024 02:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=iXAg3/t
	4zciRq7NdBZckuchQaOw2dcXJbb9usAECZu4=; b=NsSUi+K2+6ws7Wg5V3xnXr9
	3DzF/Dfn5kfbprTrWJMhXsMXJM1ru7Qg6mEvvzq+M2EK1T9BblyRDmW9HqPAJsOE
	c/krtzq/VpCNLnYwzdWfKhe3Uo3hzHzep7iooG1iKX0NTVxIW3PqWrBIiOLo0vuR
	G3Mm70kjuVWCpGa3NrqzjRjzAVt008lQ1WfFYACXZMqixIhTg+VcDmhsd0nOv8C1
	KBoNt4h7fzMPijiKD1phhlu5UgBKrfkMLmdItulrv5SMH1FNqXhHBEa3Y7MW0XDQ
	pNC55waoZWNuNtKmr3wjoZAmCQVXQQpRgIM9jbGDWmebGaAks1Q2ZMVLB9N4VmQ=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuapehxeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 02:17:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42E2H92M020968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 02:17:09 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Mar 2024 19:17:08 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH] wifi: ath11k: remove duplicate definitions in wmi.h
Date: Thu, 14 Mar 2024 10:16:54 +0800
Message-ID: <20240314021654.304451-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IZlkHV5k9ibIXOnOuhloUpu6gbKLg_Ob
X-Proofpoint-GUID: IZlkHV5k9ibIXOnOuhloUpu6gbKLg_Ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_191712_273485_3BFD450E 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

There are some duplicate definitions in wmi.h, remove them.

No functional changes, compile tested only.

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index bb419e3abb00..9652f4eb2f32 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -60,10 +60,6 @@ struct wmi_tlv {
 #define WLAN_SCAN_MAX_HINT_BSSID         10
 #define MAX_RNR_BSS                    5
 
-#define WLAN_SCAN_MAX_HINT_S_SSID        10
-#define WLAN_SCAN_MAX_HINT_BSSID         10
-#define MAX_RNR_BSS                    5
-
 #define WLAN_SCAN_PARAMS_MAX_SSID    16
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
 #define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
@@ -5740,8 +5736,6 @@ struct wmi_debug_log_config_cmd_fixed_param {
 	u32 value;
 } __packed;
 
-#define WMI_MAX_MEM_REQS 32
-
 #define MAX_RADIOS 3
 
 #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)

base-commit: ffd4e60352172cc167ff74e8bfd8a331a5830013
-- 
2.34.1


