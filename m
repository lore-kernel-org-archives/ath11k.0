Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A21BC4332F
	for <ath11k@archiver.kernel.org>; Thu,  8 Dec 2022 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhA564WcFt0orqEN2/X1AANSTAw6L3XObA9H+U+9vnQ=; b=qfrZIDc2Aa78kk
	0BAna4SfAqc3SS9UfmUyaAKyJIIrLWMABYJie4UcWolcJVqMKtvjU1v9mzNgu9GIFQc3LqxEwBZuK
	VFQU6fcasGKltG7kbd4peGnyL2uOslNMYqezVo0MaN15d9EjaWXAyAFL/A7yyXs+FAMiptD2Yiqly
	kgCbvQqgLEH8QU60+U5UQrpGavWNaZtC7E+cM0iuyc1MuXjBsz0BJfICpqA5dGdc8NokFhwcHSxcR
	grz5zGZAKa3spfuBRJMzmCEvVe2MQe5PxmkGbjXc1GZwgRia/UQymYKwytlqK/CBpPKWIx1SYMuKs
	/sZE+VgtGdv//dJA1xjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ExZ-00EnMU-3k; Thu, 08 Dec 2022 11:21:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ExS-00Emoa-0N
	for ath11k@lists.infradead.org; Thu, 08 Dec 2022 11:20:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B86s6ik000309;
	Thu, 8 Dec 2022 11:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6NuTgwIr4E0F2m0GO6n5BNfZhAIKaGVhnQfQOog/F8Y=;
 b=oVmEzv/Q1G8IfGDAfykvV38YAME5fQC0s/HgN4a1J4vnfYZtkHFDHRgojJ7ObiL/WKgY
 bR6+6elzSr3Ba1/NgHGuJRksLmw2WGAH2toRAv5NNoE/StaXXdorMfct7FNZd6XagSxK
 k8yen0ePVyVBE8AvvbhMucE9yBQl0GUQwpkn8ewlTSdU2u33/iGtNBqGGXyDcnDmbg9M
 2TmHWE5ojdHLRqNm7oCYo4terUDYyt8ydJleCMt8nfHinpCfekCLY3hIwQ7xrVpjKN9W
 iWs3SUy2IAnRtSIVqO0SUQ35rSs83eJMuHAG4tpcKUzEFlcZT9oi1cHMyiha2bHNfXOG 5w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3majt4c8e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 11:20:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8BKm6c030065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Dec 2022 11:20:48 GMT
Received: from [10.216.27.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 03:20:46 -0800
Message-ID: <692bc21e-8d65-e3b3-74e3-bc6223cb1194@quicinc.com>
Date: Thu, 8 Dec 2022 16:50:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 0/3] Enable low power mode when WLAN is not active
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221121110359.4652-1-quic_mpubbise@quicinc.com>
 <87bkoz8ica.fsf@kernel.org> <87y1s17j1j.fsf@kernel.org>
 <2b0ac3c4-74e3-47f1-6aa7-72f2a4176824@quicinc.com>
 <87y1ri1gay.fsf@kernel.org>
Content-Language: en-US
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87y1ri1gay.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gzal-YRh4mRE_B2AspNT0rIeKUwN5ha8
X-Proofpoint-ORIG-GUID: gzal-YRh4mRE_B2AspNT0rIeKUwN5ha8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_06,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_032054_126551_F7216821 
X-CRM114-Status: GOOD (  24.60  )
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

