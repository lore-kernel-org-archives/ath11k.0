Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8532BC61DB3
	for <ath11k@archiver.kernel.org>; Wed, 22 Nov 2023 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDURi+W3O+VoZaFxjbk9mN4+Q4kiroQffH83KQHzQVE=; b=H6yRAaYVpwVhln
	VvOKI6IORi0H2YB4u/wgZd6ese5/O77OAbBiVUKnSXri+y0Qk2xNF55BulKCdmiFZPx5SQrLMC2Px
	9eZI6mspEhMczWZHl7gsW/nbayLrkNe5+8/vY3VE5WF7hmmIXZy46cJCxglZFStASQwfr3weggR8Q
	mUTBqvbmffPPTeBedER9eJc8EtwjKnYaGf80TgR10lix0zPBZAkFtLPLw2kpRvu04yxVcOSBc/wlj
	xxGG3Uvv4ZIbp37fUPDZ79sx6Gfyo4Go2YP9RT/DnpIA3oMGGZIRSKq1kYu4oLKTJGGKgtg27iO99
	9fSgCCZBy1gyMjc7uCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLQ-001Aig-0n;
	Wed, 22 Nov 2023 09:16:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLN-001Ag2-2q
	for ath11k@lists.infradead.org;
	Wed, 22 Nov 2023 09:16:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM4t4Ix030377;
	Wed, 22 Nov 2023 09:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=KYd/c06QTocHK7FbFoQ+0KC+Ad/sUuBJeNozOdnan0c=;
 b=KBAUvHbbgyucsuXRBvjBVOX/fNdqDNc2LUyZnih3CixtfLRCLMhG2M3snvzrcLzgecwH
 ieYef8hUikAtqv0dBS+T2ZTddjUxT6fJ7bHJe4cyqK/99yr0Qh7AA2NGDPOY9OwSxtvC
 586tLyo/n7tbi8zcZLNjebV7BaS9SHaZnE6iuifrn8m3B/uWNT3jg1Gow2piRrbjkgjQ
 7mEjB0HN3/waHlK0+OiT/BZVF4lHZmCs9xhL5RsnjQ8vZSxkjCm0/H8c9Hr4EHQsEF2C
 WuNhnjpPZQi3lk+EwLt3HyEQqX8dkUOkWpqHJV06WhSz25AKfLKjuRdIu18L4orcHYv6 BQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uh0b4a20e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AM9GN8t008159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:23 GMT
Received: from bqiang-Celadon-RN.lan (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 01:16:22 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v7 10/12] wifi: ath11k: add WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
Date: Wed, 22 Nov 2023 17:15:51 +0800
Message-ID: <20231122091553.10837-11-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122091553.10837-1-quic_bqiang@quicinc.com>
References: <20231122091553.10837-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FJD0UnXt3GVv6kQO5jq7Ae3KhMTFB3bx
X-Proofpoint-GUID: FJD0UnXt3GVv6kQO5jq7Ae3KhMTFB3bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_011626_037627_B198245B 
X-CRM114-Status: GOOD (  13.27  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Firmware advertises support for SERVICE_EXT_TPC_REG via a WMI service bit.
Add the definition of this service bit so that a subsequent patch can
check whether or not firmware supports this service.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v7:
 no change.

 drivers/net/wireless/ath/ath11k/wmi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index cad6b69be592..972bae6a4e3b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2112,6 +2112,7 @@ enum wmi_tlv_service {
 	/* The second 128 bits */
 	WMI_MAX_EXT_SERVICE = 256,
 	WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL = 265,
+	WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT = 280,
 	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
 	WMI_TLV_SERVICE_BIOS_SAR_SUPPORT = 326,
 	WMI_TLV_SERVICE_SUPPORT_11D_FOR_HOST_SCAN = 357,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
