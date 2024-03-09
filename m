Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD556C54E41
	for <ath11k@archiver.kernel.org>; Sat,  9 Mar 2024 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8spNzfVDYXqnoGqZxoqtSV6/KIyrNwZMnMKRiN9BDlE=; b=tiUUv9vAq37YXcxyUza+by4XqE
	xMA0eby9wRqEPR6mjxg8r3tzfMa8MUdqSYYOqMlUrCNoAyCPcaefOpMgCScBz16y9un3VqtcPy1OB
	rrZX2ICar15h/OaF2kuX+Ofv/Yaru29rnGknWo17xzDAc67nfVIlG8lZuUaYgPwd2iL1TS/AvlZeJ
	N1v+GSHNCbQ79XZtg4DkP71ciHiNHcPz42eLZV7Ije9DOeOUVpcmLNFytxmGbsisnE7PrIHlYpN0v
	NjtL8/uzaFwpYgwzjXDBe5CzpXWRmsltglzSecAKmvQ9YnGkbaXzlE2OCvpc8V0h6XM5liiKVHuwj
	cLhcHKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rivYe-0000000DIeu-1Wbh;
	Sat, 09 Mar 2024 12:12:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rivYb-0000000DICY-0MQL
	for ath11k@lists.infradead.org;
	Sat, 09 Mar 2024 12:12:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 429C9QvG023037;
	Sat, 9 Mar 2024 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=8spNzfV
	DYXqnoGqZxoqtSV6/KIyrNwZMnMKRiN9BDlE=; b=RMieqmfoHBnG+9Ku4NsIX8s
	TSwi5zvJ362NfTQ/xAKoFt5F+z65/AVyMODKO52Fa9kRL4ox8Y/aF/x8eXuWD/db
	OvNNb9HQhUvo7cYxtZnPct3UzwMvi8e9QiukgC3OKECtDZGYy2OHhe8ef4tAUA6T
	fjPLh23qvM7/jYpw1oqhnpfmpoL6JknuQ5pWRrV3LgDP+dGs7QJuzFbrisvVlgHP
	oMt9Incv1C0bVBD8ArbieQQQu4CFSLAfuUmbb6UwxrERoRCO5GQcxZIm2bP3LUdS
	U2tKToSYU2fKR942imJwuiMbDJ0ArGwT50BXSd6IFykeCEip+rPNaGu7IcC5G0w=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wrfc40gdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 12:11:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 429CBku9025436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 9 Mar 2024 12:11:46 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 9 Mar 2024 04:11:45 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH] wifi: ath11k: modify the calculation of the average signal strength in station mode
Date: Sat, 9 Mar 2024 20:11:29 +0800
Message-ID: <20240309121129.5379-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RjZfXhawuQL65f5jBpmYmYePYhydz9he
X-Proofpoint-GUID: RjZfXhawuQL65f5jBpmYmYePYhydz9he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403090098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_041205_288067_D2963D40 
X-CRM114-Status: UNSURE (   9.66  )
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

Currently, the calculation of the average signal strength in station mode
is incorrect.

This is because before calculating the average signal strength, ath11k need
to determine whether the hardware and firmware support db2dbm, if the
hardware and firmware support db2dbm, do not need to add noise floor,
otherwise, need to add noise floor.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a6a37d67a50a..1f9cf7a42ba8 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8976,8 +8976,11 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
 
-	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) +
-		ATH11K_DEFAULT_NOISE_FLOOR;
+	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
+
+	if (!db2dbm)
+		sinfo->signal_avg += ATH11K_DEFAULT_NOISE_FLOOR;
+
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
 

base-commit: 7a5ed5a3801e9b6cf7bafbb0a05c70cef620b22a
-- 
2.34.1


