Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39358D5B854
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jLgxnhcBbINX86i4Ai4+DNpbSijO+bWBInrNPbEFvM=; b=h0yxSaNqq5vAF9bxGJrIZw/Kl0
	CZH5fBGhSDvTEc2LA43DIcyL2NmD0JXYIvMUsqPyBI82A4EXFZnt2YBxIxFrGMGI0nP+s37c0Tfhl
	gfyvLtZHf5eVWsDW4IPxTWls+p9WAMU6acIRyUV1B6nI3YkgPS4Yw6wLbN9dsx/l1EsUpr1ywm1ZC
	N9n5pTyDIR4LFWJmFoekZ3yprD7HNj2rWPKNMBdabWAsCLaF4YfhpcRRYSCWYefPvDoutkhtOulKH
	E+AjhKr9oWVLpfDhJz4TjXxGvbYmkq6iG4OPL53R+CUDQhZRKNgQGNJkg35MtkLwIgRT1DG+czQKM
	FOstrMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bcs-0000000Cvf9-0FMc;
	Tue, 29 Oct 2024 02:06:30 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5bcn-0000000Cvdk-1hIH
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 02:06:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xctrx1hTNz1ynqm;
	Tue, 29 Oct 2024 10:05:53 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id CE5FA1A0188;
	Tue, 29 Oct 2024 10:05:44 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 10:05:44 +0800
Subject: Re: [PATCH v2] ath11k: remove error checking for
 debugfs_create_file()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
	<ath11k@lists.infradead.org>
References: <20241025064235.382-1-thunder.leizhen@huawei.com>
 <87v7xcgwb0.fsf@kernel.org>
 <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2baeba2a-9a77-2bde-1dee-b520069df635@huawei.com>
Date: Tue, 29 Oct 2024 10:05:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_190625_792300_85C58E11 
X-CRM114-Status: GOOD (  20.48  )
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



On 2024/10/28 22:30, Jeff Johnson wrote:
> On 10/28/2024 7:02 AM, Kalle Valo wrote:
>> Zhen Lei <thunder.leizhen@huawei.com> writes:
>>
>>> Driver ath11k can work fine even if the debugfs files fail to be created.
>>> Therefore, the return value check of debugfs_create_file() should be
>>> ignored, as it says.
>>>
>>> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>> Are you just guessing or did you confirm on a real device that ath11k
>> spectral really works without debugfs?

Let's be honest, the only thing I know for sure is that debugfs_create_file()
returns an error code when it fails, not NULL. When I was locating a problem,
I found that a call to debugfs_create_file() did not process the return value
correctly. So I searched for other drivers, including ath11k. I'm not familiar
with ath11k. How to modify requires your help and decision.

> 
> The debugfs_create_file() documentation tells us:
>  * NOTE: it's expected that most callers should _ignore_ the errors returned
>  * by this function. Other debugfs functions handle the fact that the "dentry"
>  * passed to them could be an error and they don't crash in that case.
>  * Drivers should generally work fine even if debugfs fails to init anyway.
> 
> The caveat is that any driver functionality that relies upon debugfs obviously
> won't work if the underlying file isn't created. Hence the language that the
> driver "should generally work fine" since all functionality that isn't tied to
> debugfs will still be available.
> 
> Since the relayfs functionality that spectral scan uses is dependent upon
> debugfs, this functionality won't work if the debugfs operation fails. So the
> question is, if that fails, do you continue running the driver that generally
> works fine supporting all other wifi operations, or do you return an error,
> and as part of the error handling, not init the driver and hence have no wifi
> operation?

Maybe Kalle just pointed out that my description was incorrect.

Hi Kalle:
  Can you give me a clear instruction?
  1) Rollback to v1
     https://www.spinics.net/lists/linux-wireless/msg257219.html
  2) Update commit message, I think I can borrow the description above.

> 
> The one thing I didn't check is that although the documentation tells us that
> debugfs functions handle an "error" dentry, I didn't check if relayfs handles it.
> 
> /jeff
> 
> .
> 

-- 
Regards,
  Zhen Lei

