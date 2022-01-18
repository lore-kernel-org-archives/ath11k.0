Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB583C433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5V+Y1p6yu2IC3D22PUL+djpVry9TpbYO7q9UV4WY1w=; b=YsMh1KZqGn8bQV
	1eb5IAwYxiVwPUVBRtUNwdaZsfJ6OvUqwDaAjx5bRCL7mDUhoOnK1OzHi+HPG6O9gdfaxUWT6WCxV
	oxi62UePa0taXWrTD/O2d10orxlofaPje35Q5V/+Gtfr5+h2xzm+DUcelefaNNtbTuDFGEt+0r3sI
	eexiiQmeV9g8Qj7YseiqtrrpPjuFmHZRtXFnoHFZZtwLtrvA5kS6tuzW3Qsr7cvqX9flXWJQFp2Pb
	iG59XMichkmCi23xMpV4JfF1Wt9NIHxqaEj4q4HQmZ2WYvdPmf7jnw9rgVYTZhMyJR5vEY9RIR+fI
	W3wCCuCETUhLM4X3k57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9i3X-000Thj-2Q; Tue, 18 Jan 2022 06:33:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9i3U-000Th8-DV
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 06:33:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA11E61207;
 Tue, 18 Jan 2022 06:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D75DC00446;
 Tue, 18 Jan 2022 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642487599;
 bh=AuLR7KOtcoYyPTyis6hGqGcPXpIpOlMrvosPBEfyGcE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lz7XSH5wdHFEmpG7085rBsUL7EzhNuGDGx23AlZ2TaN8dPQT/FHtHuvwm+X4kREpc
 /T2WlYOu/zgJWSXsfncvzaj/BVaTkfyoKas6yKnWAevm1TdcCVhfdE3J/jxcM50UfA
 nJf6ALhiuikQKaCbDykIZqG+24cuqH43JsDmDTN3om7XLg8/jy6ZRRhxdSGPAenBJY
 T1g8exfcQxVIQBYJ7uMwsVX712NPFhpxCj6vaFkb4I1mg3Rqmzu367TMeyRgmMgtnA
 0qjFDOBg+q2fiEcO3Tr+iI8MpXn2Km/E0qt4FsJYLHwQ84AIVoLO79P3UobwVHog0j
 eAUvT1j4ZUHjw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
In-Reply-To: <6ac56fa1-b369-831f-2b1d-9a188b7cbacc@quicinc.com> (Wen Gong's
 message of "Tue, 18 Jan 2022 10:43:15 +0800")
References: <20220113023145.14292-1-quic_wgong@quicinc.com>
 <164242492251.16331.2627237965817574376.kvalo@kernel.org>
 <6ac56fa1-b369-831f-2b1d-9a188b7cbacc@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 18 Jan 2022 08:33:14 +0200
Message-ID: <877daximdx.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_223320_525850_912A8705 
X-CRM114-Status: GOOD (  10.05  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 1/17/2022 9:08 PM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> wrote:
>>
>>> When station connect to AP of 6 GHz with 40 MHz bandwidth, the TX is
>>> always stay 20 MHz, it is because the flag WMI_PEER_40MHZ is not set
>>> while peer assoc. Add the flag if remote peer is 40 MHz bandwidth.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Fixes tag
>>
>>    Fixes: 2cdf2b3cdf54 ("ath11k: add 6ghz params in peer assoc command")
>>
>> has these problem(s):
>>
>>    - Target SHA1 does not exist
>>
>> Did you mean:
>>
>> Fixes: c3a7d7eb4c98 ("ath11k: add 6 GHz params in peer assoc command")
>
> Thanks.
>
> yes, it is.
>
> I see you have already changed it in master-pending.

Yeah, so no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
