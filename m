Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3655C6FD1F
	for <ath11k@archiver.kernel.org>; Fri, 29 Mar 2024 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em1lJd6M7y/VRuMxpKSji7OJmdzscgdXtJix3bTMdMs=; b=ER4yh+qt8ePJgAVGWM6FtWPqjn
	Q6Ft0y98KTqsozhQlopWPfQALk4Cojdsv6q9pSnRD8kx43VwLUrUtM+PQbi37q4YoPQMA/6Sun6Z9
	UrloVuBGMOJxZ8WI+skWFv1fGOvtK7IhyB1Eim9fbVhhR1m/At1HgF5+GxGfKDJLNjz1CtjuCbs7q
	K/4z5bfQ6GY0HFiCcWX7ThoeSgESvI+e2I13eA58e1HLDejphkqyuUV6cpXS9puSW1BCscdFE7XDl
	FRemXhnBn+A7Ju3kggtDTAvXCBUlWUte4X6vo2EMDY9g7RzIgf972dUneFgpMEfEFwg0gjWQFq0tW
	lHN4fU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqH8U-00000001dH4-0cB5;
	Fri, 29 Mar 2024 18:39:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqH8R-00000001dFQ-1wNH
	for ath11k@lists.infradead.org;
	Fri, 29 Mar 2024 18:39:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THegmB022199;
	Fri, 29 Mar 2024 18:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from:cc
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Em1lJd6M7y/VRuMxpKSji7OJmdzscgdXtJix3bTMdMs=; b=Zb
	+QDcVOOLUsrfm4vrAgRhWLKMrwwqyaFwrqzqrv8pNu+WffYipdKhB6Ev8Y4CTTae
	Lqkiq2zknY+aR9tVdB5Xo9eJ6S+z1J1eeo969hU6bt83d6BuP4X85XtooxWil/pi
	dW/agT/Sg8AMxVoE9m7u690ygp8E+BxfSQSEpCgNK58C0A2h6hXZFIGZQIRn9QGF
	7qRR+LzaDGPL/dP9pgI5ju7gBGvtiYrKtXQtVUcYzgvzkHcRSkEtR6Dfqo5Fh+lD
	B+BIh8ew02h7er9e4BqSkwfCL/zv+K+X4uVzj9lnsxG/bmWDwr0asAUE3wrgN59m
	cn4nnJnH48LGBZl7Tnww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5vkcrxv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:39:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TIdOxZ004871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:39:24 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 11:39:23 -0700
Message-ID: <216b223b-e871-42d4-8e53-59dd64efe4b9@quicinc.com>
Date: Fri, 29 Mar 2024 11:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k failed to enqueue rx buf: -28
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>
References: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
In-Reply-To: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1l8wSCrPiMHI9K15n_bBHbZyFVXTspJr
X-Proofpoint-GUID: 1l8wSCrPiMHI9K15n_bBHbZyFVXTspJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=792 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_113927_648279_C6A39FF8 
X-CRM114-Status: GOOD (  13.92  )
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

On 3/27/2024 9:25 AM, James Prestwood wrote:
> Hi,
> 
> This error was brought to my attention in the kernel logs and I'm 
> wondering if it is of any concern:
> 
> kernel: ath11k_pci 0000:03:00.0: failed to enqueue rx buf: -28
> 
> It seems to happen every few minutes or so. I don't notice any bad 
> behavior associated with it per-se, but maybe its an issue of some 
> buffer needing to be increased in size? Does this mean a frame is being 
> dropped due to no room to receive it?
> 
> Hardware we are running is:
> 
> [    4.610399] ath11k_pci 0000:03:00.0: wcn6855 hw2.1
> [    5.777030] ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb 
> board_id 0xff soc_id 0x400c1211
> [    5.777039] ath11k_pci 0000:03:00.0: fw_version 0x1109996e 
> fw_build_timestamp 2023-12-19 11:11 fw_build_id 
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36
> 
> Thanks,
> 
> James
> 
> 

+ ath11k list to get more specific eyes on this issue
+ bcc to internal list as well


