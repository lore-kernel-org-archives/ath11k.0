Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038B5C6FA82
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+MrRSm7azg8lEDuMrXK7sePD532uIUphO1Z5zu+SPc=; b=hGZxTNN9FVXrZN
	v7K77yetZzRQE+oz2wTKs2UNleTguIXceXMaR0CYyfIMf0Thy+0+YzMGEunoWHm4o+Po8HXHDLNV9
	GqbLo/MT+m5dxU8uC9vVN9g5z/yKxrcwZT/VFRE1FqOBxSSmDWIsNUUoE5cxqOllF1ebb9v4JJJ5h
	n0WuVvvopD3G1XXPt8YjjqYvC8Ob9E3/I8pWAkCXAB5JBgG4SgYix3H8gohmXtxGPYE8PDVvb+dsD
	SRl/eoUyAE+6v5M2vcpvv6AWFcJrowldFU3Aj6m2TLVV25XfgjgFk7c8HSNXLOgnF1AvFTbKFsClx
	/adii5dxijGTnuTzQPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGgI-00DrOq-8W; Thu, 22 Sep 2022 07:31:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGfx-00DrBI-Q9
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 07:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43229B834EA;
	Thu, 22 Sep 2022 07:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB014C433C1;
	Thu, 22 Sep 2022 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663831871;
	bh=p/n/2c3oDkf4hgIeuqkSs8FjK02uFuk4GAXJwgydQnE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UTmpQYpLKBvCDBx0HfesiAuqd4EThGdI4r3zygP1QF+yn0cxP/Z2FZzY6tIQPMONu
	 LyuSOgw/zz1aYkGEyQ63UoO4Z70pUR6Nc1ufFgcY4ypDlaKk+8SCq8mZEDmBbYm2dB
	 EoC2UGDTXg0/pbp9lbS2/bIkMWr5mSyfntlv5hDpRwM+NguIgALAOHDluYtEH6+SvV
	 rHMGkVnIy/afSBPPiP4AydXV3fjGqQ6yNlKIrAMk2S9xFpyWiKcwibOgCsBL40AELU
	 qXjUuoVFWQYh4uxOjOTBwqJkT3fGitcQ0vUuISdZopg14qBf8j8tG7c9f4bjc8mOmP
	 7xbSzlOqOuudQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH] ath11k: Add support to get power save duration for each client
References: <20220725054601.14719-1-quic_tamizhr@quicinc.com>
	<0c282a64-2ee7-f50f-1cbb-4c47b9089736@quicinc.com>
Date: Thu, 22 Sep 2022 10:31:07 +0300
In-Reply-To: <0c282a64-2ee7-f50f-1cbb-4c47b9089736@quicinc.com> (Jeff
	Johnson's message of "Mon, 25 Jul 2022 08:49:20 -0700")
Message-ID: <87y1ub6f2c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_003114_022948_0EBC1661 
X-CRM114-Status: GOOD (  11.02  )
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

> On 7/24/2022 10:46 PM, Tamizh Chelvam Raja wrote:
>> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> [snip]
>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>
> wrong order of S-O-Bs?
>
> Author should be first, then the patch sender should be 2nd

I fixed that in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
