Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B50C4828D
	for <ath11k@archiver.kernel.org>; Mon,  5 Feb 2024 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zPu0prb4nccSH9+jtCfIlnlhcNHzdd56+EtrKCVstAA=; b=idb1AkyXoOwIGMpCcgajJJM/1W
	IKMwqYr5djsZIUE1A0HFOzCtcrtDMZ/DUPH1D1p4YDIqw6SNh3lzpTtTuRqqstiw5Pqe25g7SW2H6
	YOtNB5MHL2smxh7ZYR/twWZ5e7dh7PQxlNThmtozuUuryARyv6LJ8/Gt3bei2E6gNJr+izlXZ7f1d
	1trEKEzDCMtYunt28L2EIbYdo8lCEmMTnMatKp4fOjmQuYa0sPDdmu8NxfcLXc25Ng19LA2CRGhww
	G1p2aTLCYmgkETyrFjPu6x0Jkg4kgjlunBEoix7i9/wsYa4/qzfQ+ekC1qbIiV+qnpgAz4GMTLmOK
	6fwc/WBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1dz-00000003xdF-1UPE;
	Mon, 05 Feb 2024 16:16:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1dw-00000003xc9-2aws
	for ath11k@lists.infradead.org;
	Mon, 05 Feb 2024 16:16:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415DHLrI015193;
	Mon, 5 Feb 2024 16:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=zPu
	0prb4nccSH9+jtCfIlnlhcNHzdd56+EtrKCVstAA=; b=dUA+mIgH+6PSd9yqFbs
	Dq77PpcoD3Ewb378a9TkYkGwJCMh2hdKKQTC2IPeowg3lIMtOgH6jQPXWqiK9+JD
	WiRPT5kQBlz2egSssGQUF86+uLhDtEsuvbfqqampYfbAD7PH5PSCW+CKyFHxz+A+
	uE1Gq3HmrZLeiSiHnORljTX31RovF1m4bDyDoVjPSXXObDdoUiFGnCIHCi8gBJg/
	t+2f21nDNYXnc5k0zgUjifmMjx80qT8/VLUyKjJTXZ5U4MCHk6ebgLUrmAfz7wCw
	PA2CQwOCIQIdSIQsi9RUXJa0nKZqRMZjt1Gs4FN3k0G+Qfsd0djUh3w16geRTD2Z
	GQA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2rvj9bye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 16:16:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 415GGJh9006593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 16:16:19 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 08:16:19 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 5 Feb 2024 08:16:18 -0800
Subject: [PATCH] wifi: ath11k: Really consistently use
 ath11k_vif_to_arvif()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240205-ath11k_vif_to_arvif-v1-1-7c41313c8318@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANEJwWUC/32NWwrCMBREt1Lut5HcJJbol/uQUtI87EVsNKlBK
 d27sQvwb87AnFkg+0Q+w6lZIPlCmeJUAXcN2NFMV8/IVQbBheKCIzPziHjrC4V+jr1JNbBw4EM
 rnZJODlCXj+QDvTfrpas8Up5j+mwnBX/tf19BhkxLJY86aGydPj9fZGmyexvv0K3r+gUv36Stu
 AAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cEReiFH1q4CrXsPbZ169JR6Zzt-mpO22
X-Proofpoint-GUID: cEReiFH1q4CrXsPbZ169JR6Zzt-mpO22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=915 bulkscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_081624_699080_5B1FBF24 
X-CRM114-Status: GOOD (  11.20  )
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

Patch 9476cda44c13 ("wifi: ath11k: Consistently use ath11k_vif_to_arvif()")
previously replaced all open coding of the ath11k_vif_to_arvif()
functionality. Subsequently two more instances of open coding were
introduced, one in patch 92425f788fee ("wifi: ath11k: fill parameters for
vdev set tpc power WMI command") and one in patch 6f4e235be655 ("wifi:
ath11k: add parse of transmit power envelope element"), so fix those as
well.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index bbf4d1f4d310..18b949352547 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7585,7 +7585,7 @@ void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
 				  struct ieee80211_chanctx_conf *ctx)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ieee80211_bss_conf *bss_conf = &vif->bss_conf;
 	struct ath11k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
 	struct ieee80211_channel *chan, *temp_chan;
@@ -7758,7 +7758,7 @@ static void ath11k_mac_parse_tx_pwr_env(struct ath11k *ar,
 					struct ieee80211_chanctx_conf *ctx)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ieee80211_bss_conf *bss_conf = &vif->bss_conf;
 	struct ieee80211_tx_pwr_env *single_tpe;
 	enum wmi_reg_6ghz_client_type client_type;

---
base-commit: 2a71528427c635f0a8bff704b2e62ce81c641d6f
change-id: 20240201-ath11k_vif_to_arvif-f50b63d43d3b