On 12/8/2022 1:24 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> On 11/23/2022 9:35 PM, Kalle Valo wrote:
>>
>>> Kalle Valo <kvalo@kernel.org> writes:
>>>
>>>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>>>
>>>>> Currently, WLAN chip is powered once during driver probe and is kept
>>>>> ON (powered) always even when WLAN is not active; keeping the chip
>>>>> powered ON all the time will consume extra power which is not
>>>>> desirable for battery operated devices. Same is the case with non-WoW
>>>>> suspend, chip will not be put into low power mode when the system is
>>>>> suspended resulting in higher battery drain.
>>>>>
>>>>> Send QMI MODE OFF command to firmware during WiFi OFF to put device
>>>>> into low power mode.
>>>>>
>>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>>>>
>>>>> Manikanta Pubbisetty (3):
>>>>>     ath11k: Fix double free issue during SRNG deinit
>>>>>     ath11k: Move hardware initialization logic to start()
>>>>>     ath11k: Enable low power mode when WLAN is not active
>>>>> ---
>>>>> V3:
>>>>>    - Removed patch "ath11k: Fix failed to parse regulatory event print" as it is not needed anymore
>>>>>    - Fixed a potential deadlock scenario reported by lockdep around ab->core_lock with V2 changes
>>>>>    - Fixed other minor issues that were found during code review
>>>>>    - Spelling corrections in the commit messages
>>>>
>>>> I still see a crash, immediately after the first rmmod:
>>>>
>>>> Nov 22 11:05:47 nuc2  [  139.378719] rmmod ath11k_pci
>>>> Nov 22 11:05:48 nuc2 [ 139.892395] general protection fault, probably
>>>> for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP
>>>> DEBUG_PAGEALLOC KASAN
>>>> Nov 22 11:05:48 nuc2 [ 139.892453] KASAN: null-ptr-deref in range
>>>> [0x00000000000001f0-0x00000000000001f7]
>>>>
>>>> Really odd that you don't see it. Unfortunately not able to debug this
>>>> further right now.
>>>>
>>>> This is with:
>>>>
>>>> wcn6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>>>
>>> A bit more information how I see the crash. So first I have all modules
>>> loaded:
>>>
>>> $ lsmod
>>> Module                  Size  Used by
>>> ath11k_pci             57344  0
>>> ath11k               2015232  1 ath11k_pci
>>> mac80211             3284992  1 ath11k
>>> libarc4                16384  1 mac80211
>>> cfg80211             2494464  2 ath11k,mac80211
>>> qmi_helpers            57344  1 ath11k
>>> qrtr_mhi               20480  0
>>> mhi                   217088  2 ath11k_pci,qrtr_mhi
>>> qrtr                   98304  5 qrtr_mhi
>>> nvme                  122880  3
>>> nvme_core             299008  5 nvme
>>> $
>>>
>>> Then I just remove ath11k_pci module and boom:
>>>
>>> $ sudo rmmod ath11k_pci
>>>
>>> [ 153.658409] general protection fault, probably for non-canonical
>>> address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
>>> KASAN
>>>
>>> This happens every time, there doesn't seem to be any randomness on the
>>> behaviour.
>>>
>>
>> Thanks for the help Kalle, this is exactly what I was doing in my
>> tests. Unfortunately, I'm not able to reproduce the problem. I have
>> also tried with the exact firmware that you have pointed out. Let me
>> see if I'm missing anything.
> 
> I tested this more and patch 3 seems to be the one causing the crash. I
> didn't see this when patch 1-2 were applied.
> 
> The crash happens in ath11k_dp_process_rxdma_err() in this line:
> 
> 	srng = &ab->hal.srng_list[err_ring->ring_id];
> 
> ab looks sane to me (0xffff88814c960000) but err_ring is set to 0x200.
> Does this help?
> 

Thanks for your time and analysis on the bug.

 From the callstack() that you have shared earlier, it looks like 
ath11k_dp_process_rxdma_err() is called from dp_service_srngs which is a
napi poll callback.

To me it looks like the napi handler of the driver is getting called
after the srng resources have been de-initialized during rmmod.

I have closed examined the changes in patch 3 (I'm still doing it). so 
far, I could not find anything that could trigger this kind of a 
problem. Since NAPI is disabled upon rmmod, NAPI poll should not be called.

It's quite not clear if I'm missing something.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
