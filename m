Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5F4D6ED04
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF1XvwoHBZpxEAMx2O7edfdyYo0w9Q7PC4dbTVMeGs4=; b=TRHHzeFE92b+m7hRijtDTmV7F7
	RrW+2N2GgG4yL/ttsBfURzuEhwVHM9Pe1RqcA8Im+ZpvWIu9e4xaqghXiy2B3YCL0Bx7PO7gKfdsc
	QhyuGkT5gKTPiBjWa5sGhZt/L5RgQY+IT+l84HpTB2D5gVfM/rmTwS4cxvT5axwuW0eitH7ngX0Fe
	MrWoaIK544f9WFCEGwZmz1JZAxItRUxuo8SkBJbCj9UG8olqYN+x252BklheW4fuVX+ILNj6RCn9Q
	qxYroNmyiuHyt3XpbZFJoTZH+rv2QiRo9wt9b2NwqL+x8E21k7qGvEVBjtcVZgp2JMu4DoLj7Po0l
	x7WH/MEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE504-0000000HQVZ-2Nz3;
	Thu, 21 Nov 2024 11:05:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE502-0000000HQVC-18yK
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 11:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBE1E5C55DC;
	Thu, 21 Nov 2024 11:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50339C4CECC;
	Thu, 21 Nov 2024 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732187125;
	bh=AGvZ1bo3QHRClGESY5fZrGfulh5ci0G55GUsSOsJW/0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fRD2Xue4Xe8kLpjImXWNySN6VFB4vwlhRNmaIIzFG+J/AmjGSi1XkwyVCSBYY7Ftr
	 m8QOCcdySMJY8jQMPNm0BmdfVHoUjxpw2VIqwKgde/502FfxjuVRkxwzxDCmfPLiTx
	 OJ+dixkc6BMlkbaTtVgtYCQ5YqzjQ66omikQn6JXQDlvQ/29yclCpwsPlirPT2Tjj3
	 eTUjYrXNeIiRvK3pR6UstKtSa9GR04SRqs7oA7KVpCFowTW1o7Oh/U0E0hAGafUCCk
	 cH5+V6co5+86F4u/ot/RsrO7ber5Faii9f4FQIrLJ+0lfghC/CxrazN1+KpjxH51jQ
	 3STOPPNMBveJQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: add support for QCA6698AQ
References: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
	<bb1c77cb-7efc-4c85-a946-5394b9105416@quicinc.com>
	<87o72k4hxk.fsf@kernel.org>
Date: Thu, 21 Nov 2024 13:05:22 +0200
In-Reply-To: <87o72k4hxk.fsf@kernel.org> (Kalle Valo's message of "Tue, 12 Nov
	2024 16:59:03 +0200")
Message-ID: <8734jkyhhp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_030526_353948_D4FFDECE 
X-CRM114-Status: GOOD (  14.00  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> On 10/30/2024 5:05 PM, Miaoqing Pan wrote:
>>> QCA6698AQ IP core is the same as WCN6855 hw2.1, they share the same
>>> PCI device ID, the same major and minor version numbers, the same
>>> register address, and same HAL descriptors, etc. The most significant
>>> difference is that QCA6698AQ has different RF, IPA, thermal, etc.
>>> 
>>> Follow the approach done in commit 5dc9d1a55e95 ("wifi: ath11k: add
>>> support for QCA2066"), enumerate the subversion number to identify the
>>> specific card.
>>> 
>>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>> 
>>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>
>> Am I correct that this satisfies at least a subset of the devices you were
>> trying to support with the following?
>> https://lore.kernel.org/all/20241024002514.92290-1-quic_miaoqing@quicinc.com/
>>
>> If so, can you reply to that thread, pointing to this new patch, and elaborate
>> on what is now supported and what still requires ath11k to support
>> board-specific firmware overrides?
>
> That question is still open but otherwise this patch looks good to me.
> But I'll give an Acked-by only after I understand what's that "NFA765
> m.2 card for IoT platforms" mentioned in the other thread is.

Miaoqing provided the info offlist so:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

