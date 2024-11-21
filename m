Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F4AD78786
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ84JMVvxDNU5imZVpSIKTsUWtWxpzgrH3qi5fL/ogY=; b=D21VOfquNrlbwnUSlOBLZqNNt6
	gfF+TIWhqL/WYObEO06CSEIrxIQWUcvesn85uwgf8ao/vHpGyTXdxR6gztBTHOUTlBcsbJn3FhJis
	8TP9KTrt5GHH3QEqzNG18jq6EqdzkJKp4IvyUwvJjjShj+Xa/D28xFj9+MIO5kKsPBwzv1P4hWk5T
	8uUvzBQgfrwliEycScaQgSZMM9VEKAKBmOv5mWbmfURYQVFOcAmHcfk8uwQP8nKcgTV4D0wLjkzMf
	+470PS5uMM1pyBENNkw9fb8cfMCvIDpJyC70+M04X/ps39zTJ6017l47o2/p5TvA0L0DfVttoj722
	h2UQOy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nS-00000000Qab-0wna;
	Thu, 21 Nov 2024 16:12:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nP-00000000QYb-0Taq
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 16:12:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALE9h43003085;
	Thu, 21 Nov 2024 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ84JMVvxDNU5imZVpSIKTsUWtWxpzgrH3qi5fL/ogY=; b=Vanujc80bIBTyF1/
	8dwccA9cn8AfhGb4dyg8rnMuytmtxS/CZviXpxXyjXU/dsxRc0lva3Dzj4kf35tr
	Tc0YvbXqudtiM7Vs+bvWsnLcu619yaVlXTato/RfKnbzCPPOfZcWLJecElwHbaCN
	RFo7fZI6qTOHkz5SXrZOu6KgsQzoDenacOXF4ofJ4kTEg48rEMli5ColTLhjVnmy
	cBimsvuK23YrgKMRmMzHxybJJeYEKvZ9S3sIm31QaJ6g34H7WCY2RhLPNA0s6ZgC
	WulHoJcbQbAV9TMa+RoUjG+0JPPu2g3+owd7vvS11MvLUWGX7oICYm17V2LkORQN
	9uQeNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326cs8ag5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALGCccV002126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 08:12:38 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <kvalo@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
References: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: add support for QCA6698AQ
Message-ID: <173220555844.3016923.11617496891402313997.b4-ty@quicinc.com>
Date: Thu, 21 Nov 2024 08:12:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YGUvEwg4ISHiOcLK-NysMRO4M7Oot56a
X-Proofpoint-ORIG-GUID: YGUvEwg4ISHiOcLK-NysMRO4M7Oot56a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=583
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081243_269007_ACA51466 
X-CRM114-Status: GOOD (  10.37  )
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


On Thu, 31 Oct 2024 08:05:41 +0800, Miaoqing Pan wrote:
> QCA6698AQ IP core is the same as WCN6855 hw2.1, they share the same
> PCI device ID, the same major and minor version numbers, the same
> register address, and same HAL descriptors, etc. The most significant
> difference is that QCA6698AQ has different RF, IPA, thermal, etc.
> 
> Follow the approach done in commit 5dc9d1a55e95 ("wifi: ath11k: add
> support for QCA2066"), enumerate the subversion number to identify the
> specific card.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: add support for QCA6698AQ
      commit: e238638e6f24109c0c7639f4a2db023388bd1b76

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


