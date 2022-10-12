Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B642C433FE
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8BL7pT4XMsUdq0iOO9B09G0Nq74AFuAt8X4cwxcEDs=; b=26t+a2EjIl2PlG
	mFRDGglIpWJqU7WxlZGtyfGV6PQ6rvtzTHfJ+BlDVT3hcc2d1h4xmw8LXeuKqrrG8XZ0PRc+lwZs8
	uexljEm/OMyKj2ii9suPfnvxtlDyRUXZKxHsiXY2mv2iNcshOST1+c2fFrvVVY8AGfNheFjRPkPMt
	+/IQPEhAQ98APFdudNn/ZJA5HrQiL5YiHJEcJ5vRRCBIcSXjqM5Sp0DdoycaC743NVZdXsL4VU2CL
	Z7R/zN0GEy9kpbymgk4r1cfhd9MqbCdFuklqFG1GMhTTTmz6/0POAvXoDT3qVlKgBfYGkP3/egzZN
	zYd0DQJH2FaBLBpL3jkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigbL-00908o-Co; Wed, 12 Oct 2022 18:37:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigbG-00906A-UL
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 18:37:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CGmFme017200;
	Wed, 12 Oct 2022 18:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=PfmdTfu+7hrtSTGCtwExBt+2rQN5x5FFX5NPsKkXV4A=;
 b=evFsRMTwpnAQckKpYfbPsgTwuvUMpC5cCeE7C7XH0n8XeGMPsKnyL9bZ2WVmZZ5FVXtv
 lqAMCro2a5N/p1AAivBMsWgd2zMNw1rnndmFrK9QkjgSj1YvSj+7qnqJCLNNftl5VWje
 x+z0fY5jzTGypaPF+3sUrJ33b5HKHrA4vz5Mm6hVCn2/xaILBR1vTGUGAW1qnlkSnabr
 vyMii1H7Uf7Sz+VbsSwlL3Cozn8I0Db9+gVuzRJg4NzDeadTh5O7V22RhwOe9k2b+knR
 0yP2u/L/ftp7vqI1t25TRQ+f7hNnHXdLwTvbsEeSHdRUTISkQpgLAGm0p6kUkzO5LHFv IA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5rtsj1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:36:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29CIawkD026985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:36:58 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 12 Oct 2022 11:36:57 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH 3/4] wifi: ath11k: move HE MCS mapper to a separate function
Date: Wed, 12 Oct 2022 11:36:46 -0700
Message-ID: <1665599807-12908-4-git-send-email-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1665599807-12908-1-git-send-email-quic_msinada@quicinc.com>
References: <1665599807-12908-1-git-send-email-quic_msinada@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1t0oMk0SWcWMndHhROb2wWExd3p98MlO
X-Proofpoint-ORIG-GUID: 1t0oMk0SWcWMndHhROb2wWExd3p98MlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_09,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_113703_059940_B2E64D75 
X-CRM114-Status: GOOD (  15.30  )
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

Move HE MCS mapper to a separate function and call new function
in ath11k_mac_copy_he_cap().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00356-QCAHKSWPL_SILICONZ-1

Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3a2f3ffe253b..cf827c68af72 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5459,6 +5459,26 @@ static __le16 ath11k_mac_setup_he_6ghz_cap(struct ath11k_pdev_cap *pcap,
 	return cpu_to_le16(bcap->he_6ghz_capa);
 }
 
+static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
+				    struct ath11k_pdev_cap *cap,
+				    struct ieee80211_sta_he_cap *he_cap)
+{
+	struct ath11k_band_cap *band_cap = &cap->band[band];
+
+	he_cap->he_mcs_nss_supp.rx_mcs_80 =
+		cpu_to_le16(band_cap->he_mcs & 0xffff);
+	he_cap->he_mcs_nss_supp.tx_mcs_80 =
+		cpu_to_le16(band_cap->he_mcs & 0xffff);
+	he_cap->he_mcs_nss_supp.rx_mcs_160 =
+		cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	he_cap->he_mcs_nss_supp.tx_mcs_160 =
+		cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
+		cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
+		cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+}
+
 static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 				  struct ath11k_pdev_cap *cap,
 				  struct ieee80211_sband_iftype_data *data,
@@ -5520,18 +5540,7 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 			break;
 		}
 
-		he_cap->he_mcs_nss_supp.rx_mcs_80 =
-			cpu_to_le16(band_cap->he_mcs & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_80 =
-			cpu_to_le16(band_cap->he_mcs & 0xffff);
-		he_cap->he_mcs_nss_supp.rx_mcs_160 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_160 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-		he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
-			cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+		ath11k_mac_set_hemcsmap(ar, cap, he_cap);
 
 		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 		if (he_cap_elem->phy_cap_info[6] &
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
