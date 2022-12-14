Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C73C4167B
	for <ath11k@archiver.kernel.org>; Wed, 14 Dec 2022 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rlTX10KlKj/Lo3IDY7TFw3fLUAqlD6DekWGTM/GwLlQ=; b=zf5pQYUfuCG7YI
	1C2+yp1c7QNuFlTXe3TVK2MGoUez/Fo2RoX5JgPMKfdIxrdiM3mS1u772vJQhkvrQkrQBKW/er41w
	fdowo3FE8B39p88ZYH62aRbuHwFdSwptncsoHZN349TPeAhAKiMBt5rU38k+dS0likKrG2VU6A/p0
	S7ODOAX8Juj4EXpU4rw8Yj3cZecNdc1G6E5uyZlIX5CXLFt/SR9/iPDPGRCz+Xq6Kj2buTxf5JthX
	5KP0RG9UZ5H+qnOaRxEa9pSL6te0yckqvkIWZiaVSCjq9HuOHOp4o+rCu7rdV/06yYuzkYUTsPa0P
	6M3ZZ2uRIsrZg7uUfZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5SzM-00HPHn-8s; Wed, 14 Dec 2022 14:44:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5SzI-00HPEG-7e
	for ath11k@lists.infradead.org; Wed, 14 Dec 2022 14:44:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BEE5klj019528;
	Wed, 14 Dec 2022 14:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=EAmFcBuQ6nWSaRR7eUJIid/0GgI8maiIz4OkRd1pkfE=;
 b=bKjnC6uYEfjp5OCyzVgNl/aJ/wAIYpYRcl2kQn5mHrHRejqE+Gqgbe8iqLKdQDCgZlNM
 w4+8mvO2ND2oimRinwiHO/4nemiNJcNlqhgFYSgBuvk+ex24ozf4yFQoC4B7nDheSZ6s
 y5KtjCi5Jej3WgyS/Ah6g9pqOKCr/euqMgObFMTSHidxWUlG8Jr4oITTKqsbdxZByeeJ
 bgUikhsVYmtELFskjer9gOF9VUFBalGzXGYb3i1Y/agFnUjklaVExaB1KI5xPyaaEEg7
 m8ZcS306YZ7YygHOJIWGHC1XlIcEtyfsl7TJTbXzxvoyC8cRjFAVt/Xs9pK9iWNImltx ig== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rehe14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 14:43:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEEhnZc001534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 14:43:49 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 06:43:47 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH 0/3] wifi: ath11k: add support to parse new WMI event for 6 GHz
Date: Wed, 14 Dec 2022 20:13:31 +0530
Message-ID: <20221214144334.13812-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ePO-sFZ1evr1CkQ8KuvRL-3dyOUXy3vc
X-Proofpoint-GUID: ePO-sFZ1evr1CkQ8KuvRL-3dyOUXy3vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=936 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212140117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_064400_403387_7AF6A219 
X-CRM114-Status: GOOD (  11.80  )
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

 In order to support different power levels of 6 GHz AP and client,
 new WMI event for regulatory - WMI_REG_CHAN_LIST_CC_EXT_EVENTID is
 added in firmware. This event provides new parameters required for
 6 GHz regulatory rules.

 Firmware advertises its capability of handling new event in WMI
 service ready event. Based on that, host needs to set
 host_service_flags in WMI init command to indicate that host supports
 processing of new WMI event. Based on advertised host capability,
 firmware decides to send old event WMI_REG_CHAN_LIST_CC_EVENTID or
 new event WMI_REG_CHAN_LIST_CC_EXT_EVENTID.

 Add support for parsing 2.4 GHz, 5 GHz and 6 GHz reg rules and other
 parameters from WMI_REG_CHAN_LIST_CC_EXT_EVENTID.

Aditya Kumar Singh (3):
  wifi: ath11k: use proper regulatory reference for bands
  wifi: ath11k: add support to parse new WMI event for 6 GHz
  wifi: ath11k: add debug prints in regulatory WMI event processing

---
 drivers/net/wireless/ath/ath11k/reg.c |  58 ++-
 drivers/net/wireless/ath/ath11k/wmi.c | 573 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h | 332 +++++++++++++--
 3 files changed, 874 insertions(+), 89 deletions(-)


base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
