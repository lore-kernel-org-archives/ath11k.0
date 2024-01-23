Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B85C47DDB
	for <ath11k@archiver.kernel.org>; Tue, 23 Jan 2024 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8NE1TmX+ioeZyaO34Ntgp9d1wYhUAkwAUHsAbAtjmI=; b=Jv/3liM7NxKZv9W0PE/tizY4rx
	3hQBqz/9OAwX9lqT3/XjF2i/td6FvMbeZ1wQ/OCdiEjiXyWn5+fdjBoX8sfWGfT4ZRnmtQTMYY39N
	StXRQAxiv3MzhHa77r71V3K02z828O4/N8eKyYziMelpfn+SxmqJwQ6C98TQiB1gBrk0gB44SqXsl
	Sst8bRWY72BOJ8VGBNn5UL1gzOm78tLAru+jiYtCR9JdOwhg0spGy98zrg6rs8RW8KrzAsUpuRbos
	tdSSEZ1hddhrrQaqNM6UUoNOO8Q7A/+F+3eI8Jff4SKYbiIp6Ny/i4Ty75kdx3LuWtNejSiRfSxH/
	2Qk+2DOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5py-00EnMJ-0y;
	Tue, 23 Jan 2024 01:44:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5pu-00EnLG-0k
	for ath11k@lists.infradead.org;
	Tue, 23 Jan 2024 01:44:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N0U0Mm025463;
	Tue, 23 Jan 2024 01:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=E8NE1TmX+ioeZyaO34Ntgp9d1wYhUAkwAUHsAbAtjmI=; b=Eo
	Jaf8Q8Rj0bxcln7xflOZo2QPBprDWSLY0hi7a1qHZECDjFSugWN/IT0XZyzESizb
	F/kd7tyzsV6g5adyaGzl0fYtmKDsAxBmvxVr4kE57pcad/Cvz+x5C85PGuWxa+a8
	YeRsV45QFfDqU4wrJ1h0FQJd06IqTP+RcBE3uz65vuwW7x1XLAj5enYnvTt0rp/r
	1dIzdTUM5ZwKtm5V7T6oZ4Ebft/LcKJEFts686lZjlwXmv/o8zOZQZNt3YrLPq0A
	wrnQz5hglKsP8M8GUgSoalNfS4ykIuuMa5lMnvyj3DU1MbP9PoohCu6S1xk/xqAn
	NN60/Bz/mnri75wyGLjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vssw9hdj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 01:44:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40N1iGuv012712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 01:44:16 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 17:44:14 -0800
Message-ID: <1d9b8bc6-b1ef-4568-a265-b4e69bf90aa9@quicinc.com>
Date: Tue, 23 Jan 2024 09:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_qianyu@quicinc.com>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org> <20231130054250.GC3043@thinkpad>
 <87v89cq1ci.fsf@kernel.org> <20231220163209.GJ3544@thinkpad>
 <20231220165113.GK3544@thinkpad>
 <7a31696b-cf2b-48c0-bad3-327e9ce47172@quicinc.com>
 <20240104060904.GB3031@thinkpad> <20240122062411.GA3176@thinkpad>
 <9ac258d7-8a57-4071-af8d-5b07d776135b@quicinc.com>
 <20240122130947.GD3176@thinkpad>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240122130947.GD3176@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BoJykfzKi6HQNpSO-pwKpx0mXEqcdyk-
X-Proofpoint-ORIG-GUID: BoJykfzKi6HQNpSO-pwKpx0mXEqcdyk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_174422_277291_43B2A226 
X-CRM114-Status: GOOD (  27.12  )
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



On 1/22/2024 9:09 PM, Manivannan Sadhasivam wrote:
> On Mon, Jan 22, 2024 at 04:09:53PM +0800, Baochen Qiang wrote:
>>
>>
>> On 1/22/2024 2:24 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jan 04, 2024 at 11:39:12AM +0530, Manivannan Sadhasivam wrote:
>>>
>>> + Can, Qiang
>>>
>>> [...]
>>>
>>>>>> To me it all sounds like the probe deferral is not handled properly in mac80211
>>>>>> stack. As you mentioned in the commit message that the dpm_prepare() blocks
>>>>>> probing of devices. It gets unblocked and trigerred in dpm_complete():
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/power/main.c#n1131
>>>>>>
>>>>>> So if mac80211/ath11k cannot probe the devices at the dpm_complete() stage, then
>>>>>> it is definitely an issue that needs to be fixed properly.
>>>>> To clarify, ath11k CAN probe the devices at dpm_complete() stage. The
>>>>> problem is kernel does not wait for all probes to finish, and in that way we
>>>>> will face the issue that user space applications are likely to fail because
>>>>> they get thawed BEFORE WLAN is ready.
>>>>>
>>>>
>>>> Hmm. Please give me some time to reproduce this issue locally. I will get back
>>>> to this thread with my analysis.
>>>>
>>>
>>> We reproduced the issue with the help of PCIe team (thanks Can). What we found
>>> out was, during the resume from hibernation the faliure happens in
>>> ath11k_core_resume(). Precisely here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/tree/drivers/net/wireless/ath/ath11k/core.c?h=ath11k-hibernation-support#n850
>>>
>>> This code waits for the QMI messages to arrive and eventually timesout. But the
>>> impression I got from the start was that the mhi_power_up() always fails during
>>> resume. In our investigation, we confirmed that the failure is not happening at
>>> the MHI level.No, mhi_power_up() never fails as it only downloads PBL,
>>> SBL and waits
>> for mission mode, no MHI device created hence not affected by the deferred
>> probe. However in addition to PBL/SBL, ath11k also needs to download m3.bin,
>> borad.bin and regdb.bin. Those files are part of WLAN firmware and are
>> downloaded via QMI messages. After mhi_power_up() succeeds
>> ath11k_core_resume() waits for QMI downloading those files. As you know QMI
>> relies on MHI channels, these channels are managed by qcom_mhi_qrtr_driver.
>> Since device probing is deferred, qcom_mhi_qrtr_driver has no chance to run
>> at this stage. As a result ath11k_core_resume() times out.
>>
> 
> Thanks for the info, this clarifies the issue in detail.
> 
>>>
>>> I'm not pointing fingers here, but trying to understand why can't you fix
>>> ath11k_core_resume() to not timeout? IMO this timeout should be handled as a
>>> deferral case.
>> Let's see what happens if we do it in a deferral way:
>> 1. In ath11k_core_resume() we returns success directly without waiting for
>> QMI downloading other firmware files.
>> 2. Kernel unblocks device probe and schedules a work item to trigger all
>> deferred probing. As a result MHI devices are probed by qcom_mhi_qrtr_driver
>> and finally QMI is online.
>> 3. kernel continues to resume and wake up userspace applications.
>> 4. ath11k gets the message, either by kernel PM notification or something
>> else, that QMI is ready and then downloads other firmware files.
>>
>> What happens if userspace applications or network stack immediately initiate
>> some WLAN request after resume back? Can ath11k handle such request? The
>> answer is, most likely, no. Because there is no guarantee that QMI finishes
>> downloading before those request.
>>
> 
> What will happen to userspace if ath11k returns an error like -EBUSY or
> something? Will the netdev completely go away?
It depends, and varies from application to application, we can't make 
the assumption.

Besides, it doesn't make sense to return -EBUSY or something like that, 
if ath11k returns success during resume. A WLAN driver is supposed to 
finish everything, at least get back to the state before suspend, in the 
resume callback. If it couldn't, report the error.

> 
> - Mani
> 
>>>
>>> - Mani
>>>
> 

