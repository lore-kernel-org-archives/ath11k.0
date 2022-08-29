Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113EEECAAD4
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+guFcXoxpB4izLXrbhkRAVKGwhCYdVAn6EglyYBO8Y=; b=fdoIleTlXTYTp7
	sJuTyI+W2pmjkELQqavDiME24DGqnywwbdS7lSUXV7DLJ+0TnwyBel++BsLf5NyyhXjwtAG78ghAM
	+AJsIIyVPGIpaN+jIaLTbknDz/zSJbHow5HVD+KcDxW4683q+nDnRWdz7e11sF5TydOT50qiLQJj2
	yX2K+NBqOitukrTY2dFukbkXYhERn90IKJuFCE+HRkQHoDXONx95vMuzwVXZziTXyPEkqXi1KvVXM
	5txPAuhoXncP0Zxl3H1X8E3FqWlVGhTtAaNapRsb5SlITX70E3bn/huEtLLXK7UWU+0gi7QqP6Vf/
	3e3RghKiatk6rqxtHK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSe7Y-009jy5-RQ; Mon, 29 Aug 2022 12:44:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSe7J-009jro-TP
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 12:43:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T8dT7I003396;
	Mon, 29 Aug 2022 12:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Jo31vLlbUctrQVF1f986Wlcc9jNBj7EkWo68l9qM/Fs=;
 b=Rm3txSUMbrY2OXnjt5AB1Qh/AMlvQC7mqEf32aLcLgSz3hNCBh6DMAKYyYyd9nDWcxVN
 QmWXaUcQizQabwNsmZh/OFdFLwjmgSVINjGKRe15qIxhGuKgKxeVSU9c6fpSb2Jlzvab
 U1ISNGtX6hFxQpMRylVsaHs70Tk2BEcgXGdeJC26ytBV2ZAWXmDQZtp3KnrY6bufY9N6
 +6XP3fB2v7EkNaEXrf1LzllJgEdzQWrLLs/X6zp7eDGegE9KNNIcbQVjdPWIIRT5tNY2
 PBZLO4NjHS3xfHTxd+0aP7IB7hpps1yznMRYpZooZO+oEoiXw2rMMQWKV3dZcpGqMh9q gQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8t1b0m40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 12:43:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27TChiWo028834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 12:43:44 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 05:43:41 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH v2 0/2] Add WoW support for WCN6750
Date: Mon, 29 Aug 2022 18:13:21 +0530
Message-ID: <20220829124323.26874-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aFj98tMPSexHccKuhBm-HSx8YCGzsQx4
X-Proofpoint-ORIG-GUID: aFj98tMPSexHccKuhBm-HSx8YCGzsQx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_054350_034419_31A8FE22 
X-CRM114-Status: GOOD (  15.10  )
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

Add WoW support for WCN6750.

Unlike other chips where WoW exit happens after sending WoW wakeup
WMI command, exit from WoW suspend in the case of WCN6750 happens
upon sending a WoW exit SMP2P (Shared memory point to point) message
to the firmware.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Manikanta Pubbisetty (2):
  dt: bindings: net: add bindings to add WoW support for WCN6750
  ath11k: Add WoW support for WCN6750
---
V2:
- Replaced shift/mask operation with u32_encode_bits() before sending SMP2P message
- Rebased on ToT COMMIT SHA-ID: f60b230094cbf88c73808709e4f9c1cf09eb0b01

 .../bindings/net/wireless/qcom,ath11k.yaml    |  17 +++
 drivers/net/wireless/ath/ath11k/ahb.c         | 123 +++++++++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.h         |  16 +++
 drivers/net/wireless/ath/ath11k/core.c        |   7 +
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath11k/pcic.c        |  32 +++++
 drivers/net/wireless/ath/ath11k/pcic.h        |   4 +
 drivers/net/wireless/ath/ath11k/wow.c         |   8 ++
 8 files changed, 207 insertions(+), 1 deletion(-)

-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
