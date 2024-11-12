Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BAD42B85
	for <ath11k@archiver.kernel.org>; Tue, 12 Nov 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmcODCsojbWGjJFKsbT4a01JFjeIDpZtodbn/lpIjwk=; b=Bn2ABVqdKP2x/k4SCqH5aryMzi
	I9PyrKV0S6oOLWpWo4XUFZiQhoGMZIKis5TUsea20WWhUHbFC+bDOAzGgdpAqMzSrTQfyXIyBFsOZ
	vFIaTZQ7vaBYHr9v2Jm2yQghtFPQ7cYUc9o2G4NrsAut7qfNo1ZEhRJ98DijPGN2k/orrov/Pq3yQ
	RqAfXoo1ZZl6Dvfwvq4bY+Z16I5HM5poUzBnTxCkgWV8sC6OMxRZQNEBzEh2GBN4mAFVDSImA9eJ9
	INPrkisv8feYiGL5NjRhLGGuTPxMmXrWbi3o7pzUiQJcneHKQdGNbvVfxDnA+TLR4EbTO1WXC1VJF
	zgrm3jbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsO9-00000003rjR-2btr;
	Tue, 12 Nov 2024 15:01:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsMG-00000003rFI-1Elx
	for ath11k@lists.infradead.org;
	Tue, 12 Nov 2024 14:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AEB55C569E;
	Tue, 12 Nov 2024 14:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA7EC4CECD;
	Tue, 12 Nov 2024 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731423546;
	bh=DpsWLJxtohQJudxgWo/V7PQCzAkmAY48E5oG2OuDKmo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RCshjeoyuwM7Ojxw0bPmH++yRLgJ26P7Wvhx9yYlTWvW8W+bLZoX2imjVLgBxnDcZ
	 LGtXQB07WTs+77RVdXCjW3yBuWsJ+UkQveevGNzSGKgJYVdjcRzjayDmbgfKKCGXrl
	 RnJMMYQNBDbC8so7O/SLc0VNkmeUDocgeLWvgZFBskqzbE6FGipM5SlrhGY1SKbe2r
	 Z5MQi8WyFI0zWIXQbHGgncM51EVaYxEtcifejjYhKRr39v4VUT4NGbDBekvbxBGBr/
	 euuhNHbwuewtf9jBN6sevXh+tPHWFpecj5BW9L5jqJ9w7uO/jvygp4ZL6Oiy1m00Fp
	 9ji/0/uIBVdGw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: add support for QCA6698AQ
References: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
	<bb1c77cb-7efc-4c85-a946-5394b9105416@quicinc.com>
Date: Tue, 12 Nov 2024 16:59:03 +0200
In-Reply-To: <bb1c77cb-7efc-4c85-a946-5394b9105416@quicinc.com> (Jeff
	Johnson's message of "Thu, 31 Oct 2024 07:58:56 -0700")
Message-ID: <87o72k4hxk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_065908_397265_62A0C1BC 
X-CRM114-Status: GOOD (  15.64  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/30/2024 5:05 PM, Miaoqing Pan wrote:
>> QCA6698AQ IP core is the same as WCN6855 hw2.1, they share the same
>> PCI device ID, the same major and minor version numbers, the same
>> register address, and same HAL descriptors, etc. The most significant
>> difference is that QCA6698AQ has different RF, IPA, thermal, etc.
>> 
>> Follow the approach done in commit 5dc9d1a55e95 ("wifi: ath11k: add
>> support for QCA2066"), enumerate the subversion number to identify the
>> specific card.
>> 
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>> 
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>
> Am I correct that this satisfies at least a subset of the devices you were
> trying to support with the following?
> https://lore.kernel.org/all/20241024002514.92290-1-quic_miaoqing@quicinc.com/
>
> If so, can you reply to that thread, pointing to this new patch, and elaborate
> on what is now supported and what still requires ath11k to support
> board-specific firmware overrides?

That question is still open but otherwise this patch looks good to me.
But I'll give an Acked-by only after I understand what's that "NFA765
m.2 card for IoT platforms" mentioned in the other thread is.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

