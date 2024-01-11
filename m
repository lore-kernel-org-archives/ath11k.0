Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5066C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 03:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVMt6fToAllQFrClvWILlYgLYF+6BORiv9l1L7NxkKs=; b=kiUXsNitPyCkMzfpXURNMYGTr0
	OQhePNxnVQWXyp3cl5kXEKN6M6kx/u2WpSTJxRg9vXqNPjyqxQpJ193G2k1nmCNeU2QBkGcKsBJRS
	oUNtOKjJ5QTJKYZTFPzJZUUJ7Hv5XV92ATCJdyNAh2B7qp0IBCUqq2CEQWj0ChgJNyiS8xrEDugTD
	wry4SYLlQ1WStOMkzgkW/ghraTWFvJtZ/5CKL77PKM410DugR5cx1BQXUg2GvvehepvMCnfEZX4jL
	7XMYcjdr929DBH6QZX4UVRd01vo7CbbM5PchM/ukXb/oRjeUe9ojxbhiEHiKAMcMNpKC0InwmDFen
	rB0OBXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNm6r-00Fggz-2j;
	Thu, 11 Jan 2024 03:52:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNm6o-00FgfV-2N
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 03:52:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B3o2P8009204;
	Thu, 11 Jan 2024 03:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UVMt6fToAllQFrClvWILlYgLYF+6BORiv9l1L7NxkKs=; b=gA
	ZaNDF6U/NUgXOVCOVXj1WyFIUEHAjs438ilZd9e6ndPqXcZEEUJvbi+eQHltv9yE
	Nkgqxb0B3DNiUTE4OXiOzzFwASikyOvjvxrQtLSzAe1OWcG+YqSSYefBxBkHUyE4
	aQ1boE9zPucnTepZ905dc7otCTfyRwB+JqNxm4tAlFWC8/3x4lzAieFqe/pdpndc
	atrftVSfuhK1iFVbz9Nm5Xt0HIqm4LO12H5Q+pjjIiocdsWHsIUsJcrzXN05J38o
	yAxRi1uRah7BZE1mnzJnk6EOSfgeroy+CLGsCllUI+zyit9gQOGrLDRYzj3uKDFU
	fLLIVtHuunzTXWeBnqLA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhuak1shx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 03:51:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B3pmiN026079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 03:51:48 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 19:51:47 -0800
Message-ID: <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
Date: Thu, 11 Jan 2024 11:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D-D0YlF1A-GtY3t7Ei8om8a5L3O7tLue
X-Proofpoint-ORIG-GUID: D-D0YlF1A-GtY3t7Ei8om8a5L3O7tLue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=611
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_195158_891350_8EC11423 
X-CRM114-Status: GOOD (  12.51  )
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



On 1/10/2024 10:55 PM, James Prestwood wrote:
> Hi Kalle,
> 
> On 1/10/24 5:49 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>>> But I have also no idea what is causing this, I guess we are doing
>>>> something wrong with the PCI communication? That reminds me, you could
>>>> try this in case that helps:
>>>>
>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>>> Heh, I saw this pop up a day after I sent this and was wondering. Is
>>> this something I'd need on the host kernel, guest, or both?
>> On the guest where ath11k is running. I'm not optimistic that this would
>> solve your issue, I suspect there can be also other bugs, but good to
>> know if the patch changes anything.
> 
> Looks the same here, didn't seem to change anything based on the kernel 
> logs.
> 
> Thanks,
> 
> James
> 
Could you try this?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/pci.c?id=39564b475ac5a589e6c22c43a08cbd283c295d2c

