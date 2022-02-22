Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F2C433FE
	for <ath11k@archiver.kernel.org>; Tue, 22 Feb 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhJh0jzYX+yNS6MDhWaC9pCdxf93BbD2jw22wqnCM0Q=; b=EsaXYJc2L0Bjxq
	/G4LDGRCfLbLViofwwn/D9Jn9yGuOuCvOjrJDw5edkc2IoMqKeAvmVQbJo+kMXYdmMUVO66KbKoWY
	KDekvq861SsLMdp0BTsHkABJD19MU8vmFt/7o1UF0Yb5WyGLzLZxHZrFt3R9U/pRulCwDmBAcHYVI
	nEjismadCZjq2ZePoMwPqOURKjUhEfxU89zKY9tqKMWbJwjaYcvoIiU1utmTU7+w8Co3VCNcAQ3od
	ER7wxQLqn9zTmHELE5V3vfxDaHqCmaoRJSj+TchxrD6f0X2Icj9n9AyD7OY17kAIkrJ6IoMHDIUxA
	7u3KrtmVhHiW6skbBcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMW9a-009tue-Aw; Tue, 22 Feb 2022 14:28:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMW9X-009ttE-AM
 for ath11k@lists.infradead.org; Tue, 22 Feb 2022 14:28:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA06D60A27;
 Tue, 22 Feb 2022 14:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CD8C340F1;
 Tue, 22 Feb 2022 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645540110;
 bh=Vx/YhCWQL5CrKjxhn+hHvjwgVfIfMqKnqUz3/5kYuZQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=dzM/2XVMrHIieX2HnPUwzHTuY907TpWUyr1TzfIqoorjsHSh/aZ8Ob+PfZyCS3sU/
 jDyR6igOI93OvIijFfszKqkl9lcsQR3VRBJvVczlAL99j3Z/NgyXLOzaGm4alLcU9x
 /Oe1hynDdo/QJkIirjToHb0oMo0udCjHFYT9AvcVmJdyZiNEazcbh5jkC/4nfKmCjN
 mVYoHWYS/dEl7GTTFS35xq/Qy+YQ2afwP+qAQYEjJ7NXsu95h3zrkIbdDfwh75iGvu
 Ni7KLN4F2PGtkxYBUySufEZaL5A6+tSsgss4Y4g7/jbE/F8aHxtcLGsdb51cDg9nGX
 JwWRvdvJnYDIA==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] ath11k: Add basic WoW functionalities
References: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
 <164553444424.23898.1586617399462118980.kvalo@kernel.org>
 <871qzvvw7c.fsf@kernel.org>
Date: Tue, 22 Feb 2022 16:28:25 +0200
In-Reply-To: <871qzvvw7c.fsf@kernel.org> (Kalle Valo's message of "Tue, 22 Feb
 2022 15:59:19 +0200")
Message-ID: <87wnhnugae.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_062831_440375_5C3CC092 
X-CRM114-Status: GOOD (  10.75  )
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

> Kalle Valo <kvalo@kernel.org> writes:
>
>> Carl Huang <quic_cjhuang@quicinc.com> wrote:
>>
>>> Implement basic WoW functionalities such as magic-packet, disconnect
>>> and pattern. The logic is very similar to ath10k.
>>> 
>>> When WoW is configured, ath11k_core_suspend and ath11k_core_resume
>>> are skipped as WoW configuration and hif suspend/resume are done in
>>> ath11k_wow_op_suspend() and ath11k_wow_op_resume().
>>> 
>>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>> 
>>> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>
>> This patchset adds new warnings:
>>
>> drivers/net/wireless/ath/ath11k/mac.c:7284:5: warning: no previous
>> prototype for 'ath11k_mac_flush_tx_complete' [-Wmissing-prototypes]
>> drivers/net/wireless/ath/ath11k/mac.c:7284:5: warning: symbol
>> 'ath11k_mac_flush_tx_complete' was not declared. Should it be static?
>> drivers/net/wireless/ath/ath11k/mac.c:8218:34: warning: cast to restricted __be64
>> drivers/net/wireless/ath/ath11k/wow.c:409: line length of 98 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wow.c:527: line length of 96 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wow.c:528: line length of 92 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/mac.c:8111: line length of 96 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/mac.c:8168: line length of 92 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/mac.c:8188: line length of 92 exceeds 90 columns
>
> I fixed all these warnings in the pending branch.

I also cleaned up debug messages, changed some function names, change
ath11k_info() to ath11k_warn() etc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
