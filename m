Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD0C43219
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOKbYOhE7fDmZrGac279N4Qzl+CP/Ebn3KUcGkIHKto=; b=ypgfgxuy3/KyHu
	eiscG69sZb5OyEFTKfI/DKdxb3gwzKQJXXhYgX4JdhERUWBuoCjyf29IAcQoavBbet/i5YPz5PnVn
	QISeNS7k/ICzCYhGvld5ISRTa1ZhWdgTmXKLl+umYNDLe++BXNk6KQkT7iZgD6j3FIwH49r3tJMsf
	kELbXImEcEQgSEjJ0gFBULe+UIc1C9ymgpr8VDcgBxSsOtrLMb4I4Uct2CQ3QtkVaK2lSzohmUEn8
	TjbbWlkEHjn8+0siA2W5e4B1N2PIJ01uXzBpRMeU8eBqFmDlHrWSNSQCpKsJlMaBFzSeZugLEdyBs
	EU5ipkG26xw/HStPMsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTEJ-009c3x-VH; Tue, 22 Nov 2022 13:22:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTEG-009c17-Vg
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 13:22:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMD3HSh024017;
	Tue, 22 Nov 2022 13:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=XvPDvexHjdkZuW+GfPetRzXGabeWI14PKXBI4NtdY8M=;
 b=m1opzLLAvRX4Mjkxeif7GK6TzZ3iQ0LI2hRRiIUbgS9IrIWxt3YwjabnRJinfoALpdRY
 aSFhf98SsiJkIvwqtLxOowOL/HGr73aV5H7Ngl1Z7CUzSKspJVJUat8EJ5jBKIDKd+/O
 dFq4XfsXyKjHDi8kh/Xs+DzNtdKKpsbW5ScM+DcWGbcVLFUR7HpT/U7aUSOvajHG0qCe
 HojgnQItfkZQBPdYOUxzxWGCtpCrOq41oGvL59kgZkCI9Dk5HYtMfUhocHwAxkH/NXdj
 jTwqEeVSDnuOhkQeFino+D64Rvr1au3xFEUvm/sVFPpcSvXLY5e+lUYoqtlxEs+OPdHt xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0ptss3yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AMDMOe5004081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:24 GMT
Received: from kathirve-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 22 Nov 2022 05:22:22 -0800
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: [PATCHv2 8/8] wifi: ath11k: add ipq5018 device support
Date: Tue, 22 Nov 2022 18:51:52 +0530
Message-ID: <20221122132152.17771-9-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221122132152.17771-1-quic_kathirve@quicinc.com>
References: <20221122132152.17771-1-quic_kathirve@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6Qc3mtgOlsMnQvUiQPrsW1L0s3NU7TGX
X-Proofpoint-ORIG-GUID: 6Qc3mtgOlsMnQvUiQPrsW1L0s3NU7TGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=902 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052225_046879_99E3D255 
X-CRM114-Status: GOOD (  14.55  )
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

From: Sriram R <quic_srirrama@quicinc.com>

ipq5018 is a ahb 2ghz device, enable the compatible support for
ipq5018 in ahb.

Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index e6d30ca38c88..2142c60de9d8 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -32,6 +32,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	{ .compatible = "qcom,wcn6750-wifi",
 	  .data = (void *)ATH11K_HW_WCN6750_HW10,
 	},
+	{ .compatible = "qcom,ipq5018-wifi",
+	  .data = (void *)ATH11K_HW_IPQ5018_HW10,
+	},
 	{ }
 };
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
