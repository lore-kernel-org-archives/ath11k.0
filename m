Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0D0C76196
	for <ath11k@archiver.kernel.org>; Tue, 28 Mar 2023 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+dVXpzqIXTZnMCW0Mb0+UpACoNGkpt7RRz7QZE8nTq8=; b=xOuYDm5Lq2WQg9
	cVT+L5AdYYA8riZwQc4rF9IT3fnjwR4gtiOJno2dhlolMPTG1ZHOw1VEg7daC1waDM4OoHrhFyA3J
	adheUaX4C2O5WYfrL3AOLcUaslkm7/gdNjcuMylNd0BYLBXaTpX53Z4DcNOFXd4doV60/zk0jyKE5
	1bnfbPN/dASA3MUFrtftDb3UuE4HCqAxJ/ATyGWyDdbIDx6O9nU+UCI/k19zN92ta7x9Q82ShIbmZ
	EPpufQvwB+UiLLL33SbUqXNDedSz8lbGdII+34J0Yrl73GShTFVi849vYBRbqbigJiniLBLo8zOyo
	NTEOLqL6o7HQFSzZAUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7bu-00EBXx-1j;
	Tue, 28 Mar 2023 11:35:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7br-00EBXN-2E
	for ath11k@lists.infradead.org;
	Tue, 28 Mar 2023 11:35:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SBEbFc031188;
	Tue, 28 Mar 2023 11:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=BPxenJ7NG7cfHvJ/DRwx+N5WCKaHQ4nlo6j69AJBfAU=;
 b=lF14SXaet67bcmHMXhDai77v/RqpH0dzExlRNeaaV/AsR9F+YsFmZaChNy68LvVKcF6h
 VZ6buZY2MQN3yfhmIe7NHA2lsoleeUfNEL7TCVz7bFU2NggqFjf8yKNt7H70Etgq5VOX
 AGotC7oJuQF6dfAHHi9Lo6AKz4SnacoQZBFks2j360ob9RR4orsTtMf171dDgtgoqyhG
 b6PzE3Du73AWfq4RSUnqtwxLAnY77BSIpCmsfarpxSrEc8aHoUJfb+qLZaQipbTKARuV
 hjLKJdQTUnv9P4QMTcZ3H3Jx+9XI4QZRKQkuL7qe8nhznEcaiHNW+dTVqHRvx1ydLQkx Og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkx4t86wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:35:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32SBZOmM025770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:35:24 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 28 Mar 2023 04:35:22 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <--cc=linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH] wifi: ath11k: Add SAR support on WCN6750
Date: Tue, 28 Mar 2023 17:04:55 +0530
Message-ID: <20230328113455.11252-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4r97jPL8TE-bJWCyOt7Eq_2WWZ4QdqOw
X-Proofpoint-ORIG-GUID: 4r97jPL8TE-bJWCyOt7Eq_2WWZ4QdqOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=878 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_043527_870402_8ED61EF5 
X-CRM114-Status: GOOD (  16.22  )
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

Enable SAR support on WCN6750. Currently, SAR is enabled only on
WCN6855, enable this for WCN6750 too. This functionality gets
triggered, when the user space application calls
NL80211_CMD_SET_SAR_SPECS.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 75fdbe4ef83a..fb9dc8220bba 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -599,7 +599,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.current_cc_support = true,
 		.dbr_debug_support = false,
 		.global_reset = false,
-		.bios_sar_capa = NULL,
+		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
 		.m3_fw_support = false,
 		.fixed_bdf_addr = false,
 		.fixed_mem_region = false,
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
