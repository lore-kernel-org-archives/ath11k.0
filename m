Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6200AC25B7E
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbeEJKsKCAhTv1gXp+0AoTed6b3pjN5tKrB6zbID+wQ=; b=e3OtkV8YB9lAhFz1d1yVCibrwt
	6owDC95LrOeaVoBuAouJSUny8DSHHeqHAH7XQfuPVZD0Z6QM5AwkRtuE8pd8/3Wo/ZQ9CbE9sigYs
	6OCsq+llJhU6OFfM+GhZYk9Br932jY4iBzaV6nZxIAufWHuesryzdr5237rQRK+cwtacBXr++NLSm
	XCa/SqYh13DQxafPC+KCENEQnUcs3h9kCMydj5RndtpiITAZNf+oFvrDdDCwshvKy6WMcD11jgAaK
	0QU9tgXnhfvsLLNcmPgJFmD2sVZ1lc2+N4XQomWl+WoHib2PprBOhaIjkVP1p9L3Ol2FMYtOHbe9e
	40A4rgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOea-00000001XEb-0Od7;
	Tue, 04 Jun 2024 07:32:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOeV-00000001XAx-2eTr
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 07:32:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4541kdvQ011875;
	Tue, 4 Jun 2024 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbeEJKsKCAhTv1gXp+0AoTed6b3pjN5tKrB6zbID+wQ=; b=Jn6H+Up6/Ri+gUMA
	G0jKRhSYJH3vI7snWw00jAmuI9WQiANam6lSKKiRjdViE92/6sOei9QQ6s+km6II
	c5/zodLuN+yL1DjTGot8huOfv/fqToqxP8jn+fESWfDNvx9tzL1s8p1tt6pw/qUl
	HleQ/Wj+2bWFKbQWRelbgm4IeKjR9+aaRTAJpSgGOChuwrxs4Kt4/mp0EwqDMK3A
	nyLhXDMkVp1Z855pOtyWvnAI/YltHPxrjKlhqGLBUGrtAfi7gVC4xtR5svec6K4o
	YE/uaz4KKBHUeOjJuJ4aTIIEFiXZwK3erhb2KZWKy/6d9OM0DK6/crvPwSJ7qn0O
	Pb8wYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wp1e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 07:32:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4547WB4V028852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 07:32:11 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 00:32:10 -0700
Message-ID: <1673e3c1-4497-48a6-b703-1a50a1c6b243@quicinc.com>
Date: Tue, 4 Jun 2024 15:32:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except
 CCMP
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
 <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com>
 <7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
 <CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
 <CADS+iDUr=kVumMdBAU-AcaE-Q9TPN4K3dCe1C4KW2tqs7ziBKw@mail.gmail.com>
 <f736206e-b3bf-4a78-8ad3-262f6e1f4507@quicinc.com>
 <CADS+iDW+urkeQDuZYYVDsEg=WNGoq5PomAmg1dRLPySPM=2SUg@mail.gmail.com>
 <6b439fca-01a3-4a00-b542-26552dd30874@quicinc.com>
 <CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y4wmBwFD8Du3goaThsIRs8SRmlarU79i
X-Proofpoint-ORIG-GUID: Y4wmBwFD8Du3goaThsIRs8SRmlarU79i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_003215_845284_6904C58A 
X-CRM114-Status: GOOD (  22.89  )
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



On 6/4/2024 3:26 PM, Yaroslav Isakov wrote:
> Hello!
> 
> вт, 4 июн. 2024 г. в 03:55, Baochen Qiang <quic_bqiang@quicinc.com>:
>>
>>
>>
>> On 6/4/2024 5:29 AM, Yaroslav Isakov wrote:
>>> Hello! Thank you for patch! I tried to apply this patch on top of 6.9.3,
>>> but it failed to apply - what kernel version should I use, to test it?
>>>
>> That patch is based on ath-202405301555 tag of Kalle's ath.git:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>>
>> but I suppose it could also be applied cleanly on ToT of ath.git.
> Actually, it seems that when I was copying patch from patchwork,
> something went wrong. I properly downloaded it, and it applied (with
> few hunks) on top of 6.9.3. After rebuilding currently running kernel,
> and reloading driver - GCMP-256 finally started showing same speeds on
> download as on upload! Looks like the issue is fixed, thank you a lot!
Great it can fix  your issue and thanks for testing.

