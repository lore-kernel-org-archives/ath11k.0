Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE1C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5UhZfTXUxPZUVjemtf3jTJJTpqEFg4fSf04WptNrRI=; b=mNVXS72TKRgKFj
	k1iukhuXAhLrl0+XADaGlQ9d656uwYmppo9XWWuXJX387L7IjCk29ww47rjE71xmON5ZUNwxbCucn
	sL8Hi+zaVb4WuGHvN/XphqXRUXjXQJ3ML/Cjo7zWnY/7xrb6Z8ZkME72yE7RL1WPIy2KdR7yc+UYp
	5prbyN+Sb6Uwqk/dR7earK/tjBj7T1dKs5oX0uq5ciEnKTMhhQeL6gHXFEjz5jzeL273gDMFQ6pRm
	oiIbtZ8P5wLiDukavFvTNY0is8BYFCxO/SUNfbjQUIGPlQRMXDwP7JHNnHPRBLgrtWXBUGMJ6bYIa
	6mmtwx0en88vmZ8p32IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LaJ-00CNWe-0c; Thu, 22 Dec 2022 13:26:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KL0-00BgGv-Ey
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 12:06:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMAoOV2013981;
	Thu, 22 Dec 2022 12:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=n4u0QORlDQIiNmr9PqyeFNaeaGjlinS5DG6hnZGlICQ=;
 b=eEAPNm33s+13Sy7SuupqM/ka9iXknVVA5j7nDpPKbdLp+60H8rbuSA4QbvokRFiTQRLB
 pWujB5a5hEimviQ4CduFNoPOn70D/LxswyaGji04f3pk5M0AcepKaoZMxKLANsB0jQ1V
 TJBmJN96Hi9/cr9LbyUifkOwmGJxIGNTp/hlVU26cpFO4LcbDcmc51p8kINlZk5ezBLJ
 kXT4y0VNyM6VNyAWMP7Ttx2B9zBODBZNrFHHYoiw2QtBbqSIYIyCMtz8Qt7QlgKKtgz/
 EC3YvMtbzDder8VH6MRETYfdTjUSl5zwOEX5tu44RPVHNLhjRP9pFQYjIK98zfA4C6yH WQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm0wfjp3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:06:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMC65Ja014927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:06:05 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 04:06:03 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 2/2] wifi: ath10k: update the channel list if change in channel flags.
Date: Thu, 22 Dec 2022 17:35:29 +0530
Message-ID: <20221222120529.31436-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221222120529.31436-1-quic_youghand@quicinc.com>
References: <20221222120529.31436-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6eceeX7tJ1UoDQyTdVscLpQr71FnTlQZ
X-Proofpoint-GUID: 6eceeX7tJ1UoDQyTdVscLpQr71FnTlQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_040614_802181_78CDBC9D 
X-CRM114-Status: GOOD (  19.19  )
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

There are connection failures in hidden SSID case when the device is
with default reg domain WW.
For WW reg domain most of the 5 GHz channels are passive. When device
listens to the beacon on that channel, the driver is updating its
channel flag but firmware is not aware of it and firmware is not
sending probes on that channels.
Due to this, we are seeing connection failures when a device is trying
to connect with hidden SSID AP.
Register beacon hint notifier to the regulatory core so that driver get
notified when there is a change in channel flags. Driver's notifier
callback will send the updated flags to the firmware.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00174

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ec8d5b29bc72..91a957295456 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3534,6 +3534,15 @@ static void ath10k_mac_update_channel_list(struct ath10k *ar,
 	}
 }
 
+static void ath10k_mac_beacon_notifier(struct wiphy *wiphy)
+{
+	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
+	struct ath10k *ar = hw->priv;
+
+	if (ath10k_update_channel_list(ar))
+		ath10k_warn(ar, "failed to update channel list\n");
+}
+
 static void ath10k_reg_notifier(struct wiphy *wiphy,
 				struct regulatory_request *request)
 {
@@ -10286,6 +10295,8 @@ int ath10k_mac_register(struct ath10k *ar)
 			goto err_unregister;
 	}
 
+	ar->hw->wiphy->beacon_hint_notifier = ath10k_mac_beacon_notifier;
+
 	return 0;
 
 err_unregister:
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
