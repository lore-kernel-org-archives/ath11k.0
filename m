Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771BC4332F
	for <ath11k@archiver.kernel.org>; Fri, 25 Nov 2022 04:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMnHtXG/Dk3D8A5JMnCClZ1ZfO7rS1V+6thzfvi3jOQ=; b=hTYSgNXIA8eWMo
	XVp+T6LZ6qYpoioqg/OlHRaaBDzrRASK2zYZlGGEsh6CIs6rUVX4lUKl7wbHyn6ThqryJ0II/upBb
	RYgf2n3WzBW9oB5PE2ruB8C3ToTBwC+dryvN5kQT6UPKgeXSvK/rX26YlB+waTJ+PhGWPXdMZaN+k
	d1+bC+bLRA9Eg9k3BLZyxSod5hnpkRlPkqG+HsdLKnIKjchvkn0kbnadzkiPIlih5Qv2GZ8Q6nOH3
	H0MhTnzn59XtIMTgAdf5u5IH8pwrcmLUVrojZGd2KIXApAC1DgiBd6N35tV48Oo7WXhjOPb5IdA/j
	2SF4TX/6ZllTQeOF/dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyQLb-00Ckl7-6H; Fri, 25 Nov 2022 04:29:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyQLY-00Ckhd-4U
	for ath11k@lists.infradead.org; Fri, 25 Nov 2022 04:29:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP45WRc019124;
	Fri, 25 Nov 2022 04:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vIwYYdTLkm4Dz1cjqrcJJ249NuH12U0Ryj/lqflQooo=;
 b=cj3Bi/SYnEf2vxk5zD1+KBbsUZ+iBPgPXcmU6FNyJdIiCtll0bM9f1W1bTjSNnJQqPKa
 I/2WQD7cV66NmeiMue/9VaX3rRR2lB20GdnBhsyLlVrWpxA1f2I+dnyz2LF7CBW3oWzh
 DB8jL7KIp4XbXvT3ED51l3LO1S00FfAqfC08EhBbFPDLJVunwhcIUQM5oX+3Rl1f+qgo
 mYrvc4sahnvrUlPSGzKRkWz762OH/A4eN0JkUiRKsEvYGRQNs6wRMe1fwWJ8e7aFDS5b
 +umdB54lNwDG4Qza8FbDTLECybekPCWh9b7qxsyWENnc0uoXffjTbvtNqGAoXhNPwFJ7 +g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m21r92x77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 04:29:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AP4TbJj001704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 04:29:37 GMT
Received: from [10.216.51.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 24 Nov
 2022 20:29:36 -0800
Message-ID: <2b0ac3c4-74e3-47f1-6aa7-72f2a4176824@quicinc.com>
Date: Fri, 25 Nov 2022 09:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 0/3] Enable low power mode when WLAN is not active
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221121110359.4652-1-quic_mpubbise@quicinc.com>
 <87bkoz8ica.fsf@kernel.org> <87y1s17j1j.fsf@kernel.org>
Content-Language: en-US
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87y1s17j1j.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IHyjHBarryf0n8J2SuGm1FudWdprzcNt
X-Proofpoint-GUID: IHyjHBarryf0n8J2SuGm1FudWdprzcNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_202952_331132_86087185 
X-CRM114-Status: GOOD (  21.97  )
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

On 11/23/2022 9:35 PM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> Currently, WLAN chip is powered once during driver probe and is kept
>>> ON (powered) always even when WLAN is not active; keeping the chip
>>> powered ON all the time will consume extra power which is not
>>> desirable for battery operated devices. Same is the case with non-WoW
>>> suspend, chip will not be put into low power mode when the system is
>>> suspended resulting in higher battery drain.
>>>
>>> Send QMI MODE OFF command to firmware during WiFi OFF to put device
>>> into low power mode.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>>
>>> Manikanta Pubbisetty (3):
>>>    ath11k: Fix double free issue during SRNG deinit
>>>    ath11k: Move hardware initialization logic to start()
>>>    ath11k: Enable low power mode when WLAN is not active
>>> ---
>>> V3:
>>>   - Removed patch "ath11k: Fix failed to parse regulatory event print" as it is not needed anymore
>>>   - Fixed a potential deadlock scenario reported by lockdep around ab->core_lock with V2 changes
>>>   - Fixed other minor issues that were found during code review
>>>   - Spelling corrections in the commit messages
>>
>> I still see a crash, immediately after the first rmmod:
>>
>> Nov 22 11:05:47 nuc2  [  139.378719] rmmod ath11k_pci
>> Nov 22 11:05:48 nuc2 [ 139.892395] general protection fault, probably
>> for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP
>> DEBUG_PAGEALLOC KASAN
>> Nov 22 11:05:48 nuc2 [ 139.892453] KASAN: null-ptr-deref in range
>> [0x00000000000001f0-0x00000000000001f7]
>>
>> Really odd that you don't see it. Unfortunately not able to debug this
>> further right now.
>>
>> This is with:
>>
>> wcn6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> A bit more information how I see the crash. So first I have all modules
> loaded:
> 
> $ lsmod
> Module                  Size  Used by
> ath11k_pci             57344  0
> ath11k               2015232  1 ath11k_pci
> mac80211             3284992  1 ath11k
> libarc4                16384  1 mac80211
> cfg80211             2494464  2 ath11k,mac80211
> qmi_helpers            57344  1 ath11k
> qrtr_mhi               20480  0
> mhi                   217088  2 ath11k_pci,qrtr_mhi
> qrtr                   98304  5 qrtr_mhi
> nvme                  122880  3
> nvme_core             299008  5 nvme
> $
> 
> Then I just remove ath11k_pci module and boom:
> 
> $ sudo rmmod ath11k_pci
> 
> [  153.658409] general protection fault, probably for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN
> 
> This happens every time, there doesn't seem to be any randomness on the
> behaviour.
> 

Thanks for the help Kalle, this is exactly what I was doing in my tests. 
Unfortunately, I'm not able to reproduce the problem. I have also tried 
with the exact firmware that you have pointed out. Let me see if I'm 
missing anything.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
