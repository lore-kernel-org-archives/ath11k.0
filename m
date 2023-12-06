Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE4C4167B
	for <ath11k@archiver.kernel.org>; Wed,  6 Dec 2023 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSqP+5jqEVhticdywUG680Z+Cbbv5T+jWmjE4ADT6cM=; b=xGidOUmDcsGICrBv15Tk21aqDu
	RxPUyeOWlo2qB2MG0Os5+nuUk7Pnxd5XAAALE1XnzJ/ZdiLgKkEjh/TL9rTaeFpPePN/1b64e4cpA
	8QB9MyAeaaNgTKwDXCWJ+ptz6FISq2zWxhyMg6YermKQ+kXmybM7NqbKWst00b/MNRjLWcI4uVNAR
	sud9+kdcey+bj6Mw2NokIqH8+pyowFGHFecAGgMZx7nzuTsaHBlGw/vhlcCk+SltyPWHFdWtL1tKl
	l6zppCza8muDRYpNMnVUblyo3gGCguIbgLeDnupW40xkB1zU7Z616poWfg+7XER9E5VtTdOEfUqEE
	YeNSw9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAxN2-00B721-34;
	Wed, 06 Dec 2023 19:15:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAxMx-00B712-2W
	for ath11k@lists.infradead.org;
	Wed, 06 Dec 2023 19:15:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B6Ihnmn006611;
	Wed, 6 Dec 2023 19:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JSqP+5jqEVhticdywUG680Z+Cbbv5T+jWmjE4ADT6cM=;
 b=YlXVOpHIvrNKmxTlFDnkw/pmblfDJHjqCB4YU7vfe6Jcnf/3y4N1jbKcr9M6b7MNpLD8
 LWNUJ/EDJdfcdjVRqg4sOnCL0ugPb7UweBOx6kn95XsL+JTuMt2BxpRe9UO67+QzH2pk
 PWnFT+AYKl5+YraTRRn+LxOlOOGzCIXx47x9Ymawg5QzU6xZe2IBK6YCDyf3jeenOeW6
 R5KiuDNKdRYWy0+2VqRJ9IqhTK4n/JnmcxrvWe11CildykW5t9pCPZIHFHu9xu3wr7N8
 4og3mjuHcHAk4YclONSlQLqy9dGYdZwS20TOUmrTAm4r65bcs88KhpcqqIjcz4n379te eQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd1n2tfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 19:15:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6JFRNB027170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 19:15:27 GMT
Received: from [10.110.111.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 11:15:27 -0800
Message-ID: <5a48ce85-a24d-4fb7-acca-c34bab425617@quicinc.com>
Date: Wed, 6 Dec 2023 11:15:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bizarre network problem on kernel 6.6.4
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Fourhundred Thecat <400thecat@ik.me>
CC: <ath11k@lists.infradead.org>
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
 <87zfyoq25t.fsf@kernel.org> <3730972c-15fd-04ea-8335-16518bea56e3@ik.me>
 <87a5qopolt.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87a5qopolt.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TYkLS2oHFKC5l8Xen_6AvF2jfRO6T6zM
X-Proofpoint-GUID: TYkLS2oHFKC5l8Xen_6AvF2jfRO6T6zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_14,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=953
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312060140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_111541_141055_DBF3E897 
X-CRM114-Status: GOOD (  22.86  )
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

On 12/5/2023 9:04 AM, Kalle Valo wrote:
> Fourhundred Thecat <400thecat@ik.me> writes:
> 
>> On 05/12/2023 13.11, Kalle Valo wrote:
>>> Fourhundred Thecat <400thecat@ik.me> writes:
>>>
>>>> I have the most bizarre network problem on my laptop that I have ever
>>>> seen, and I don't even know where to start:
>>>>
>>>> This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci
>>>>
>>>> Previously I was using kernel 6.6.1 and wireless network was working fine.
>>>>
>>>> Now I compiled kernel 6.6.4 with identical config, and when I boot it,
>>>> wireless network does not work:
>>>
>>> Did you verify that booting back to 6.6.1 fixes the problem? That would
>>> rule out that this isn't due to some external reasons (user space or
>>> network)
>>>
>>> If you can verify that 6.6.1 always works and 6.6.4 always fails I would
>>> just try to git bisect the issue. It shouldn't take too long.
>>
>> yes. I verified multiple times that 6.6.1 works, and 6.6.4 has this problem.
>>
>> I am not really familiar with git bisect, and I am also not a kernel
>> developer.
> 
> git bisect is a very useful tool, I recommend learning it as it makes so
> much easier to find the culprit for regressions. You don't have to be a
> kernel developer, it's enough that you know how to compile and install a
> kernel.
> 
> Here's one doc I found with google, hopefully it helps:
> 
> https://wiki.gentoo.org/wiki/Kernel_git-bisect
> 
> Here's one from kernel documentation:
> 
> https://docs.kernel.org/admin-guide/bug-bisect.html
> 
>> But I tried checking out linux kernel git repository, switched to tag
>> 6.6. and looked inside drivers/net/wireless/ath/ath11k trying to spot
>> any change. But git log shows last change on 2023-08-30, whereas kernel
>> 6.6.4 was released few days ago
> 
> I assume you were looking at Torvalds' tree only. The release 6.6.4
> means that you are using a stable release which are in linux-stable
> tree, the gentoo doc above should help more.

FWIW it seems that the only changes to ath11k have been trivial:

% git log --oneline v6.6.1..v6.6.4 -- drivers/net/wireless/ath/ath11k/
e83246ecd3b1 wifi: ath11k: fix gtk offload status event locking
69cede2a5a5f wifi: ath11k: fix htt pktlog locking
21ebb0aba580 wifi: ath11k: fix dfs radar event locking
c5b914528e55 wifi: ath11k: fix temperature event locking
2d88afdac295 wifi: ath11k: fix Tx power value during active CAC
d412d0ef300f wifi: ath11k: fix boot failure with one MSI vector
% git remote -v
origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
(fetch)
origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
(push)

Suggest you follow the instructions at the following link and create a
kernel bug report:
https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

Meanwhile I'll build and load 6.6.4 on my laptop.

/jeff

