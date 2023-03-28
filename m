Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47BDC76195
	for <ath11k@archiver.kernel.org>; Tue, 28 Mar 2023 04:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2f146kYCyKiIUQtAls0Xj8VvPrJcQyEwfTW2s02+Vs=; b=jsLRJ5K/JvBWZw
	EGVNDisxfNQXvmT/pM50wV8vAcplDe/6OlB30FQbznw6gCg0wgPeOeqjWOw0xCC/k+tWa1VtVTmT0
	N+YUOz5+FUVLdkeHCZNfyF/nhmgxpYd/tnC8PhImyxzq8aF2M4DdYSO3Z3zhgpkzSKyeACDsRCDHP
	UOPEMUB8ps+ypt4zhZryelMBKL0dGtbSW0ioG5YnUhHcdTq8XEH4wOjNYmmZ00EA18qFx5zPUTzAf
	unHK6BOQcu5hkFzQe55O9tZ53gfj/kLUct1AtdaJ6PrSI3SSyp3IKH6FeahFa0/o0xGewuc5LyPlR
	I9r5t6RjeY2KS90WXb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph1FA-00D8Nb-0e;
	Tue, 28 Mar 2023 04:47:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph1F7-00D8My-1E
	for ath11k@lists.infradead.org;
	Tue, 28 Mar 2023 04:47:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S3kNNj026463;
	Tue, 28 Mar 2023 04:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m1ETkqQDyH5uYhMWfsgLcfrA3+Nvwy4QgGaXwtS8DEQ=;
 b=PhbapCYuhEwi19BVnEA4FiS30Y92k7/NL85f3cMKTTgDvYRPr4Oc3TVv7UGPU69qgXBA
 BLPiagBq2H44oo/t/tytgqnI6980kF0NSZa1Y9dhALNJFd0sUFK0RG6e43Gcot7ZIpiu
 BQ9P5iBmvCvPVl9hOo4N5c6Gm3ZsRJzvmSqDnmArndibIPUdko2hQ1pBRMuAwAeXChYk
 H5tXn4VfgoJ3/yRS17wj6q8KXd7s+XsCma6URpkdUxmzRZ/4daeVzNSECoSVAWBZe2kf
 ROk8puCW1sJKMwkJXWza3/AAeYerbKJ3g2iigDorf/QySDjWBMLJiMlOQ26Snzv+Goua Xw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pk8pvjdsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 04:47:20 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32S4lJoI030166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 04:47:19 GMT
Received: from [10.242.242.48] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Mar
 2023 21:47:17 -0700
Message-ID: <0289c7f1-e729-e924-5ae8-a6156266e675@quicinc.com>
Date: Tue, 28 Mar 2023 10:16:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] ath11k: factory test mode support
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
 <87edpson9o.fsf@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <87edpson9o.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yV2G2Ec1YiJSJX-wiyyzPG4WUVrR3xdS
X-Proofpoint-ORIG-GUID: yV2G2Ec1YiJSJX-wiyyzPG4WUVrR3xdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 mlxlogscore=818
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_214733_470296_C389FA6D 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 3/13/2023 5:51 PM, Kalle Valo wrote:
> Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:
> 
>> Device is booted in factory test mode to calibrate the board.
>> The commands are sent from a userspace application, which is
>> sent to firmware using wmi commands. Firmware will send the
>> response back to the application which stores the calibration
>> data in caldata.bin file. This file will be loaded when the
>> device boots up normally next time.
>>
>> Govindaraj Saminathan (1):
>>   wifi: ath11k: factory test mode support
>>
>> Sowmiya Sree Elavalagan (1):
>>   wifi: ath11k: Allow ath11k to boot without caldata in ftm mode
> 
> While reviewing the patches I made quite a few style cleanup to patches
> (too many to list):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=4a5ca29c396ace5c46b208a8c15a3ba53eabaddd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=ba74c7478f5d15ce38e609b9ad4810db7511a3dd
> 
> I only compile tested them. Please use these as the baseline for v2.
> 
Hi Kalle,

Unable to get the baseline patch for v2 from the above link. Getting the
below error with the link:
Bad commit reference: 4a5ca29c396ace5c46b208a8c15a3ba53eabaddd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
