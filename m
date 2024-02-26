Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C2EC54798
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 02:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bIzrQILyw2B1FAgettwxaEyCsaN0lYSJppG7Dh4O4Y=; b=WVH3C2lvCgYp9TH/ZzSkEagoYI
	Yl26wXOEtcdHADphwmQEqIv7Z31c+cb9fxaCzodYL/dSz1J1Oogiu+6pL6Mc8JsKKrtHkl1LQL6jR
	KHfWYpoSro9Q8M4wKE0DPSF0UXIegye16f2Y0GoVIh6SlKZJf5bX4uGGCVGy2Am7ix0wzEPO0OTbY
	3h7ZSneVsnBRuHaeSPQHE/Ay1+MSIQ0D4LeTmtGgz6WLuOBLtEnOpde0juXgr3KbGM3sVqYAXe82v
	LBiK03on60Kl4zt6EMBiXRZe70NQxr5regHjftU6izyDqS9chiVF3kFZzcDmR4hSmdr0YGJPe5f20
	htk/lZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQR8-0000000G8Qw-350D;
	Mon, 26 Feb 2024 02:09:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQR5-0000000G8QL-1mvi
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 02:09:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q1gqvJ027266;
	Mon, 26 Feb 2024 02:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8bIzrQILyw2B1FAgettwxaEyCsaN0lYSJppG7Dh4O4Y=; b=VB
	PbqCW2G/lW2vqdFsxTwFl6n1uIrGAdi8gMGPxj0xiHxI+Qe7fQUUnKL6nTlZC+Yh
	5iJlrJKNJo8TJfwGkjTdzehF9g5uUBO9l4oQCTSjPZDlbsdAJ8tOiffWd18nqqHk
	TZRzEOw49/rN81BFAnlPlSPpXQDp5kw5FBUaJy0UfRqH6FZ48rEdY96z5nrLQ6Qx
	zreuiFBv8rV9zVgZX0jAZKEPO37dFm1GVuFoDP0EhCeGs30JH3DKC+gHY9KHUnQh
	bW03IaxIFOqtTMTUGQHwF2oZ7+q03VA5b9PONgmVKponD8xyJwxcj14YVs6Zg5hB
	R/EvucTgatRvml/npmGA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf8uban15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 02:09:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q29OkM029419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 02:09:24 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 18:09:22 -0800
Message-ID: <abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
Date: Mon, 26 Feb 2024 10:09:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kalle Valo <kvalo@kernel.org>,
        Linux Wireless
	<linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, LKML
	<linux-kernel@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
 <20240222054739.GG3374@thinkpad>
 <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Unxksi7IMwzeBv7ib7QW4EKj_IBRIq6Z
X-Proofpoint-GUID: Unxksi7IMwzeBv7ib7QW4EKj_IBRIq6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_29,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_180943_642879_321C4C32 
X-CRM114-Status: GOOD (  19.53  )
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



On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> On 2/22/24 06:47, Manivannan Sadhasivam wrote:
>> On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
>>> On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
>>>> Hi,
>>>>
>>>> starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
>>>> on my laptop, which is Lenovo T14s Gen3:
>>>>
>>>> LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
>>>> ath11k_pci 0000:01:00.0: wcn6855 hw2.1
>>>> ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
>>>> ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>>>>
>>>> The problem is an allocation failure happening on resume from s2idle. After
>>>> that the wifi stops working and even a reboot won't fix it, only a
>>>> poweroff/poweron cycle of the laptop.
>>>>
>>
>> Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
>> Jeff will figure out what's going on.
> 
> You mean the firmware is supposed to power it down/up transparently without
> kernel involvement? Because it should be powered down to save the power, no?
Let me clarify: from backtrace info, seems you are using a kernel with 
the hibernation-support patches [1] applied, which are not accepted yet 
to mainline kernel or even 
git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.

So this is why you see WLAN firmware is powered down during suspend.

[1] 
https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/

> 
> But I just found out that when I build my own kernel using the distro config
> as base but reduced by make localmodconfig, the "mhi mhi0: Requested to
> power ON" and related messages don't occur anymore, so there's something
> weird going on.
Here your own kernel doesn't include the hibernation-support patches, right?

> 
>> But if you can share the dmesg after enabling the debug prints of both ath11k
>> and MHI, it will help a lot.
>>
>> - Mani
>>
>>>> This is order 4 (costly order), GFP_NOIO (maybe it's originally GFP_KERNEL
>>>> but we restrict to GFP_NOIO during resume) allocation, thus it's impossible
>>>> to do memory compaction and the page allocator gives up. Such high-order
>>>> allocations should have a fallback using smaller pages, or maybe it could at
>>>> least retry once the restricted GFP_NOIO context is gone.
>>>>
>>>> I don't know why it never happened before 6.8, didn't spot anything obvious
>>>> and it happens too unreliably to go bisect. Any idea?
>>>
>>> I've asked the development team to look at this, but in the interim can
>>> you apply the two hibernation patchsets to see if those cleanups also
>>> fix your problem:
>>>
>>> [PATCH 0/5] wifi: ath11k: prepare for hibernation support
>>> https://lore.kernel.org/linux-wireless/20240221024725.10057-1-quic_bqiang@quicinc.com
>>>
>>> [PATCH 0/3] wifi: ath11k: hibernation support
>>> https://lore.kernel.org/linux-wireless/20240221030026.10553-1-quic_bqiang@quicinc.com
>>
> 
> 

