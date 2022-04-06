Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E5C433EF
	for <ath11k@archiver.kernel.org>; Wed,  6 Apr 2022 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H1AFzORJBTXM9yu1MBN+Rp/ZDHJuJQ4RCt7elduBvU=; b=YjRvZbbVRj+Xmk
	UztF5hhwSGNim+Bln+jHC4Qzw2F5aLUkzsYgHR5dlbuJzEab6/EPSjIpnqtLa7Vy9vddRK0MdiDmg
	zLS8qU6XR4TE8SKcYWr8HrDlafBPieGdoI9Qek8C5vO0rMizvrk6UWGyAyGwts7QlmdCUl2DOQTM8
	HHxKPBF208Ek4uReIXM/Tjlf1vX4q+IBOaDn/sWqPPzzr4ltakmzqTThduKk6AziRFFOP0ZOQ950v
	KCwCBjj5+O7X8d9lvaITEfWkdY80zIe4Q/VuxURAF5g4ndqo4BnH0IqnC7KsTL88q+NhpBsPca/OH
	J19L00Il51Ul7CeKxYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc17X-004kFn-Lc; Wed, 06 Apr 2022 08:34:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc17U-004kEX-36
 for ath11k@lists.infradead.org; Wed, 06 Apr 2022 08:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A97A9B82177
 for <ath11k@lists.infradead.org>; Wed,  6 Apr 2022 08:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD1C385A1;
 Wed,  6 Apr 2022 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649234063;
 bh=yHI4cCsChblsBPcn58Gc84jVaku3lU6eMPwbk92lODQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PmHI2AXstj0TP/ZEFAhot17q52TFFM1hV8ocf24IJ+BWH8X99RkP3QrsDvJ4fugxt
 yBYxczrDgxV/UbmL8RWrU5ej506Vbb5FG8aSd1sqHS39cIqxBBcq5E7AYkQVm4UQV7
 sznx7sKwMfBeLSQPLsF0NpNs/N0hECsoHMjwXIFespt/KAsnPjsZ4vPLEHlz2cRsR/
 zAm8qRJK+sGiPeXqC5RbaG7BcXap6aRn8gl3rDRgcSqWXEuZK6EYjzvIKR9ofzfazf
 axrG/+0s/lp2Ypelx+35lFvkHku2EJ2MVoKrEKPhSGGhk3JM9eq/lgLeOGUndUupkr
 LuClG5wOBRgBg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: mhi: remove state machine
References: <20220401173042.17467-2-kvalo@kernel.org>
 <164923162903.31835.17335207502754178945.kvalo@kernel.org>
Date: Wed, 06 Apr 2022 11:34:17 +0300
In-Reply-To: <164923162903.31835.17335207502754178945.kvalo@kernel.org> (Kalle
 Valo's message of "Wed, 6 Apr 2022 07:53:51 +0000 (UTC)")
Message-ID: <87wng2pq46.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_013428_334731_19B4A45B 
X-CRM114-Status: GOOD (  11.53  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kalle Valo <kvalo@kernel.org> wrote:
>
>> State machines are difficult to understand and in this case it's just useless,
>> which is shown by the diffstat. So remove it entirely to make the code simpler.
>> 
>> No functional changes.
>> 
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>
> 3 patches applied to ath-next branch of ath.git, thanks.
>
> 5fe7847bb63b ath11k: mhi: remove state machine
> 4afe7c40380e ath11k: mhi: add error handling for suspend and resume
> 7dabaa64c04a ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

I accidentally had a wrong commit in ath-next so to remove that I had to
rebase these three commits. The new commit ids are:

121210ec935c ath11k: mhi: remove state machine
3e80fcbca372 ath11k: mhi: add error handling for suspend and resume
b9e34ba6b314 ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
