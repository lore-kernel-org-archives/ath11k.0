Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9143FC001DF
	for <ath11k@archiver.kernel.org>; Tue, 25 Jul 2023 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LMhPSsg2wvlVr5Dp/Y5JSOejrrpnBaaSj4F8G1+AQU=; b=O3sfr2RVRjBiy/
	NPMSBdwEhFH+eKBdlFQAldzB5rkKORanPdsfymlP4IxhGAWBlQw5gZP8JcXCZo4JSlpN2QYLydik5
	NXv8WPSjfUt6c9idl+kDFEfmuAV1T3UIx3XJi8rVyeb8GyU2G1ARgiArkQk+tXURkaTq/6I6hlkVL
	BdsZ7UQGYml00gkwK/17SeY5X5aomsLjjv48/k7Pm2MvHTplsAFk1eTy+txZfijlVCGzqhsL1AzdT
	/7WD1ppnhA7XvSq3RJI2YOydK/trlEXIZAx6CUvDVLIMgNLIewRqLzUYwoxM53R56BQl5/WYZ64jj
	uf37eGqSh4rsM3yA7LiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEBE-006sYZ-0C;
	Tue, 25 Jul 2023 09:18:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEBB-006sXs-1E
	for ath11k@lists.infradead.org;
	Tue, 25 Jul 2023 09:18:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P89KDW020373;
	Tue, 25 Jul 2023 09:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EtaXHcheHiL150xLPJfR+EAbk5fAJAvdft9o7hOW2yY=;
 b=ciDDADRbWoRWglcC0RkraVtgpHH8DB0HM1NPNAvQ4DZ7/KsdVAUg7q0oyB6aqCXzOECK
 q0KnTwLJ64EMLFOJ+tzBxrwKP2jElNavUOTbo9vt8qO0P72pckxQVRilQWULHU5yLPkG
 CS5AlSC+wR7D7225tQUDqknIym+n/M9XY5QLyRW4dIlXOqCcF/gwAIfBgrNc6LnPnyNq
 MvbL2hW+zLisAJaCwg6IqoXJrFcEUdn+iszWFy+eeX9HNThJWDCP8u/pGiE5zZpHJYCU
 P6LWBfK2WFIo/MeJXrsSOAOmvoP4A/3S+JywsZX7yjPxjGM4FLdGj+e3B1hucVwuvlCx Rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1y6m1ct4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 09:17:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36P9Hrtu025701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 09:17:53 GMT
Received: from [10.204.118.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 02:17:16 -0700
Message-ID: <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
Date: Tue, 25 Jul 2023 14:47:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
To: Linux regressions mailing list <regressions@lists.linux.dev>,
        "Bagas
 Sanjaya" <bagasdotme@gmail.com>,
        Kalle Valo <quic_kvalo@quicinc.com>,
        "Johannes Berg" <johannes@sipsolutions.net>,
        Jakub Kicinski <kuba@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Atheros
 11K" <ath11k@lists.infradead.org>
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
Content-Language: en-US
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i5r0EHj-DCqgOd8XKG_jdGWBaU8g-B9U
X-Proofpoint-ORIG-GUID: i5r0EHj-DCqgOd8XKG_jdGWBaU8g-B9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 mlxlogscore=654 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_021805_558300_33BABD23 
X-CRM114-Status: GOOD (  18.49  )
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

On 6/26/2023 6:19 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> Hmmm, there afaics was no real progress and not even a single reply from
> a developer (neither here or in bugzilla) since the issue was reported
> ~10 days ago. :-/
> 
> Manikanta, did you maybe just miss that this is caused by change of
> yours (and thus is something you should look into)?
> 

Extremely sorry for having this missed due to incorrect mail filters on 
my machine. I have looked the logs attached to the buganizer.

The issue from the logs looks like it is happening during the boot.
Generally, issues like these "ce desc not available for wmi command" 
occur when there is no room in the copy engine pipe for driver to 
enqueue the command to the firmware and in many cases these would have 
happen when firmware is reaping the ring slowly.

It is puzzling to know that thread NAPI is causing this and reverting 
this got the issue fixed. NAPI generally acts on the RX rings and has 
nothing to do with the TX.

Hi Sanjay,

This issue is seen just with the kernel upgrade alone? Or firmware has 
also been upgraded?

Meanwhile, I'll try to repro the issue on my local setup and try to root 
cause the problem. Pls let me know the firmware version that has been 
used for testing.

Although I'm okay reverting the threaded NAPI patch for now, in the long 
run we want that back as threaded NAPI brings significant improvement on 
the throughput front.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
