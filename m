Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECFEC636CC
	for <ath11k@archiver.kernel.org>; Fri,  3 Feb 2023 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkJfakKIhhUPj2nG6mCUlMzkW5/R6LnjUbZjAyUiBpo=; b=yIzwExRg33dGf+
	LLsKrboRokyg5WzzKuX9p9x4ecs/Ggs4sTt5OtPAaDhkyutsfaqxkw/QURxJZIG6VDEg1GCk1mEi+
	0J36Nbr0q/TghI9GFJvsu9Obds41R7yfOx4ywrbl51jier64slggpPa9csljGdMWA0gvTzE6RgaL9
	32+CyGPKZWfO3olrhgGtemHrkteFf+WhUymZw8FUF59npdhDlDCSRxW7n8pnbsEQAsL7pQY2o4bb7
	Ml/F3T4FA5OcKOlk1G1rFTQjiWOHKUolXwh4az34v+q5QjwVIoTf20AthZHxahjOHEann3ZXsqWnL
	zp1q5yhlQFS8aGUiD9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp93-000UQf-2l; Fri, 03 Feb 2023 06:01:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp90-000UPm-Nz
	for ath11k@lists.infradead.org; Fri, 03 Feb 2023 06:01:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313606Nb010422;
	Fri, 3 Feb 2023 06:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=YL4R8cevUVylwS/jEKSjw8UgDUD0vNtrwQhKqbiw4YI=;
 b=FYxkU2xEsR4giF9MprAHNUYcIMFviwYB010bqpFjkDSWRv/qlFKwnyrJ+roynkBakeo1
 qKcjB2TK02dc6XhiPXrPyJplt1g6d6JGTLs7P18AhaAuUljho/LI7N2KM7DW64RcbCri
 NvFqWWqbu9wo3JSt7aVCdPZ7GBdZovs/KG1JFljCUYd+PzD2/1yye3plSJeESG+FA6Vb
 ZSh53NA7I4EjmIOzxV5OXlBd1KThA7Pq3BjeYmfHkOmxTF//HhusYbvIS99s7CgEYM6H
 g/XrTppbQmL8h1iBU0PXbNTMs6rPLO6yJSLEAQ1Og3XBqtrkC5ciO8EwGFEC4voDFNdd 9A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngns4gq4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 06:01:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31361rtc004869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Feb 2023 06:01:53 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 2 Feb 2023 22:01:51 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v4 1/3] ath11k: Fix double free issue during SRNG deinit
Date: Fri, 3 Feb 2023 11:31:26 +0530
Message-ID: <20230203060128.19625-2-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nmgUU8hdCxshkhShvFpKpzDgqSqGYWkR
X-Proofpoint-ORIG-GUID: nmgUU8hdCxshkhShvFpKpzDgqSqGYWkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=731 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_220154_824142_D156D147 
X-CRM114-Status: GOOD (  15.99  )
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

Currently struct ath11k_hal::srng_config pointer is not assigned
to NULL after freeing the memory in ath11k_hal_srng_deinit().
This could lead to double free issue in a scenario where
ath11k_hal_srng_deinit() is invoked back to back.

In the current code, although the chances are very low, the above
said scenario could happen when hardware recovery has failed and
then there is another FW assert where ath11k_hal_srng_deinit() is
invoked once again as part of recovery. Addressing this issue is
important when low power mode support is enabled in the driver
(will be added by a future patch) where this scenario is likely.

Fix this by assigning the struct ath11k_hal::srng_config pointer
to NULL after freeing the memory.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 22422237500c..a20bf2792672 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1324,6 +1324,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 	ath11k_hal_free_cont_rdp(ab);
 	ath11k_hal_free_cont_wrp(ab);
 	kfree(hal->srng_config);
+	hal->srng_config = NULL;
 }
 EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
