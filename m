Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D115C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD8PrCGre5HjeD5Qs/ETnsSTUC2y44wCWmubvmBIlLs=; b=ug4uHPqtaiEtyd
	0UwcVwxO57pcnEdjappyanYvYIgoq8fbEgYKVFp3wFIiaSFjtaywfyOFDttS0A4Y7AaR6OAxf/y3t
	Z2V+sxnwh1VFH7T6zNf7J5IqoILslk/M5Kc/47KTOr33p4pm9Lv6BF30qjWtyPtxZi4QeLrP7nsbn
	5AkVdLosTEfTLO8JqIIhdvmHGlwXJ3iv3cQFv67D3iiKMjWvHcFw39RzX8LN1tyQbYJ3oNbP/tYwJ
	7GC1ngC1KUglQJpOeIO06RWCsye9Dg9cYdigYCCR4c+R9o5uHO9umfU7hdKwNaH3bV+kcQhxMLKID
	tNQP15+wSrmfMRdh3DmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNDI-0018mm-Cw; Fri, 28 Jan 2022 09:06:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDND8-0018iS-S4
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 09:06:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81CEC61DD2;
 Fri, 28 Jan 2022 09:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA88AC340E6;
 Fri, 28 Jan 2022 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643360785;
 bh=rn1Rql/e4F0roWqmydKFN1DjwWDFwx5Mu6YpNLR7cb8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ASMsTu1xBTHeSAogpq7OqVXVA8QgEXBfOhl04Mn89KpSAuyUtGuVO4ZXcg98V9PxC
 S/txTnZpz8Rmm5T9MXgVgW8sCxSYc212E7Niz+SGrtqd0AYst1ZkXpz36yC/f/HPWv
 g+KYK8zLgZ9LpZf6wDVXshGGWikOcn0xMvHwje+DoQzIKcWucOH9ajtUqsuW9jC+Hw
 ywX+e94IRBy9fVPARCYJlj8bNDJZSF9AXHI9R0zlr2zwwpAgifEc79vwm9+D/Z7t8O
 Fau90sbucg7HGi71z7gzuWQBNrHImG92IjgW8zZWn+IUh5fiPqjXBj/N+7w14Rm42b
 A70k+zobBqwRQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: [PATCH 2/2] ath11k: mhi: use mhi_sync_power_up()
References: <20220127090117.2024-1-kvalo@kernel.org>
 <20220127090117.2024-2-kvalo@kernel.org>
 <a0f8c8fa-2f26-e522-a3b9-e530aba9994b@quicinc.com>
Date: Fri, 28 Jan 2022 11:06:20 +0200
In-Reply-To: <a0f8c8fa-2f26-e522-a3b9-e530aba9994b@quicinc.com> (Jeff
 Johnson's message of "Thu, 27 Jan 2022 15:36:54 -0800")
Message-ID: <87k0eki60j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_010627_009338_3E90B7F1 
X-CRM114-Status: GOOD (  12.95  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/27/2022 1:01 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> If amss.bin was missing ath11k would crash during 'rmmod ath11k_pci'. The
>> reason for that was that we were using mhi_async_power_up() which does not
>> check any errors. But mhi_sync_power_up() on the other hand does check for
>> errors so let's use that to fix the crash.
>>
>> I was not able to find a reason why an async version was used. This call ends
>> is called from ath11k_hif_power_up() which can sleep, so sync version should be
>> safe to use.
>
> I could not parse the 2nd sentence: This call ends is called

Heh, that is a pretty horrible sentence. How about this:

"ath11k_mhi_start() (which enables state ATH11K_MHI_POWER_ON) is called
from ath11k_hif_power_up(), which can sleep. So sync version should be
safe to use here."

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
