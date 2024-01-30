Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADAFC46CD2
	for <ath11k@archiver.kernel.org>; Tue, 30 Jan 2024 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIqgUfcXfNItkGKdsceAlheC0PfPnmZTRSdcvfF55+U=; b=mH6EsWJU5AVrt9lzRwbRu4/YDQ
	sXDJl5NlAHa5XKEKbHypjPNYqPmpjOW9EiHbgFfBk6ZaR+63l9OfBkztJGa0iL7fEWhTSBsWPUnu+
	WdCnEaYIH6QeBFbB5joMxQ+zLH6YuS/++0dJV8iphI5SLvpbhE3uH1QIjPQofWqiylN1qwX/leTbB
	Ai3o8dvH3RPlu2lP9PLOaE3aJiy0lj/on2pQmSJXphwZJMdPlfDIzKyh6jAKrfrIBmcKYncyI2AAK
	K10/YYj4fmiSwx+kCh9BVnlNhnOc0baDeKhHLUo3990+rtN4oQmiAGJpAc+s1dG2hcVVuMI8U1et8
	ttxOkPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUi6N-0000000FTuP-1Tcx;
	Tue, 30 Jan 2024 07:00:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUi6K-0000000FTth-2CiU
	for ath11k@lists.infradead.org;
	Tue, 30 Jan 2024 07:00:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U6Sa1X022746;
	Tue, 30 Jan 2024 07:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mIqgUfcXfNItkGKdsceAlheC0PfPnmZTRSdcvfF55+U=; b=Hc
	/wwrmfdaaw8E+wcubJ1n/zNSfW8xhAO0s08IVmOtLp8BOPN9Hf9dCNPm5huhwV2u
	wDz+lqaddZj97YRxYgqPbwnRX6VIixJ0kbxHls3/9qtynD5tvhKJhR0d5elv/7Km
	XV1DQefcNTDW7SMCuiJeN9YZQQqu5q8LOGcMi+LIF/LqNQNKtw8iLsNDb5zO0PvN
	Uw1I1g+DKiym+zrja3u+NblzQU5SvsnwN9LI079585gBSOk4Q6r/yDO6CblpOrlE
	CGHblNGL1CB4L70vvkgHXzPWkRrI8slmq3mpHzBDf3LOrJaSMBNHKVCizldbGFBV
	rwEKV/bwYMBoemKhQyrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxdwf9rv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 07:00:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U7062d032608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 07:00:06 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 23:00:05 -0800
Message-ID: <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
Date: Tue, 30 Jan 2024 15:00:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: James Prestwood <jprestwood@locusrobotics.com>,
        "open list:MEDIATEK MT76
 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uCGgT4tfipFSIAFlorCMTxFm2VQaVI65
X-Proofpoint-ORIG-GUID: uCGgT4tfipFSIAFlorCMTxFm2VQaVI65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_230008_599220_51173FBE 
X-CRM114-Status: GOOD (  23.38  )
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



On 1/27/2024 3:18 AM, James Prestwood wrote:
> On 1/24/24 5:06 AM, James Prestwood wrote:
> 
>> Hi,
>>
>> I recently added support to ath10k, for the QCA6174, to receive 
>> multicast action frames in order to support DPP. I'm trying to do this 
>> for the ath11k QCNFA765/WCN6855. I took the same approach as ath10k 
>> which was actually quite simple but I'm unable to see any multicast 
>> frames coming over even when I enable RX/DATA debugging.
>>
>> What I've done so far is:
>>
>>  - Add FIF_MCAST_ACTION to the supported filters list
>>
>>  - Created/started a monitor vdev from within 
>> ath11k_mac_op_configure_filter()
>>
>>     ath11k_mac_monitor_vdev_create(ar);
>>
>>     ath11k_mac_monitor_start(ar);
>>
>> - Also tried adding
>>
>>     ath11k_mac_config_mon_status_default(ar, true);
>>
>> I can successfully create/start the monitor vdev. I see now as I'm 
>> writing this email that my specific hardware does not support monitor 
>> mode outright... Is this a dead end or is there hope with purely 
>> driver changes? or is it some filtering at the firmware level 
>> preventing this?
> 
> I was able to finally see my broadcast frame after some additional 
> testing. It seems the driver/firmware/something gets a bit hung up when 
> I attempt to put it in monitor mode. It will start printing these 
> messages for about a minute:
> 
> [   51.093034] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id a1a2 
> != status ppdu_id a1a1 dest_mon_not_reaped = 650 dest_mon_stuck = 12
> [   51.094461] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id a1a3 
> != status ppdu_id a1a2 dest_mon_not_reaped = 651 dest_mon_stuck = 12
> [   51.096281] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id a1a5 
> != status ppdu_id a1a3 dest_mon_not_reaped = 652 dest_mon_stuck = 12
> 
> In most cases these ppdu ID's are a one-off from the expected ID which 
> seemed weird to me. But if I let it sit long enough I all of a sudden 
> get a ton of "data rx" messages, which is what I would expect if I 
> enabled a monitor vdev. Once this flurry starts I see the action frame 
> from my other client, sometimes at least. The firmware generally crashes 
> after a while so I've still got a ways to go but it seems within the 
> realm of possibility that this device could receive broadcast action 
> frames?
> 
> Hoping for some breadcrumbs to follow here...
> 
Hi James, as you already mentioned, ath11k/WCN6855 doesn't support 
monitor mode yet. I don't know why you are testing multicast action 
frame with monitor mode. So if monitor mode is not a must, could you 
test this with STATION mode? We would look into this if any issue found.

> Thanks,
> 
> James
> 
>>
>> Thanks,
>>
>> James
>>
>>

