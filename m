Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7980AC47079
	for <ath11k@archiver.kernel.org>; Tue,  9 Jan 2024 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px4t59WrYaPZaYlhjnIZwc2r0Kl0CuhxBplCQj8p9YA=; b=jZkKgBSRGO6CPJuy777Yn579oj
	95SJWAUB26zfoN6L3X+ZG2Y1FXrbwTnu9lSRZAg7tfnV2HDo8zKsO4KywJxijP/xysn2NEk6QEHg2
	lgfKFj1zW5KBnJVKpRReYReWrK6mxvwwYhdboC25oFH2U0mWHPDhLsWx29J3EI+pSPcaGJCAE9Dko
	9RA2N63KAE6/2U5DO0oLbiKb/Kbr2O6KmGzh6bz0p1iqyhpfDgP8qBBHYoO0OV5VkQgHfysvObT0O
	MlZQGsNDEz6arWJpR6YypKlxnmoc+FcdvzTwhHmlwb75S6sH/Jpirs+4xFMhYLCuD4YBnVIjr+f7f
	b1ez8s2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFX5-008wfN-1r;
	Tue, 09 Jan 2024 17:04:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFX1-008wek-2z
	for ath11k@lists.infradead.org;
	Tue, 09 Jan 2024 17:04:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409Gxrx9016339;
	Tue, 9 Jan 2024 17:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Px4t59WrYaPZaYlhjnIZwc2r0Kl0CuhxBplCQj8p9YA=; b=J+
	Wq9F6uJHumts9sU9Gqy6hJ6e5dVRRJiKk8ZFo25A7HdzI97Yw/pA82mZFzD0k6PK
	bZwnwXfiZFW2dVFueUtgm5gaBdaqoU4yUBMQH1OnRSTOWEfVoP1vlU3BtS1xNUsu
	AxFokWNpieVbPortzGJUY5XWBlRUzNItl/u9GbZBCOKoSAb8U4n9diGAQQu+flkz
	c7ytSbbpSw5jZV6qdjh2/JsT17Hf3ZVSOfh93PbH5Zgrl8BIz7gB7wVYWCzjLBx+
	gUS8ZhJpua+anV3y2mTHqLPvo4Ss3iL0uAMGhOOHP67It4RUCMx5vX8hpUlcOZfx
	S+rRolx0aqBkuZOoGZng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh85t0ayh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 17:04:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409H4gCo030936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 17:04:42 GMT
Received: from [10.110.103.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 09:04:41 -0800
Message-ID: <c704b3cc-d6e0-4231-9602-47a3e89b2f1e@quicinc.com>
Date: Tue, 9 Jan 2024 09:04:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix IOMMU errors on buffer rings
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Zhenghao Gu <imguzh@gmail.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231212031914.47339-1-imguzh@gmail.com>
 <8734v6ecp1.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <8734v6ecp1.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ukKjeIaoSKmWrfVNik3bwhDetuo-YhJ
X-Proofpoint-GUID: -ukKjeIaoSKmWrfVNik3bwhDetuo-YhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=408 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_090452_192491_0F5BE9FF 
X-CRM114-Status: GOOD (  14.26  )
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

On 1/9/2024 7:41 AM, Kalle Valo wrote:
> Zhenghao Gu <imguzh@gmail.com> writes:
> 
>> virt_to_phys doesn't work on systems with IOMMU enabled,
>> which have non-identity physical-to-IOVA mappings.
> 
> Can you give an example of such system? Just curious where you are
> seeing this.
> 
>> It leads to IO_PAGE_FAULTs like this:
>> [IO_PAGE_FAULT domain=0x0023 address=0x1cce00000 flags=0x0020]
>> and no link can be established.
> 
> What do you mean with link in this context? Are you talking about 802.11
> association?
> 
>> This patch changes that to dma_map_single(), which works correctly.
> 
> Good catch. And virt_to_phys() documentation even says this:
> 
>  *	This function does not give bus mappings for DMA transfers. In
>  *	almost all conceivable cases a device driver should not be using
>  *	this function
> 
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Signed-off-by: Zhenghao Gu <imguzh@gmail.com>
> 
> Jeff, are you ok with this?
> 
> I did some cosmetics changes in the pending branch (removed unnecessary
> parenthesis, reverse xmas tree etc), please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fefa43d63e1928fce6e8c2bb626900e9ce98ca69
> 
LGTM, incorporates the v1 feedback from the engineering team

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

