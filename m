Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5786C4167B
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2qGDFgITVjCV4mGYzZZo7BH0f4dfXDUyXjZixSVI4M=; b=1XuWGJIspy3Rjbmiq40svpeF6b
	mkz2vHNc1dsKo5YskDpeGbkzURuRM4OQpJmuBJ6Q8+QDGDSgiVWRDisqkmnFV85gDfqvDrA544AdY
	1npGIsn9Ma32GRRMHouFn0QmWJy9GBzhf128XliHREK+iV5MNbtdkcN+0mde4uKq8Gf3Sfmj3bTON
	btCA+5wRgsbClqBOCHWlVSOsDyKzPB97NoMQRtqVDVwt/ERkHARBbkKboBSbnt9uwEwe3OMRqfRsm
	t/e+6ZF8fi1wX7UjxVRRvP5S4qqMjrTAnjt6EuTSi7dogohvuROjCUnsFjHqrD71Epe0+AqzApRmS
	YK8BlxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZgh-004A4H-0h;
	Mon, 11 Dec 2023 06:22:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZge-004A19-0D
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 06:22:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB5kO8L028342;
	Mon, 11 Dec 2023 06:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=K2qGDFgITVjCV4mGYzZZo7BH0f4dfXDUyXjZixSVI4M=; b=Hk
	D8k2fCSjDJ4CHmqjudONpvU0XAOW+1Gz0I7By0Gf8lY6SDmW3aGvRmpgZnujUmjY
	nvEMk66imZsapYhtjFA/eYjjpmf9K6f/GMo+3Dt57VQZGvNYkmTrqyk58pOURRca
	qB1COeEUJkAHvX20TKOq/lgo8+HvBniPPFujBbuguqai5FbfvfPnq3FN7tKkx/EZ
	5jpyGYMb70sdIV8h+KXMqd4pbBBlzQjvpFvhvlnoM4jAGCKDlgCgbr2POb6UC4Pi
	8pKM6UlBJBJL4HH6W1M+kBQC+gr5gf1oLFnaD7bpg+oZU7gdl1TKJzjEHZBt9PKi
	pIHNY+dpmIgoYjbo4Hqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvney2fah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 06:22:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB6MdWw012336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 06:22:39 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 10 Dec 2023 22:22:37 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v9 10/12] wifi: ath11k: add WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
Date: Mon, 11 Dec 2023 14:22:14 +0800
Message-ID: <20231211062216.382164-11-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211062216.382164-1-quic_bqiang@quicinc.com>
References: <20231211062216.382164-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AhNaLw_rbDrdpyTKp0KGktaeIRlisBwD
X-Proofpoint-ORIG-GUID: AhNaLw_rbDrdpyTKp0KGktaeIRlisBwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_222240_293590_62A0D940 
X-CRM114-Status: UNSURE (   8.87  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Firmware advertises support for SERVICE_EXT_TPC_REG via a WMI service bit.
Add the definition of this service bit so that a subsequent patch can
check whether or not firmware supports this service.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v9:
 no change.
v8:
 add s-o-b tag.
v7:
 no change.

 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index a9a7d81236cb..7e416e09aa5f 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2114,6 +2114,7 @@ enum wmi_tlv_service {
 	/* The second 128 bits */
 	WMI_MAX_EXT_SERVICE = 256,
 	WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL = 265,
+	WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT = 280,
 	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
 	WMI_TLV_SERVICE_BIOS_SAR_SUPPORT = 326,
 	WMI_TLV_SERVICE_SUPPORT_11D_FOR_HOST_SCAN = 357,
-- 
2.25.1


