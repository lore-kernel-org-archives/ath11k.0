Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB155C7EE22
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZUDsuYYoLUgUmmAnB8+yIqLgAT9YvsOtt+KuvL9BdmM=; b=bHE0X2cay5iVC2
	XovTRHZf9OPXtCyyDcDInDnHhrvU6Nj3uycvrbyC8pR9V2zpUsYhxVBzNB8aVD6WLoNdWZtIOntPk
	e/ZPqGb7Bnw8XW/UBaV7/IAR+WzmWE0guXcmWQTl3pCQ9NTB9eeo/kWq5M9qXDobz+5Srgo/jb3c7
	BqGEapIp/MXT8OWYxfa2o7zIBPm/Y04fk/Fzgt/xj486G/bRoFmlpt8aHi1qXF+PCCDe5m7vbWG+i
	ceo12aawNsZ3aOP/Eya0I+6KYSUhGzAmsISJiuiwTo6J8iIEjt/MMo8RhTVT3xV/0JIlFabzcAQYO
	nIDjU5ud2Pl40eFKOa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgfA-005iOv-0q;
	Wed, 10 May 2023 10:03:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgf7-005iNg-2A
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 10:03:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A9EAbN018416;
	Wed, 10 May 2023 10:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=iKcPno5Ld3/IIacK53Vh5vnylkApn0bWDx68Q4Ga804=;
 b=CldQRiUqiLArSLWYfGonokZclzZYGR+OvvomQNDQLiV/rpiu4QpInMk2qGvGrKwGFkVW
 cREsX8EQpSf0TAApdo72jsR7QSov1dorBkWstLuhi8md0IxIK9Dv34qk+Qp/0Tw1rcde
 clFHveZw0cPFRzI5eSEIilTA6taFOM6gC1GGaIAVBZpj92/Wpo53zVyQJxPkbw0Ndfn9
 iOwqgBdLLC9IDVc1Ck5wmUsv84G20W7E8tjdoSNUZu6eY73TwCn3mCYFUfl6upprerhO
 DgOcppGOw3s0UGd4wsym7sinOY8/c05SYUQqWQIvBW8haEA+8+RDokaqB8TBO9RrN/9W Zg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfyx08yg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:03:01 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AA30rq029388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:03:00 GMT
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 03:02:59 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Maharaja Kennadyrajan
	<quic_mkenna@quicinc.com>
Subject: [PATCH v2 0/2] ath11k: Send HT fixed rate in WMI peer fixed param
Date: Wed, 10 May 2023 15:32:40 +0530
Message-ID: <20230510100242.1241752-1-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OTQMvSKfsBqaZmNt__FpuhaQm_BejH4I
X-Proofpoint-GUID: OTQMvSKfsBqaZmNt__FpuhaQm_BejH4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_030309_843272_C80FF31D 
X-CRM114-Status: GOOD (  11.94  )
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

Due to the firmware behavior with HT fixed rate setting,
HT fixed rate MCS with NSS > 1 are treated as NSS = 1
HT rates in the firmware and enables the HT fixed rate of
NSS = 1.

This leads to HT fixed rate is always configured for NSS = 1
even though the user sets NSS = 2 or > 1 HT fixed MCS in the
set bitrate command.

Currently HT fixed MCS is sent via WMI peer assoc command.
Fix this issue, by sending the HT fixed rate MCS in WMI peer
fixed param instead of sending in peer assoc command.

Maharaja Kennadyrajan (2):
  ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and
    change hweight16 to hweight8
  ath11k: Send HT fixed rate in WMI peer fixed param

 drivers/net/wireless/ath/ath11k/mac.c | 93 ++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 17 deletions(-)

v2:
* Rebased on latest ath.git TOT.

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
