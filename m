Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE2EC41513
	for <ath11k@archiver.kernel.org>; Mon,  7 Aug 2023 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSOeVdOT6o06iZK06xIoKOiYtzXOmGGv9X1n0Q4AfbM=; b=uSISw6xGPckuVR
	smyuKpNaOrf8UaOOBsqUyzpkyBv+IDK0KRuXyebrPqwPYqpVXsqov4UkJq1qxHh0f/1wtyyorkNeb
	VYVmGytdhMkL3gR/Q6r4GU8cAXU0z4ks7ZSPytH8K+IbaHNvgSvXLeyxvukdwwYFT2wUbI/gK7qCv
	OoqeTqfJGqNDdk1mNV/WQ+xmo6vnuhynam8M6rJ00PkZ0VpNU0C2kdPBr37IYte//7q7D9kIf/9A6
	avfldWlteeCpwCC5JCWsvjJ76IFv65aJ1hgzQDT6/tDjscTdNb2yayr3L3KdWr+rfZpch8xZgmz62
	37cC9yuvBGIip1JPWjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT2BB-0003ko-1Q;
	Mon, 07 Aug 2023 15:29:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT2B8-0003jt-1m
	for ath11k@lists.infradead.org;
	Mon, 07 Aug 2023 15:29:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 377CcRT9016019;
	Mon, 7 Aug 2023 15:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XDVp4yIS6H3DU/PdHXRnE7iJfZoWc07EmXG/X+6WIhM=;
 b=as6Q3TCKWsmDLPKs+5ds8vsLJxel/vxK1T1Nzfb+KOvW0YtetaxW3QIGvKtcEOo/zdU6
 uXsvgoFNZfYdCHS5kQUzPeO2VjpgrtDQ0gLyAepDFLOEl04GeVGu/L8kWJuC1tFPkeqM
 12YiQK99b3XKrGDETJlndEDzwPtaTzaOHkq2rFBvV6Kt0wi6Z2uz2q4wUcbpo1q4SUuW
 eaVlLE4JqePEJp3EeWicICSwIDh49iqSzECZP9yKAapsrEcMkvvk0uvXVYwJGOU0Ayyu
 P3Fjhu9tWWA4ah153XTVduJ8QYo1DIAiuE7fwZkqKPdAUZOtyZjM1iAW/irsU+L8Op+p Xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9f6pkqbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 15:29:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377FTThM022322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 15:29:29 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 08:29:29 -0700
Message-ID: <fcb783b4-95e9-24d8-a656-b273a79598a0@quicinc.com>
Date: Mon, 7 Aug 2023 08:29:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        Baochen Qiang
	<quic_bqiang@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
 <87fs70hlel.fsf@kernel.org>
 <545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
 <897b61ea-36d2-1ab4-9c60-9bdfd2d9cad7@quicinc.com>
 <fa70ca5e-001b-3c6b-dbc2-2853f8fc2f72@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <fa70ca5e-001b-3c6b-dbc2-2853f8fc2f72@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B2ZlFzsALB1gEz0fHcVJFuAm0JQojY3B
X-Proofpoint-GUID: B2ZlFzsALB1gEz0fHcVJFuAm0JQojY3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_16,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=685 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_082954_602315_04505316 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/7/2023 3:16 AM, Manikanta Pubbisetty wrote:
> No impact on WCN6750.
> 
> Tested-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Can you provide a Tested-on: flag that Kalle can add to the commit text?

> 
> 
> Thanks,
> Manikanta


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
