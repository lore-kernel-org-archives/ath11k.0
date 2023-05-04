Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A9CC77B78
	for <ath11k@archiver.kernel.org>; Thu,  4 May 2023 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuM75jbxCrfxV39eWhvkinT3W+5MLfCag66jGlMafBc=; b=XcHa/DVEaMxSX7
	abKAnGsmdXZmsw79ZZPBS4lH6QzkuIxLf4BSrVHUm/UMeCSFq7IbXRxY+tATY7LVW9B2ezwSoIBCK
	06fpxcnx28mER8fqJlz2jRF9EvH4rBqe6dNmHxd5bztZlgah+q1IgcplEb5fn1LV0s4niFFi3JXPr
	1Jy9aQlodnWOdmomy5miDIHmihV+R+9BatgQKtooabaGkG3O1afn1J8/ODR0mTc+lFXRbzHcXMQdQ
	DNc2OfK0LIndr6bqFIPPO6xd9ZN7l2nGvxrn+qERTGcNECIHB52wICXYT3zHaBrCIHJK1BYJLnZy/
	y+ynv8Ui4cPu5L6qc+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puVC7-007Gm6-0G;
	Thu, 04 May 2023 09:24:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puVC4-007Glg-11
	for ath11k@lists.infradead.org;
	Thu, 04 May 2023 09:24:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3449NhWK001438;
	Thu, 4 May 2023 09:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=U1zMZzPrvGfv84Zps+Dnkr3c9elj2CUX/+Piidq2f90=;
 b=lonVkg+WcQYwhhTSNs2QEMd88mC8eZkn8OwDxG/0WakJnpJNfFAmcgaKn4z32R4hT4+Z
 VKR9VV8vGLYNNILHa6yd5L8kQkrCP0l8bd6PnGWmlVdRIUSIEda2dXx25fFdoi1Dei3I
 d8HNf5E//dpBBMnSlu6suzbN2nR7ZLrfncQMthnqUsYlyVosiRoRkguz9T+cQ4VjYMeE
 oR80fQ4ICTpzPKtw1wbWbO4xExkgPXmu5g7BDhD10y7f7sVs1My9+S9qPRWp9oaSq4vc
 bVwMPKHMtLhbDno+X1IscSVkZczNGlcrdPYRa1xWQKOWof62DejK7P5b86bjd4Lm+OYs xw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbvghhffq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 09:24:07 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3449O7vq031474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 May 2023 09:24:07 GMT
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 4 May 2023 02:24:05 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Maharaja Kennadyrajan
	<quic_mkenna@quicinc.com>
Subject: [PATCH 0/2] ath11k: Send HT fixed rate in WMI peer fixed param
Date: Thu, 4 May 2023 14:53:49 +0530
Message-ID: <20230504092349.3542530-1-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iCMkK-13YkoM-rtU2E5EN3luBUmq-ukA
X-Proofpoint-GUID: iCMkK-13YkoM-rtU2E5EN3luBUmq-ukA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_06,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305040076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_022408_355955_BF03C4BA 
X-CRM114-Status: GOOD (  11.62  )
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

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
