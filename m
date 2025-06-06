Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53DBC5B543
	for <ath11k@archiver.kernel.org>; Fri,  6 Jun 2025 00:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCBpsvz66JjBKHfl3pb3+0oEc8ZCz1XAGiU3khXplyc=; b=RkXdw/69wvl++BZkUOIVFUB20a
	mX+Z9uZ6ckZyzstYTalNa1eiPkcsn0qCMUbYv9ERKzRlpUfsenMXkQgyzKpQGsGEjsUhCLRhgyOeJ
	eLjpe9qzysaoTODp2ttlnQKBzpJUqymLVo51IxW01Fw4+jTolxtyl67eS6PGVxop+T/rbE1q03iLG
	T/nSFYilx7mID6a6VOQ6zXXinR8LlOCfxsaPfpUdrXFBggaEEbpKsP5r6eJNqdzj/03m8WGDfQ6hl
	8uCBvl/ODzqkQFdegZQWDNA00V5ijdXMpozffrPC0PpmeYp/f5w0lMqx+3IJrF+wk7SeWRpaSZg0u
	s1cP4ZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLJp-0000000Grry-1UCJ;
	Fri, 06 Jun 2025 00:52:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNLJm-0000000GrqR-0fEA
	for ath11k@lists.infradead.org;
	Fri, 06 Jun 2025 00:52:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3Gk006413;
	Fri, 6 Jun 2025 00:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCBpsvz66JjBKHfl3pb3+0oEc8ZCz1XAGiU3khXplyc=; b=Ke3xXNgcW81klfiX
	yTeWmKCI00zQfufzYW6QiL4t8t2yop50iWsnVT0qHUISFuPA8K870bYRMK6ENfXR
	cFKpw6y7T5yjEw826rzGaguHudwpOI9kRoBjXAU+Nai+3yMqr9FYaY0Vrl4J7j5u
	lmXbMlJO+m9qq6rG0Zdb55bAXvuST0MCGwCDdDE4SYU9oH7wXfCLCOAPvDETQ9dl
	oQu2q4MJFleyTnSetkR/U0XtrWod/gD5e6yIiHFN1TxKsL5bFQdjTiWbo+tHdiAS
	VIY0ZAWluiZ1XPZ9gcTUjT6v+5i7J5+h0LX1kjTvAHNKS1MYq9C17jdtRJItYiFv
	rOxzYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3171-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 00:52:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5560qHbC020097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 00:52:17 GMT
Received: from [10.133.33.151] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 17:52:15 -0700
Message-ID: <d3ec49ab-964b-4c50-a6ea-534b6c6e336b@quicinc.com>
Date: Fri, 6 Jun 2025 08:52:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
To: Baochen Qiang <quic_bqiang@quicinc.com>, Johan Hovold <johan@kernel.org>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johan Hovold
	<johan+linaro@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
 <50555c1a-c200-4ac0-8dfb-424ff121b41d@oss.qualcomm.com>
 <03354d56-ed21-47e0-a52e-14f559ff3bfb@quicinc.com>
 <aEFupJ_nd9ryaTVt@hovoldconsulting.com>
 <bc2afbd6-2876-4f36-81cf-ad8960588a02@quicinc.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <bc2afbd6-2876-4f36-81cf-ad8960588a02@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bpv9PPtnWrUeLTb_ewSdNnALa-97ssFI
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68423bc2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=DTG5F7EvfL9Zed4wNp8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bpv9PPtnWrUeLTb_ewSdNnALa-97ssFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwNiBTYWx0ZWRfX1MIuAVmexSUO
 1qdaYDVejhNw38eBR9e62NOLMxLP08mq9wxWvNS7AM1z+m4WviqBdAZ+k1oQxTqYVdeQ+DkIMP2
 mG/yPIOqGitTVKYdZWvGRZP4BgFio9LPioqMYC4V4308UQTsV0Rv3R0OdVIowYTw7zAoAnEB6x0
 YdQxK18tYe7Hoz0PeXgXQtDQ//oEZA5OhEDrK6ei7DXLTv3kV6nfiGA5sboH9dOTtEQlgWVDZjP
 3UpNggZh7yuyjTl0CCF14LcGl07FxG3oPH2o+EU9v4CJH112Wuzix/aXWqkmkG+aeQhs1bCn6hM
 J5ALNU3/1MWuxcMnfRHLV8rrsGNLaxKGTEPYq0sCUbgV95jrBuX8AmQwhRsKb1doS1qx+fzmeWS
 bU0rqx2czURCmo8e1K5MEF9lswTWMd3vH2WB07iko6p5APZ2yZaGyLMwwW+bihqzz244O2lM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_175222_214768_2A720A85 
X-CRM114-Status: GOOD (  17.80  )
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



On 6/5/2025 6:54 PM, Baochen Qiang wrote:
> 
> 
> On 6/5/2025 6:17 PM, Johan Hovold wrote:
>> On Thu, Jun 05, 2025 at 12:01:29PM +0800, Miaoqing Pan wrote:
>>> On 6/5/2025 12:24 AM, Jeff Johnson wrote:
>>>> On 6/3/2025 7:34 PM, Miaoqing Pan wrote:
>>>>> We previously had extensive discussions on this topic in the
>>>>> https://lore.kernel.org/linux-wireless/ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com/
>>>>> thread. On my platform, dma_rmb() did not work as expected. The issue
>>>>> only disappeared after disabling PCIe endpoint relaxed ordering in
>>>>> firmware side. So it seems that HP was updated (Memory write) before
>>>>> descriptor (Memory write), which led to the problem.
>>>>
>>>> Have all ath11k and ath12k firmware been updated to prevent this problem from
>>>> the firmware side?
>>>>
>>> No, as this is not a widespread issue, and addressing it would require
>>> modifying the core underlying modules of the firmware. Therefore, we
>>> chose not to proceed with that approach but instead used the workaround
>>> patch I previously submitted.
> 
> If firmware has a concern, how about doing it in host? As I know it is only a register in
> PCI config space?
> 

No, host can only configure the RC, while the initialization of the EP 
can only be configured on the firmware side.

>>
>> I strongly suggest you fix this at the firmware level rather than try to
>> work around it in the kernel to avoid playing whack-a-mole whenever a
>> new (hard to track down) bug shows up.
>>
>> The barriers should be enough, but if they are not then the firmware
>> must be fixed.
>>
>> Johan
> 
This is beyond our control. After nearly three months of effort, we have 
decided to abandon it.