Jeff, as you pointed out internally in that patch, I will repost with necessary tags added.

>>
>>
>>> On Fri, 31 May 2024, 04:18 Baochen Qiang, <quic_bqiang@quicinc.com> wrote:
>>>
>>>>
>>>>
>>>> On 4/15/2024 7:26 PM, Yaroslav Isakov wrote:
>>>>> Hello!
>>>>>
>>>>> вс, 14 апр. 2024 г. в 10:12, Yaroslav Isakov <yaroslav.isakov@gmail.com
>>>>> :
>>>>>>
>>>>>> Hello!
>>>>>>
>>>>>> вт, 2 апр. 2024 г. в 02:35, Baochen Qiang <quic_bqiang@quicinc.com>:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 4/1/2024 10:53 PM, Jeff Johnson wrote:
>>>>>>>> On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
>>>>>>>>> Hello! When I tried to switch my OpenWRT router from default CCMP
>>>>>>>>> pairwise cipher to any other, supported by both my router (Asus
>>>>>>>>> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1),
>>>> I
>>>>>>>>> saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
>>>>>>>>> back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
>>>>>>>>> is good, though, for all ciphers - 1Gbit/s.
>>>>>>>>>
>>>>>>>>> Initially, I thought, that issue with either router hardware, or
>>>>>>>>> openwrt driver - but, I tested the same settings on another laptop -
>>>>>>>>> T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
>>>>>>>>> was 1Gbit/s on any pairwise cipher.
>>>>>>>>>
>>>>>>>>> This issue is 100% reproducible for me, it happens all the times I'm
>>>>>>>>> switching to any pairwise cipher other than CCMP.
>>>>>>>>>
>>>>>>>>> I'm on Linux 6.7.6, compiled from sources on Gentoo.
>>>>>>> I'm not familiar with Gentoo, is there any private changes in it
>>>>>>> compared to upstream ath11k? If there indeed is, could you try Kalle's
>>>>>>> ath11k tree?
>>>>>>>
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>>>>>>>
>>>>>> Sorry, missed the message. Gentoo kernel I'm using is very close to
>>>>>> upstream. I will try ath11.git, and will report there, thank you.
>>>>>>
>>>>>
>>>>> I checked ath.git, master branch - it has the exact same behavior as
>>>>> kernel I used - 1Gbit download with CCMP, 100Mbit download with GCMP.
>>>>> For me, this issue is easily reproducible, it happens 100% if I'm
>>>>> switching to pairwise_cipher (and therefore, groupwise, too) other
>>>>> than CCMP.
>>>> I just submitted a patch which may fix this issue, could you merge it and
>>>> try again?
>>>>
>>>>
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240531021228.2846-1-quic_bqiang@quicinc.com/
>>>>
>>>>>>>>>
>>>>>>>>> Here is my dmesg for ath11k:
>>>>>>>>> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
>>>>>>>>> 0x78600000-0x787fffff 64bit]
>>>>>>>>> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 ->
>>>> 0002)
>>>>>>>>> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
>>>>>>>>> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
>>>>>>>>> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
>>>>>>>>> board_id 0xff soc_id 0x400c1211
>>>>>>>>> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
>>>>>>>>> fw_build_timestamp 2024-01-12 11:30 fw_build_id
>>>>>>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>>>>>>>>> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
>>>>>>>>> Country regulatory setting
>>>>>>>>> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
>>>>>>>>> Country regulatory setting
>>>>>>>>> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28
>>>>>>>>>
>>>>>>>>
>>>>>>>> There was another reporting of that error in this thread:
>>>>>>>>
>>>> https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com/
>>>>>>>>
>>>>>>> I don't think this is the same issue as reported by James there
>>>> although
>>>>>>> same error message. For now I don't know the root cause to that message
>>>>>>> but it's unlikely it causes some tput issue.
>>>>>>>
>>>>>>> Let's wait for Yasoslav verifying it on latest ath.git.
>>>>>>>
>>>>>>>> +Baochen Qiang for awareness
>>>>>>>>
>>>>>>>> /jeff
>>>>
>>>

