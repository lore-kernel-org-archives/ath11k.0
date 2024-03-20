Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA7C54E58
	for <ath11k@archiver.kernel.org>; Wed, 20 Mar 2024 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftYAxfkICjzayR6na3uXUiysjfTJYLrKXjK/TKVeJNE=; b=enTzo5WeH479us0nSwPuNBQYS0
	NwnN/0ohB0Ki4DwwThp8CMvPqfWPluoytSZpBcjWWzBCGZbWpyMbUv10nrL8s9HXeAe309Vl1irrl
	BXYRfrRpwDgXs+lyRUkRTY1AqPQdEnUUXVY/gD2W4uPwOtHG6wSgtS4zS60TeWElGH62GVGLhDJk/
	iE2B/kSKx74uqynSIku51Hx/lUQPVQEFjgNFdNrC2O0Zs3uLiM7cAkllXhXqeM68Yzs//WRuFj8mi
	GiUykEhgWb69ojo5JGpHw/G2dY18TeqijOELVf7og5VdNBRZXKvgt3t4guav010RaFloNuaE03OiK
	5VLDsodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmycl-00000000GZE-1ojI;
	Wed, 20 Mar 2024 16:17:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxWk-0000000Haqt-1xOs
	for ath11k@bombadil.infradead.org;
	Wed, 20 Mar 2024 15:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ftYAxfkICjzayR6na3uXUiysjfTJYLrKXjK/TKVeJNE=; b=FvbFzPGCo/xEp6CY8/z53OiAus
	CesZzjp58shpZa3v55gxuUKiKzaSc8N28O2OlpO4Is+oYeMvaoMx5Qtay8xs4Gz4JfRAoDr1WkHG9
	S0EdJo8CRhRJTIYHRfl52YGe4ZS/ZJxV6BagIB83DNUrz5F58khjM6ltsikcOmFI9bg6kD2KcFavb
	p9SDUi4byP4HRY9xLwmDy2h9R6OHwXrbc35vZSLePJLigaCaeQILgPel5No0tBMUTADR6pRRDmqhQ
	z9o6coSVa4nkgZz95ixKIVuJkQ2cyX30e+yTlr/jy8dw6/M+uhXlfHbCkemhJDu1UvV71rte8sp9v
	radBDoKA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxWg-0000000Dm7C-0unc
	for ath11k@lists.infradead.org;
	Wed, 20 Mar 2024 15:06:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KEkBGt005328;
	Wed, 20 Mar 2024 15:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ftYAxfkICjzayR6na3uXUiysjfTJYLrKXjK/TKVeJNE=; b=L1
	p0M6VQ5XRXBs2KBPs51l7VHXL21Kc9/UhAOV6am/LeGt5TNjvNMw0K2Mml/6ZvUo
	mSfbifa4aJBUp7NJSJOJS0McCWVtBKMNQaReJemK5ytYVR1UhZtkycM4iBQGBLZ/
	g8ylZ17tkav0qYVzrzc2SGUC87oYrlCkSS9/ZfrgnG0Wngd8MY4hJVEuaPui6X/S
	OK026MFHM7OKePUfB8Wt2j+WfSkDCmzEthYyiBYMGbE+navwbmwWhlCHMsIE1sl3
	lr/wjPLwhG1RuaaMH7M0/Bi/jjM20rQiz9aff4r8mdnUgdm3mj8E4anPXLVmaE8u
	/V5aksc+MJdjBC9enOSA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wypxq1gy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:06:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KF6V5D031726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:06:31 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 08:06:30 -0700
Message-ID: <bd9a0575-c7e0-4443-9417-7a998e1ae123@quicinc.com>
Date: Wed, 20 Mar 2024 08:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allocate dummy net_device dynamically
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Breno Leitao <leitao@debian.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <kuba@kernel.org>,
        <keescook@chromium.org>,
        "open list:NETWORKING DRIVERS (WIRELESS)"
	<linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS
 DRIVER" <ath11k@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20240319185735.1268980-1-leitao@debian.org>
 <871q85as8e.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <871q85as8e.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AxPF9uDyi_6B6ePxD4VeAmyI9iZYg6Y_
X-Proofpoint-GUID: AxPF9uDyi_6B6ePxD4VeAmyI9iZYg6Y_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403200120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_150647_020151_79E59D3A 
X-CRM114-Status: GOOD (  12.28  )
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

On 3/20/2024 7:32 AM, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
>> Embedding net_device into structures prohibits the usage of flexible
>> arrays in the net_device structure. For more details, see the discussion
>> at [1].
>>
>> Un-embed the net_device from struct ath11k_ext_irq_grp by converting it
>> into a pointer. Then use the leverage alloc_netdev() to allocate the
>> net_device object at ath11k_ahb_config_ext_irq() for ahb, and
>> ath11k_pcic_ext_irq_config() for pcic.
>>
>>  The free of the device occurs at ath11k_ahb_free_ext_irq() for the ahb
>> case, and ath11k_pcic_free_ext_irq() for the pcic case.
>>
>> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
>>
>> Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> This crashes on my nuc x86 test box with WCN6855 hw2.0 when running
> rmmod, stacktrace below. I used tag ath-202403201010 from my ath.git
> tree as the baseline. Sorry that I'm not able to debug this further
> right now.

It seems to maintain the logic of the original that we should not use
alloc_netdev() and free_netdev() but instead should just use kmalloc()/kfree().


