Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81565C48BF6
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8qw/W7WciIoIxmEDrFyAyTEWAtj07O6Yyg0bIXdv3Y=; b=eTr33rNxu+5RH8XPsiQY3oXFts
	6OOgcvTuM4Gm/ec1qGlRIwe6hFVTwOoXTAgMTs8Oqpw1JKg1iRmHwfoNxg/6QZHnZy3dFuUyh9eBR
	CBLjlovbH+msijAdoY78UHgff3BL4YefpxjKiVedvRHGIGxPzZfmsnkh4NvEIb4XFJsZckFvf6SMP
	WBceucxzjP+diLVvL7/BG6wkCSv2zMmXfNbGT7AYpkvErN79eoSB+NsDH50gWOywo9LDP8r3b7OWj
	W/5baOHee6/8fzp7mM6KPCMoAm2Sra5Wlpb2HEtc5knXUmB0LiALSawz1AlQ8jAuqz9+CL9UE9rB2
	2GTyqFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcdY6-0000000H1rV-2rLc;
	Wed, 21 Feb 2024 03:45:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcdY4-0000000H1qm-01GT
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 03:45:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L2CaUa023429;
	Wed, 21 Feb 2024 03:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e8qw/W7WciIoIxmEDrFyAyTEWAtj07O6Yyg0bIXdv3Y=; b=ak
	CkwgPCubLrbab9B+4JVexFPSeMR4psr8E6E1Q+kxuf5eL1SG4YJEn+7BQ9DQthVv
	uv3UpPkalO++zKXlhrjPs4zQXiCj1L4w0cVGg7N+le8UhceVMlapjhtozqF1BtIL
	hkDTcOOihPug/TeRWnFTNH3rjcfpi7MLgT0+8pMRRSlqz0Wkoa5cmrvmm3Jqk+EK
	llf/0YOXC9wUlq5w8S2rpdF8iAcKTbevyyaeGL34TVzkMrV+yAIhv+25LOcZ2gEg
	M2DjM7LQFxpTc1BUXQnKnW0MxF84o6Qv7iTXkrFUuMJhpqtx/ixl+F+TWcZnJNmG
	HIe9A1AOEXObN9PAh3TA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s8vex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 03:45:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41L3jTap014152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 03:45:29 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 19:45:28 -0800
Message-ID: <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
Date: Wed, 21 Feb 2024 11:45:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
 <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uzanLWPHl4qgtbRgredxBwpb8Yms52Rk
X-Proofpoint-GUID: uzanLWPHl4qgtbRgredxBwpb8Yms52Rk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402210025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_194532_072474_F9209B6D 
X-CRM114-Status: GOOD (  31.13  )
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



On 1/31/2024 8:28 PM, James Prestwood wrote:
> Hi Baochen,
> 
>>> As you may have guessed I don't _really_ know what I'm doing. When I 
>>> got this working with ath10k I saw monitor device was being used in 
>>> order to receive probes, and did the same for multicast action frames 
>>> and it "just worked". The frames themselves were still being received 
>>> on the station device. I attempted to mimic the changes with ath11k.
>>>
>>> The end goal here is just that, be able to receive multicast action 
>>> frames on the station device which currently does not work. I'm only 
>>> seeing unicast frames when i enable RX debugging. The driver support 
>>> for multicast action RX in the kernel for this is basically zero. An 
>>> extended feature flag was added by Jouni when he added support to 
>>> ath9k, I added limited ath10k support for a variant I tested, and I'd 
>>> like to do the same for ath11k as we are transitioning to the WCN6855.
>> OK, so you are testing this with latest ath.git, without any private 
>> changes, and it doesn't work, right? Could you share your test steps? 
>> Basically how are you sending multicast action frames from AP/peer, 
>> and how to check if that frame received or not (I am assuming by 
>> checking RX logs)?
> 
> Yep I'm on the latest ath.git, and with no changes apart from that MSI 
> vector hack to get it working with vfio-pci.
> 
> The way I'm testing this is using IWD with DPP PKEX. Building IWD should 
> be relatively straight forward, very few dependencies. This will also 
> include iwctl which is IWD's command line utility:
> 
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/
> 
> I have two devices, the configurator device (device A, ath11k) is what 
> should be able to receive the multicast action frames. The enrollee 
> device (device B) can use probably any hardware as sending multicast 
> action frames should be supported. IWD will not start a DPP PKEX 
> configurator without EXT_FEATURE_MULTICAST_REGISTRATIONS set but if you 
> enable RX logging that should be good enough to see if the frame is 
> making it to the ath11k driver itself. Once multicast RX is supported we 
> would need to add that extended feature to ath11k, or at least the 
> tested variant. If you want, you can hack in that feature bit and start 
> a configurator but if your able to get the muticast RX working I can 
> probably take it from there:
> 
> 1. Enable RX logging on device A
> 
> 2. Start IWD on device A
> 
>      iwd -d
> 
> 3. Connect to a network on device A
> 
>      iwctl station <wlan> connect <ssid>
> 
>      <enter passphrase>
> 
> # Optional: start a configurator. This won't work without the ext 
> feature set
> 
>     iwctl pkex <wlan> configure secret123
> 
> 4. Start IWD on device B, do not connect.
> 
>      iwd -d
> 
> 5. Start DPP PKEX as an enrollee on device B:
> 
>      iwctl pkex <wlan> enroll secret123
> 
> On device B you should see IWD first scan to establish nearby 
> APs/frequencies, then begin iterating those frequencies and sending a 
> multicast action frame.
Hi James, I reproduced this issue following your guide. From the advise 
of firmware team, a new flag is needed. With that flag, I did see the 
multicast action frame in device A logging. Before I proceed, want to 
clarify something: that frame is only seen after device A triggers a 
scan (I triggered it manually using iw, not IWD itself because IWD not 
working on device A due to unknown errors), if no scan no frame seen. I 
am not sure if this behavior is expected so now checking with internal 
team on it.

So there comes a question: will IWD triggers scan on device A in order 
to receive that frame?

> 
> Thanks,
> 
> James
> 
>>
>>>
>>> And help is much appreciated, and I'm happy to put in the work its 
>>> just a steep learning curve coupled with the fact that any FW level 
>>> communication is proprietary. I really just need a nudge in the right 
>>> direction.
>>>
>>> Thanks,
>>>
>>> James
>>>
>>>>
>>>>> Thanks,
>>>>>
>>>>> James
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> James
>>>>>>
>>>>>>
>>>>

