Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F87C54E55
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajuHYkDGZwcvYcnmMdFoyUQ5YYFqfpnWUwyA35aWg3A=; b=1zQyWmyMrB0sa4LPlFbP96RDvi
	JkO4ZQvI2xgMQ9ATMCGQH53pIa+OuI1yd2uO3mV5nTs3+87mwsrUrk/NnEPy/c/Os+1oGYZF0c4ox
	o6pc9Xs7wI/Bm0lJ7C8mBJ5Feny8yt88IhpEnumGRNmxzuPlT7T+pKmmeJj/AWdynH5CkMjtVqkFH
	Xhho9Q5IYk485oMRpDep15a0CHVziiXjaFOy3c05HoIMR4V0F0I+aHe24Mpyyq6I4Ek9jdEqlmjCF
	fTDCfDZHDlzdmLLGuPSdWt85pzQ1lLsJin2Xl8PphAzUegMoJ15AaoFQY1txfsmfscncuQDYkKmIY
	3aWpFx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGMB-00000008hXV-1DG8;
	Wed, 28 Feb 2024 09:36:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM6-00000008hTT-1KUI
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 09:36:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S6oCHR008330;
	Wed, 28 Feb 2024 09:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=ajuHYkDGZwcvYcnmMdFoyUQ5YYFqfpnWUwyA35aWg3A=; b=DA
	iaLFTCsuUNoMbi3unqXNpeOUtNJIfyjRkmxyXV5nsasX6wOzBYwgXzSuxS/z5A9Z
	xxesyv7EJjLiX6p0OEGBnnuBwTGSHJUQd1xQISV3wsJMkuITW7PpUqxytDFjCHZL
	mm3KM6Z3fI46xjfWlzKDdle95rOekw4s3+h3Q9csRNB+x1AKECsEvbCL/3f6pl+r
	8T8gWpfNBuSBw2s1Z3NPUxJQd2qBOToQlsyyT0ZygUg5zxiilLY/lyCG5xAVU1SX
	ojAhz+WDtDgQ7Bg3ewouRj6UC4IjPQa0GkzMkvlF/TWZKino5xuBRHskpleKQJrZ
	9VndNxlGWCVF/paOUqBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whwb3rk56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:36:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41S9a0av029116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:36:00 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 01:35:59 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 4/6] wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
Date: Wed, 28 Feb 2024 17:35:35 +0800
Message-ID: <20240228093537.25052-5-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228093537.25052-1-quic_kangyang@quicinc.com>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sdf1taMvY3uSDWnOiwIO0XuadmMm63aR
X-Proofpoint-GUID: Sdf1taMvY3uSDWnOiwIO0XuadmMm63aR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_013602_548433_F06E60B6 
X-CRM114-Status: GOOD (  11.52  )
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

Mac80211 needs more space for P2P scan ie in P2P mode, 256 is not
enough, resize it to 512.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 564f4a9ac8ce..ae788949bf40 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -66,7 +66,7 @@ struct wmi_tlv {
 
 #define WLAN_SCAN_PARAMS_MAX_SSID    16
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
-#define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
+#define WLAN_SCAN_PARAMS_MAX_IE_LEN  512
 
 #define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
 
-- 
2.34.1


