Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D64D59F5D
	for <ath11k@archiver.kernel.org>; Wed,  6 Nov 2024 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOz51ybN174/NE4VmqTygjrL3+d/cxjHeOuIyEPAqt4=; b=hiHTK9knm4OUrdSk+a6Rqk0x95
	teJLGJkPPC3bmhRIeuD+LLIn690Q5x1Cg/kAuNk9WNrPyT3bKNVLuYJ8lUu0cBjYlfcUiu1QYgUo/
	1VjN4Rjar60bNu2ojFO0IZh8VtTuhC9HNbHtqfuIC1dgJY0L/n5pMmtgW4kWnZDOvmOFWZhUU0lo8
	U53zcSPBZBqo2cPdzvD+PB4pemr6yINgSN33cV5+PuQqD7tQDqNuFw7QiQ0TTEVBafmMpHzk0Dr7s
	QxdjnhTa82gY++OKiNTBWfjjr219UgqMwQyX3EwJAuyC/03zADnnoN2861nGqDrraATBg1n0pm9Y/
	SGhfWxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kgk-00000004KVM-2BV1;
	Wed, 06 Nov 2024 18:23:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kgg-00000004KUR-2Z1F;
	Wed, 06 Nov 2024 18:23:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Fqx9Q013161;
	Wed, 6 Nov 2024 18:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOz51ybN174/NE4VmqTygjrL3+d/cxjHeOuIyEPAqt4=; b=Il0fUvoIGwYf8Sg7
	/rZgXUsXQBt/b/6vFRnfEkqzWo4bYbsivw1f9w+ApMtviPOBdibb5MPlUuVhUlWp
	9ka8gbVJs/uSpw0HuEc5HsDZVfr68o9j+CHN54mtmeAv4PXJTslxWXq7rzacjhA2
	outhJLqMNO/qo8c7ZLvjLO4JJZGFEUsd9RsIRq6kzW9eoeLyl8WOc9Luiz78FgVy
	3Z+pwc7m4kbMEVcaeDmSXCwPmBtOoEs/wyz4GKnzldBGhLht3K3Y+cq9sjFxM50+
	CESTh1m7pigB9pd+aP2R0wK1PLhtMCNdhBNSQrNAG2sM3VrnInlzK09FJCmWJV6o
	BZkLrA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2ruvt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 18:22:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6IMwst030379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 18:22:58 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 10:22:57 -0800
Message-ID: <5c6a887c-db74-44b4-9d8c-2e412f938b47@quicinc.com>
Date: Wed, 6 Nov 2024 10:22:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Kalle
 Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
        Nick Kossifidis <mickflemm@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Loic Poulain
	<loic.poulain@linaro.org>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder
 Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean
 Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Chiu
	<chui-hao.chiu@mediatek.com>,
        Breno Leitao <leitao@debian.org>,
        "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>,
        <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <wcn36xx@lists.infradead.org>,
        <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T1aSXxpDUQsJs2sd2RbFf2FLmhPdtqyi
X-Proofpoint-ORIG-GUID: T1aSXxpDUQsJs2sd2RbFf2FLmhPdtqyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_102326_779409_AB9CF739 
X-CRM114-Status: GOOD (  12.12  )
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

On 11/6/2024 9:07 AM, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/net/wireless to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
> 
> En passant several whitespace changes are done to make indentation
> consistent in the struct initializers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

I'll let Kalle make the decision if he wants to take this patch into wireless
or if he'd prefer that the parts that have driver-specific projects be split
out separately. If he'll take it as-is, for drivers/net/wireless/ath/*:

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


